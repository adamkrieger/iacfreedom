ansible-playbook \
	--extra-vars @./env_vars/dev.yml \
	--extra-vars @./env_vars/dev.vault \
	--vault-id vault-keys/dev.key \
	$1
