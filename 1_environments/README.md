# 1. Multiple Environments

1. Variables
2. Playbook Imports
3. Kickoff by Environment
4. Vaults

## Setup

1. Install ansible
2. Create and populate vault key files (.gitignored):
    - `vault-keys/dev.key`
    - `vault-keys/prod.key`

*So you can test out with samples. Do not commit yours!*

- dev: `JqaprPGfMNjNop6ZGUcE6wxhdMebbciDzkjWEUNypcsqapaDZzVoCifGtvCsRArG`
- prod: `NQTZMVihXpDEhHTHRMKRqxKzZNZaqYkthzWgiw9VinMJCuMZTF7eBVtohvPGqNVp`

## Deploy

`./run_<env>.sh <playbook file>`

## Add Environment

1. Variables:
    - Copy `env_template.yml` as `envname.yml`
2. Secrets:
    - Create vault `envname.vault` with `env_template.vault` values
3. Vault Key:
    - Save vault key as `vault-keys/envname.key`
4. Kickoff:
    - Create `run_envname.sh` pointing at your new files

## Edit vault

`./editvault.sh <envname>`