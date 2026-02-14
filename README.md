# Infrastructure

## How to set up pre-commit hooks

1. Install pre-commit from <https://pre-commit.com/#install>
2. Run `pre-commit install`
3. Auto-update the config to the latest version `pre-commit autoupdate`

## How to set up Jenkins with Ansible

1. [Install Jenkins](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

2. Go to <http://192.168.56.15:8080> (or <http://localhost:8080> if setting up on a host machine)
and follow installation guide

    * When prompted, install recommended plugins

3. [Install Ansible globally](https://docs.ansible.com/projects/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu)

4. [Install Jenkins plugin for Ansible](https://plugins.jenkins.io/ansible/)

    * Go to Manage Jenkins -> Plugins -> Available plugins
    * Search 'Ansible' and download first option
    * Go to Manage Jenkins -> Tools -> Ansible installation -> Add Ansible
    * Name the installation `Ansible` and use `/usr/bin` as path
    * Click 'Save'

5. Import pipeline:

    * Click New Item on the home page
    * Select 'Pipeline' item type and name your pipeline
    * Go to Pipeline -> Definition and choose
    'Pipeline script from SCM'
    * Choose Git and paste this repository URL
    * Paste `refs/heads/main` as 'Branch Specifier'
    * Click 'Save'

6. Set up secrets:

    * Go to Manage Jenkins -> Credentials -> System ->
    Global credentials -> Add Credentials
    * Add SSH key for the virtual machines and use `vm_ssh_key` as the credentials' ID
    * Add secrets for the playbooks with the following IDs:

    1. `database_name` (Secret text)
    2. `database_credentials` (Username with password)
    3. `flask_secret_key` (Secret text)
    4. `application_s3_endpoint` (Secret text)
    5. `application_s3_access_key` (Secret text)
    6. `application_s3_secret_key` (Secret text)
    7. `application_s3_bucket_name` (Secret text)

    (Detailed list of Ansible variables can be found in README.md
    in ansible directory of the repository)

7. Run pipeline
