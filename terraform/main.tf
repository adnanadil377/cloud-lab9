resource "kubernetes_deployment" "hello_fn" {
  metadata {
    name      = "hello-fn"
    namespace = "openfaas-fn"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hello-fn"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-fn"
        }
      }

      spec {
        container {
          name  = "hello-fn"
          image = "adnan23bcs35/hello-fn:latest"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}