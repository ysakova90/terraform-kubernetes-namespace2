output "namespace" {
  description = "Outputs ns info"
  value       = kubernetes_namespace.example.metadata[0].name
}