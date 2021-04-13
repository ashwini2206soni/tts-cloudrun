variable "project" {
  default     = "ashwini-consulting"
  type        = string
  description = "The ID of the project where terraform resources are build"
}

variable "location" {
  default     = "us-central1"
  type        = string
  description = "The location of the GCP resources"
}

variable "container_image" {
  default     = "gcr.io/ashwini-consulting/front"
  type        = string
  description = "Image of a container"
}

variable "container_tags" {
  type        = string
  description = "Tag of a container"
}
variable "container_port" {
  default     = 8080
  type        = number
  description = "Port at which container is running"
}
variable "container_memory" {
  default     = "512Mi"
  type        = string
  description = "Memory of a container"
}
