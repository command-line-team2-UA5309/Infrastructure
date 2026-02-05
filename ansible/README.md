# Configuration

Before running the playbook, make sure to define these variables.
They are required for the database connection and app security:

* **db_name**: Name of your database
* **db_user**: Database username
* **db_password**: Password for the database user
* **secret_key**: Secret key for the Flask app

You can pass them directly in the command line:

```bash
ansible-playbook apps.yml -e "db_name=mydb db_user=myuser db_password=mypass secret_key=mysecret"
```

[EOF]
