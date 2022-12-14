variable "enable_bastion" {
  description = "Whether to enable the SSH-proxy through the bastion node"
  type        = bool
  default     = false
}

variable "external_apiserver_ip" {
  description = "An external IP address for the API server to be used for kubeconfig building"
  type        = string
  default     = ""
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

variable "ssh_private_key_file" {
  description = "The name of the user used to access via SSH to the nodes"
  type        = string
  default     = ""
}
