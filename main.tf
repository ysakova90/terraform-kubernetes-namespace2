resource "kubernetes_namespace" "example" {
  metadata {
    name        = var.name
    annotations = var.annotations
    labels      = var.labels
  }
}

resource "kubernetes_resource_quota" "example" {
  metadata {
    name = "pod-quota"
    namespace = kubernetes_namespace.example.metadata[0].name
  }
  spec {
    hard ={
      pods = var.pod_quota
    }
    scopes = ["BestEffort"]
  }
}


resource "kubernetes_limit_range" "example" {
  metadata {
    name = "pod-limit-range"
    namespace = kubernetes_namespace.example.metadata[0].name
  }
  spec {
    limit {
      type = "Pod"
      max = {
        cpu    = var.pod_cpu_limit
        memory = var.pod_memory_limit
      }
    }
  }
}

