ansible-playbook \
	--extra-vars @./env_vars/prod.yml \
	--extra-vars @./env_vars/prod.vault \
	--vault-id vault-keys/prod.key \
	$1
