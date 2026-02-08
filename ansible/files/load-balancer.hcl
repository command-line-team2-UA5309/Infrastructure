service {
  name = "load-balancer"
  port = 80

  check
  {
    id = "check-nginx-tcp",
    name = "nginx",
    tcp = "localhost:80",
    interval = "5s",
    timeout = "5s"
  }
}