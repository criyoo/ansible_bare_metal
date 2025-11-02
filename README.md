# Ansible Project Structure

This repository contains a standard Ansible layout:
- **inventories/**: Environment-specific inventory files.
- **playbooks/**: Main playbooks for web, patching, firewall, etc.
- **roles/**: Modular roles (nginx, patch, firewall).
- **vault/**: Encrypted secrets with ansible-vault.
