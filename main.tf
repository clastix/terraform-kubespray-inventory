locals {
  inventory = templatefile("${path.module}/templates/inventory.tpl", {
    all_nodes                  = concat(var.bastion_nodes, var.controlplane_nodes, var.worker_nodes)
    enable_bastion             = var.enable_bastion
    external_apiserver_address = var.external_apiserver_ip
    bastion_nodes              = var.bastion_nodes
    controlplane_nodes         = var.controlplane_nodes
    worker_nodes               = var.worker_nodes
    ssh_user                   = var.ssh_user
    ssh_private_key_file       = var.ssh_private_key_file
  })
}
