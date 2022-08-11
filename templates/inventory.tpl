---
all:
  vars:
%{ if enable_bastion }
    ansible_ssh_common_args: |
      -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p -q ${ssh_user}@${bastion_nodes[0].ansible_host} %{ if ssh_private_key_file != "" }-i ${ssh_private_key_file}%{ endif }'
%{ else }
    ansible_ssh_common_args: |
      -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null %{ if ssh_private_key_file != "" }-i ${ssh_private_key_file}%{ endif }'
%{ endif }
%{ if enable_vip_keepalived }
    vip_iface: <>
    vip_ip: <>
    vip_netmask: <>
    vip_port: <>
%{ endif }

  hosts:
%{ for node in all_nodes }
    ${node.name}:
      ansible_host: ${node.ansible_host}
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
