terraform {
  backend "gcs" {
    bucket  = "tts-cloudrun-backend"
    prefix  = "tf-backend"
    credentials = "credentials.json"
  }
}