variable "nom_cluster" {
  description = "Nom du cluster Kubernetes"
  type        = string
  default     = "plateforme"
}

variable "version_argocd" {
  description = "Version du chart Helm d'Argo CD"
  type        = string
  default     = "10.10.3"
}

variable "depot" {
  description = "URL HTTPS du dépôt GitOps"
  type        = string
}