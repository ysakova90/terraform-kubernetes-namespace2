output "namespace" {
  description = "Outputs ns information"
  value       = kubernetes_namespace.example.metadata[0].name
}