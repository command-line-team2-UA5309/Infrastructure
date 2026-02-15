# Configuration

## Passing sensitive variables to the playbook

Before running some playbooks, make sure to define these variables.
You can pass them directly in the command line:

```bash
ansible-playbook <playbook-path> -e "db_name=mydb db_user=myuser..."
```

The list of playbooks and their required variables are listed below:

### Application VM playbook

* **db_name**: Name of your database
* **db_user**: Database username
* **db_password**: Password for the database user
* **secret_key**: Secret key for the Flask app

* **s3_endpoint**: Application S3 bucket endpoint
* **s3_access_key**: Access key for the application S3 bucket
* **s3_secret_key**: Secret key for the application S3 bucket
* **s3_bucket_name**: Application S3 bucket name

### PostgreSQL VM playbook

* **db_name**: Name of your database
* **db_user**: Database username
* **db_password**: Password for the database user
