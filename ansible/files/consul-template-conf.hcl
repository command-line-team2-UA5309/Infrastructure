consul {
  address = "localhost:8500"

  retry {
    enabled  = true
    attempts = 12
    backoff  = "250ms"
  }
}

template {
  source      = "/etc/nginx/sites-available/loadbalancer.ctmpl"
  destination = "/etc/nginx/sites-available/loadbalancer"
  perms       = 0644
  command     = "service nginx reload"
}