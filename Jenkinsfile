pipeline {
    agent any

    environment {
        ANSIBLE_CONFIG = 'ansible/ansible.cfg'
    }

    stages {
        stage('PostgreSQL playbook') {
            steps {
                ansiblePlaybook credentialsId: 'vm_ssh_key', installation: 'Ansible', playbook: 'ansible/postgresql.yml'
            }
        }
    }
}