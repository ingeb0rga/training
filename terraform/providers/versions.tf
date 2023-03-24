terraform {
  required_version = ">= 1.0.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
    tls = {
      source  = "hashicorp/tls"
    }
    helm = {
      source  = "hashicorp/helm"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
    }
    null = {
      source  = "hashicorp/null"
    }
    random = {
      source  = "hashicorp/random"
    }
    archive = {
      source  = "hashicorp/archive"
    }
    local = {
      source  = "hashicorp/local"
    }
    vault = {
      source  = "hashicorp/vault"
    }
  }
}
