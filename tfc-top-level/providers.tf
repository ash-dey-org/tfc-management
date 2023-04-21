terraform {
  required_providers {
    tfe = ">= 0.44"
  }

  required_version = ">= 1.3.0"

  # define terraform cloud targets e.g. organization and workspace
  cloud {}

}