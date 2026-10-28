resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.version_chart
  namespace        = "argocd"
  create_namespace = true
  timeout          = 600
}

resource "helm_release" "argocd_apps" {
  name             = "argocd-apps"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-apps"
  version          = "2.0.6"
  namespace        = "argocd"
  create_namespace = false

  values = [
    yamlencode({
      applications = {
        root = {
          namespace        = "argocd"
          additionalLabels = {}
          project          = "default"
          source = {
            repoURL        = var.depot
            targetRevision = "main"
            path           = "deploy/argocd"
          }
          destination = {
            server    = "https://kubernetes.default.svc"
            namespace = "argocd"
          }
          syncPolicy = {
            automated = {
              prune    = true
              selfHeal = true
            }
          }
        }
      }
    })
  ]
}
