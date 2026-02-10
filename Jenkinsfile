pipeline {
    agent any

    parameters {
        string(name: 'DB_NAME', description: 'Name of your database')
        string(name: 'DB_USER', description: 'Database username')
        password(name: 'DB_PASSWORD', description: 'Password for the database user')
        password(name: 'SECRET_KEY', description: 'Secret key for the Flask app')
    }

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
                ansiblePlaybook(
                    credentialsId: 'vm_ssh_key', 
                    extraVars: [
                        db_name: "${params.DB_NAME}",
                        db_user: "${params.DB_USER}",
                        db_password: "${params.DB_PASSWORD}"
                    ],
                    installation: 'Ansible', 
                    playbook: 'ansible/postgresql.yml'
                )
            }
        }

        stage('Flask application playbook') {
            steps {
                ansiblePlaybook(
                    credentialsId: 'vm_ssh_key', 
                    extraVars: [
                        db_name: "${params.DB_NAME}",
                        db_user: "${params.DB_USER}",
                        db_password: "${params.DB_PASSWORD}",
                        secret_key: "${params.SECRET_KEY}"
                    ],
                    installation: 'Ansible', 
                    playbook: 'ansible/apps.yml'
                )
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
