provider "docker" {}

resource "docker_image" "webapp" {
  name = "local-webapp:latest"
  build {
    context    = "${path.module}/../app"
    dockerfile = "${path.module}/../app/Dockerfile"
  }
}

resource "docker_container" "webapp" {
  name  = "webapp"
  image = docker_image.webapp.latest
  ports {
    internal = 5000
    external = 8080
  }
}