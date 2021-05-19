job "thumbor" {
  datacenters = ["dc1"]
  type = "service"

  group "deploy" {
    count = 1
    task "thumbor" {
      driver = "docker"
      config {
        image = "artifactory-gojek.golabs.io:6555/app-thumbor:1.0.0"
      }

      resources {
        cpu    = 256
        memory = 256

        network {
          mbits = 10
          port  "http"  {
            static = 8080
          }
        }
      }

    }
  }
}

