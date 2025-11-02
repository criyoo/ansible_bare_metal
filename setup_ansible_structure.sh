#!/bin/bash
# =====================================================
# Script: setup_ansible_structure.sh
# Purpose: Create a complete Ansible project directory
# =====================================================

set -e

# Base directory
BASE_DIR="ansible"

echo "Creating Ansible project structure under $(pwd)/${BASE_DIR}"

# Create directories
mkdir -p ${BASE_DIR}/inventories/production/group_vars
mkdir -p ${BASE_DIR}/inventories/production/host_vars
mkdir -p ${BASE_DIR}/inventories/staging
mkdir -p ${BASE_DIR}/playbooks
mkdir -p ${BASE_DIR}/roles/nginx/{defaults,vars,tasks,handlers,templates,meta}
mkdir -p ${BASE_DIR}/roles/patch/{defaults,tasks,meta}
mkdir -p ${BASE_DIR}/roles/firewall/{defaults,tasks,meta}
mkdir -p ${BASE_DIR}/vault

# Create files
touch ${BASE_DIR}/ansible.cfg
touch ${BASE_DIR}/inventories/production/hosts.ini
touch ${BASE_DIR}/inventories/production/group_vars/{all.yml,webservers.yml,patching.yml}
touch ${BASE_DIR}/inventories/production/host_vars/web01.example.yml
touch ${BASE_DIR}/playbooks/{site.yml,web.yml,patch.yml,firewall.yml}
touch ${BASE_DIR}/roles/nginx/{defaults/main.yml,vars/main.yml,tasks/main.yml,handlers/main.yml,templates/nginx.conf.j2,meta/main.yml}
touch ${BASE_DIR}/roles/patch/{defaults/main.yml,tasks/main.yml,meta/main.yml}
touch ${BASE_DIR}/roles/firewall/{defaults/main.yml,tasks/main.yml,meta/main.yml}
touch ${BASE_DIR}/group_vars_sample.yml
touch ${BASE_DIR}/host_vars_sample.yml
touch ${BASE_DIR}/vault/vault-example.yml
touch ${BASE_DIR}/requirements.yml
touch ${BASE_DIR}/README.md

# Add a note in the vault file (simulating an encrypted file)
echo "$ANSIBLE_VAULT;1.1;AES256" > ${BASE_DIR}/vault/vault-example.yml
echo "# This file is encrypted with ansible-vault" >> ${BASE_DIR}/vault/vault-example.yml

# Add minimal content to README
cat <<EOF > ${BASE_DIR}/README.md
# Ansible Project Structure

This repository contains a standard Ansible layout:
- **inventories/**: Environment-specific inventory files.
- **playbooks/**: Main playbooks for web, patching, firewall, etc.
- **roles/**: Modular roles (nginx, patch, firewall).
- **vault/**: Encrypted secrets with ansible-vault.
EOF

echo "✅ Ansible project structure created successfully!"
