service {
  name = "bird-app"
  port = 80

  checks = [
    {
      id = "check-nginx-tcp",
      name = "nginx",
      tcp = "localhost:80",
      interval = "5s",
      timeout = "5s"
    },
    {
      id = "check-app-http",
      name = "app",
      http = "http://localhost:8080"
      interval = "15s"
    }
  ]
}