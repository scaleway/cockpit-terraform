# Using Cockpit with Terraform

## Overview 

This repository contains a `main.tf` file containing code to create Cockpit resources. The aim of this repository is to provide a configuration file in which there are only a few edits to make.

In the configuration file we:

- define the Scaleway Project ID where the resources will be created
- define the Scaleway and Grafana Terraform providers to use
- use the Cockpit of the Project ID we have previously defined
- create a Grafana user with the [editor role](https://www.scaleway.com/en/docs/observability/cockpit/concepts/#grafana-users)
- create a Grafana folder in the Grafana user interface to see our metrics
- create a push token to query and push metrics in the defined Project
- create a metric [data source](https://www.scaleway.com/en/docs/observability/cockpit/concepts/#data-sources)

Find the whole tutorial on the Scaleway documentation website.
