---
all:
  vars:
%{ if enable_bastion }
    ansible_ssh_common_args: |
      -o ProxyCommand='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p -q ${ssh_user}@${bastion_nodes[0].ip} {% if ansible_ssh_private_key_file is defined %}-i {{ ansible_ssh_private_key_file }}{% endif %}'
%{ else }
    ansible_ssh_common_args: |
      -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null {% if ansible_ssh_private_key_file is defined %}-i {{ ansible_ssh_private_key_file }}{% endif %}'
%{ endif }
  hosts:
%{ for node in all_nodes }
    ${node.name}:
      ansible_host: ${node.ip}
      ip: ${node.ip}
      ansible_user: ${ssh_user}
      additional_disks: {}
%{ endfor }
  children:
    etcd:
      hosts: 
%{ for node in controlplane_nodes }
        ${node.name}: {}
%{ endfor }
    k8s-cluster:
      children:
        kube-node:
          hosts:
%{ for node in worker_nodes }
            ${node.name}: {}
%{ endfor }
        kube_control_plane:
          hosts:
%{ for node in controlplane_nodes }
            ${node.name}: {}
%{ endfor }
    ungrouped: {}
