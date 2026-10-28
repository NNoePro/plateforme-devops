output "endpoint" {
  description = "Adresse du cluster Kubernetes"
  value       = kind_cluster.plateforme.endpoint
}

output "client_certificate" {
  description = "Certificat du client Kubernetes"
  value       = kind_cluster.plateforme.client_certificate
}

output "client_key" {
  description = "Clé du client Kubernetes"
  value       = kind_cluster.plateforme.client_key
}

output "cluster_ca_certificate" {
  description = "Certificat de l'autorité de certification Kubernetes"
  value       = kind_cluster.plateforme.cluster_ca_certificate
}