service {
  name = "postgresql"
  port = 5432

  check     
  {
    id =  "check-postgresql-tcp",
    name = "postgresql",
    tcp  = "localhost:5432",
    interval = "5s",
    timeout = "5s"
  }
}