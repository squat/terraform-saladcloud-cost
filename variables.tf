variable "cpu" {
  description = "The number of vCPUs."
  type        = number
  default     = 1

  validation {
    condition     = var.cpu >= 1 && var.cpu <= 16 && floor(var.cpu) == var.cpu
    error_message = "Accepted values: 1-16."
  }
}

variable "memory" {
  description = "The amount of memory in GB."
  type        = number
  default     = 1

  validation {
    condition     = var.memory >= 1 && var.memory <= 30 && floor(var.memory) == var.memory
    error_message = "Accepted values: 1-30."
  }
}

variable "gpu_classes" {
  description = "The GPUs that should be attatched."
  type        = list(string)
  default     = []
}
