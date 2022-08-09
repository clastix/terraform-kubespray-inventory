variable "enable_bastion" {
  description = "Whether to enable the SSH-proxy through the bastion node"
  type        = bool
  default     = false
}

variable "bastion_nodes" {
  description = "A list of bastion VM objects ({name string, ip string})"
  type        = list(any)
  default     = []
}

variable "controlplane_nodes" {
  description = "A list of controlplane VM objects ({name string, ip string})"
  type        = list(any)
}

variable "worker_nodes" {
  description = "A list of worker VM objects ({name string, ip string})"
  type        = list(any)
}

variable "ssh_user" {
  description = "The name of the user used to access via SSH to the nodes"
  type        = string
}
