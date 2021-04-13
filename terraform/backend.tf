terraform {
  backend "gcs" {
    bucket  = "ashwini-consulting-backend"
    prefix  = "tf-backend"
    credentials = file("credentials.json")
  }
}