provider "google" {
  project     = var.project
  credentials = "credentials.json"
}



resource "google_cloud_run_service" "todofront" {
  
  name       = "cloudrun-to-do-app-front"
  location   = var.location

  template {
    spec {
      containers {
        image = "${var.container_image}:${var.container_tags}"
        ports {
          container_port = var.container_port
        }
        resources {
          limits = {
            memory = "512Mi"
          }
        }
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}
data "google_iam_policy" "noauthfront" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "frontpolicy" {
  location    = google_cloud_run_service.todofront.location
  project     = google_cloud_run_service.todofront.project
  service     = google_cloud_run_service.todofront.name
  policy_data = data.google_iam_policy.noauthfront.policy_data
}

# resource "google_cloud_run_domain_mapping" "default" {
#   location = "us-central1"
#   name     = "audify.ashwini.consulting"

#   metadata {
#     namespace = "tts-cloudrun"
#   }

#   spec {
#     route_name = google_cloud_run_service.todofront.name
#   }
# }


# output "url" {
#   value = "${google_cloud_run_service.todofront.status[0].url}"
# }