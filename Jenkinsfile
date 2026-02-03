pipeline {
    agent any

    stages {
        stage('PostgreSQL playbook') {
            steps {
                ansiblePlaybook credentialsId: '462d1b3b-9945-458b-a6e4-c796641386a3', installation: 'Ansible', inventory: 'Ansible/inventory/inventory.yaml', playbook: 'Ansible/postgresql_playbook.yaml', vaultTmpPath: ''
            }
        }
    }
}