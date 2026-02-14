pipeline {
    agent any

    environment {
        ANSIBLE_CONFIG = 'ansible/ansible.cfg'
    }

    stages {
        stage('Consul playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'vm_ssh_key',
                    installation: 'Ansible',
                    playbook: 'ansible/consul.yml'
                )
            }
        }

        stage('PostgreSQL playbook') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'database_name',
                        variable: 'DB_NAME'
                    ),
                    usernamePassword(
                        credentialsId: 'database_credentials',
                        passwordVariable: 'DB_PASSWORD',
                        usernameVariable: 'DB_USER'
                    )
                ]) {
                    ansiblePlaybook(
                        credentialsId: 'vm_ssh_key',
                        extraVars: [
                            db_name: "$DB_NAME",
                            db_user: "$DB_USER",
                            db_password: "$DB_PASSWORD"
                        ],
                        installation: 'Ansible',
                        playbook: 'ansible/postgresql.yml'
                    )
                }
            }
        }

        stage('Flask application playbook') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'database_name',
                        variable: 'DB_NAME'
                    ),
                    usernamePassword(
                        credentialsId: 'database_credentials',
                        passwordVariable: 'DB_PASSWORD',
                        usernameVariable: 'DB_USER'
                    ),
                    string(
                        credentialsId: 'flask_secret_key',
                        variable: 'SECRET_KEY'
                    ),
                    string(
                        credentialsId: 'application_s3_endpoint',
                        variable: 'S3_ENDPOINT'
                    ),
                    string(
                        credentialsId: 'application_s3_access_key',
                        variable: 'S3_ACCESS_KEY'
                    ),
                    string(
                        credentialsId: 'application_s3_secret_key',
                        variable: 'S3_SECRET_KEY'
                    ),
                    string(
                        credentialsId: 'application_s3_bucket_name',
                        variable: 'S3_BUCKET_NAME'
                    )
                ]) {
                    ansiblePlaybook(
                        credentialsId: 'vm_ssh_key',
                        extraVars: [
                            db_name: "$DB_NAME",
                            db_user: "$DB_USER",
                            db_password: "$DB_PASSWORD",
                            secret_key: "$SECRET_KEY",
                            s3_endpoint: "$S3_ENDPOINT",
                            s3_access_key: "$S3_ACCESS_KEY",
                            s3_secret_key: "$S3_SECRET_KEY",
                            s3_bucket_name: "$S3_BUCKET_NAME"
                        ],
                        installation: 'Ansible',
                        playbook: 'ansible/apps.yml'
                    )
                }
            }
        }

        stage('Load balancer playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'vm_ssh_key',
                    installation: 'Ansible',
                    playbook: 'ansible/loadbalancer.yml'
                )
            }
        }
    }
}
