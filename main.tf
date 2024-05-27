## Defines the Scaleway Project ID where we will create our resources
variable "project_id" {
  type        = string
  description = "ID of the Scaleway Project"
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # Replace with the Scaleway Project ID of your choice
}

terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
    grafana = {
      source = "grafana/grafana"
    }
  }
  required_version = ">= 0.13"
}

## Uses the Cockpit that belongs to the Project ID defined above
resource "scaleway_cockpit" "main" {
  project_id = var.project_id
}

## Creates a Grafana user in the defined Project
resource "scaleway_cockpit_grafana_user" "main" {
  project_id = var.project_id
  login      = "your-grafana-user" # Replace with the name of your Grafana user
  role       = "editor"
}

provider "grafana" {
  url  = scaleway_cockpit.main.endpoints.0.grafana_url
  auth = "${scaleway_cockpit_grafana_user.main.login}:${scaleway_cockpit_grafana_user.main.password}"
}

## Creates a Grafana folder in the Grafana user interface
resource "grafana_folder" "folder_test" {
  title    = "Test Folder" # Replace with a name of yout choice
}

## Creates a push token to query and push metrics in the defined Project
resource "scaleway_cockpit_token" "main" {
  project_id = var.project_id
  name       = "your-push-token" # Replace with a name of yout choice
  scopes {
    query_metrics = true
    write_metrics = true
    query_logs = false
    write_logs = false
  }
}

## Creates a metric data source
resource "scaleway_cockpit_source" "main" {
  project_id = var.project_id
  name       = "your-data-source" # Replace with a name of yout choice
  type       = "metrics"
}

