# Fetch SSH keys from HashiCorp Vault

Fetch SSH private key from HashiCorp Vault using AppRole and prepare for the connection

## Dependencies

This role requires the following Ansible collection:

- `community.hashi_vault >= 6.2.0`

Install it with:

```bash
ansible-galaxy collection install community.hashi_vault

### Variables

You can set these via environment or playbook vars:

| Variable                   | Env                                      | Description                                                  |
| -------------------------- | ---------------------------------------- | ------------------------------------------------------------ |
| `vault_url`                | `ANSIBLE_HASHI_VAULT_ADDR`               | Vault server URL, defaults to: `http://localhost:8200`       |
| `vault_role_id`            | `ANSIBLE_HASHI_VAULT_ROLE_ID`            | AppRole Role ID                                              |
| `vault_secret_id`          | `ANSIBLE_HASHI_VAULT_SECRET_ID`          | AppRole Secret ID                                            |
| `vault_validate_certs`     | `ANSIBLE_HASHI_VAULT_VALIDATE_CERTS`     | Bool whether to check a HCP cert or not, defaults to: `true` |
| `vault_secret_mount_point` | `ANSIBLE_HASHI_VAULT_SECRET_MOUNT_POINT` | KV engine mount                                              |
| `vault_secret_field`       | `ANSIBLE_HASHI_VAULT_SECRET_FIELD`       | Field to fetch from HCP Vault, defaults to: `private_key`    |
| `vault_path`               |                                          | Secret path inside mount                                     |
```
