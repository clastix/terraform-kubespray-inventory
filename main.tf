locals {
  inventory = templatefile("templates/inventory.tpl", {
    all_nodes          = concat(var.bastion_nodes, var.controlplane_nodes, var.worker_nodes)
    enable_bastion     = var.enable_bastion
    bastion_nodes      = var.bastion_nodes
    controlplane_nodes = var.controlplane_nodes
    worker_nodes       = var.worker_nodes
    ssh_user           = var.ssh_user
  })
}
