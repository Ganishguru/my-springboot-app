resource "kubernetes_deployment" "app" {
  metadata {
    name = "springboot-app"
    labels = {
      app = "springboot"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "springboot"
      }
    }

    template {
      metadata {
        labels = {
          app = "springboot"
        }
      }

      spec {
        container {
          image = "springboot-app:latest"
          name  = "springboot"

          image_pull_policy = "Never"

          port {
            container_port = 8080
          }

          readiness_probe {
            http_get {
              path = "/"
              port = 8080
            }
            initial_delay_seconds = 5
            period_seconds        = 10
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_svc" {
  metadata {
    name = "springboot-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.app.spec[0].template[0].metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "NodePort"
  }
}
