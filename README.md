## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_nodes"></a> [bastion\_nodes](#input\_bastion\_nodes) | A list of bastion VM objects ({name string, ip string}) | `list(any)` | `[]` | no |
| <a name="input_controlplane_nodes"></a> [controlplane\_nodes](#input\_controlplane\_nodes) | A list of controlplane VM objects ({name string, ip string}) | `list(any)` | n/a | yes |
| <a name="input_enable_bastion"></a> [enable\_bastion](#input\_enable\_bastion) | Whether to enable the SSH-proxy through the bastion node | `bool` | `false` | no |
| <a name="input_external_apiserver_ip"></a> [external\_apiserver\_ip](#input\_external\_apiserver\_ip) | An external IP address for the API server to be used for kubeconfig building | `string` | `""` | no |
| <a name="input_ssh_private_key_file"></a> [ssh\_private\_key\_file](#input\_ssh\_private\_key\_file) | The name of the user used to access via SSH to the nodes | `string` | `""` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The name of the user used to access via SSH to the nodes | `string` | n/a | yes |
| <a name="input_worker_nodes"></a> [worker\_nodes](#input\_worker\_nodes) | A list of worker VM objects ({name string, ip string}) | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_inventory"></a> [inventory](#output\_inventory) | n/a |
