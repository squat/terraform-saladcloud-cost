output "cost" {
  description = "The cost per hour of running a container group with these resources."
  value       = 0.004 * var.cpu + 0.001 * var.memory + sum(concat([for g in var.gpu_classes : local.gpu_classes[g].price], [0]))
}
