# Ansible Collection - stanislawhorna.ansible

Modular Ansible roles designed to automate the setup, configuration,
and management of internal Home Lab systems

## Getting Started

### Prerequisites

- Ansible installed on your system
- Access to a HashiCorp Vault instance
  (if using roles like `hcp_vault_ssh_setup` or `docker_install_local_registry`)
- SSH access to target systems

### Setup

1. Create a collection requirements file in your Ansible project and add there entry below ([example](https://github.com/HornaHomeLab/pve-r7/blob/main/ansible/collections/requirements.yml#L5C1-L8C18)):

```YAML
  - name: stanislawhorna.ansible
    source: https://github.com/StanislawHorna/Ansible.git
    type: git
    version: main
```

2. Create a playbook and refer to roles from this collection in format ([example](https://github.com/HornaHomeLab/pve-r7/blob/main/ansible/docker.yml#L9C1-L14C19)):

```YAML
roles:
    - role: stanislawhorna.ansible.hcp_vault_ssh_setup
    - role: stanislawhorna.ansible.install_docker
        become: true
    - role: stanislawhorna.ansible.docker_install_local_registry
        become: true
```

## Ansible Roles

| Role Name                                                                            | Description                                                                             | Variables                                                                                                                                                                                                                                        |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [disable_swap_memory](/roles/disable_swap_memory/tasks/main.yml)                     | Disables swap memory on Ubuntu machine                                                  |                                                                                                                                                                                                                                                  |
| [docker_install_local_registry](/roles/docker_install_local_registry/tasks/main.yml) | Installs local self hosted Docker registry for docker daemon                            | - vault_url<br> - vault_role_id<br> - vault_secret_id<br> - registry_url<br> - vault_registry_cert_mount_point<br> - vault_path_registry_cert<br> - vault_registry_cert_field<br> - docker_cert_dir<br> - cert_filename                          |
| [hcp_consul](/roles/hcp_consul/tasks/main.yml)                                       | Sets up HashiCorp Consul on Ubuntu servers.                                             | - nomad_version<br> - nomad_user<br> - nomad_group<br> - nomad_install_dir<br> - nomad_config_dir<br> - nomad_data_dir<br> - nomad_alloc_dir<br> - cluster_size                                                                                  |
| [hcp_nomad](/roles/hcp_nomad/tasks/main.yml)                                         | Sets up HashiCorp Nomad on Ubuntu servers.                                              | - consul_version<br> - consul_user<br> - consul_group<br> - consul_install_dir<br> - consul_config_dir<br> - consul_data_dir<br> - cluster_size                                                                                                  |
| [hcp_vault_ssh_setup](/roles/hcp_vault_ssh_setup/tasks/main.yml)                     | Fetch SSH private key from HashiCorp Vault using AppRole and prepare for the connection | - vault_url<br> - vault_role_id<br> - vault_secret_id<br> - vault_validate_certs<br> - vault_vm_ssh_access_key_mount_point<br> - vault_vm_ssh_access_key_field<br> - vault_vm_ssh_access_key_path<br> - ssh_key_temp_dir<br> - ssh_key_temp_path |
| [install_brew](/roles/install_brew/tasks/main.yml)                                   | Install brew package manager                                                            |                                                                                                                                                                                                                                                  |
| [install_docker](/roles/install_docker/tasks/main.yml)                               | Installs docker on Ubuntu machine                                                       |                                                                                                                                                                                                                                                  |
| [install_gh_cli](/roles/install_gh_cli/tasks/main.yml)                               | Installs GitHub CLI tool                                                                |                                                                                                                                                                                                                                                  |
| [install_oh_my_posh](/roles/install_oh_my_posh/tasks/main.yml)                       | Install Oh My Posh prompt theme engine and set theme from GitHub Gist                   | - oh_my_posh_theme_gist_url<br> - oh_my_posh_dir                                                                                                                                                                                                 |
| [install_pwsh](/roles/install_pwsh/tasks/main.yml)                                   | Install Powershell on Ubuntu Server                                                     |                                                                                                                                                                                                                                                  |
| [k3s_install_local_registry](/roles/k3s_install_local_registry/tasks/main.yml)       | Installs local self hosted Docker registry for k3s cluster                              | - vault_url<br> - vault_role_id<br> - vault_secret_id<br> - vault_validate_certs<br> - registry_url<br> - vault_registry_cert_mount_point<br> - vault_registry_cert_path<br> - vault_registry_cert_field<br> - registry_cert_local_k3s_path      |
| [k3s_install_nginx_ingress](/roles/k3s_install_nginx_ingress/tasks/main.yml)         | Installs Nginx Ingress Controller for k3s cluster                                       |                                                                                                                                                                                                                                                  |
| [set_ssh_ca_cert](/roles/set_ssh_ca_cert/tasks/main.yml)                             | Fetch SSH root CA from HashiCorp Vault and sets it on the host to allow for login       | - vault_url<br> - vault_role_id<br> - vault_secret_id<br> - vault_validate_certs<br> - vault_ssh_ca_mount_point<br> - vault_ssh_ca_pub_field<br> - vault_ssh_ca_path<br> - ssh_ca_local_path<br> - sshd_config_local_path<br> - ssh_service_name |
| [upgrade_packages](/roles/upgrade_packages/tasks/main.yml)                           | Simple apt update and upgrade, with conditional reboot and retry if it failed           |                                                                                                                                                                                                                                                  |
