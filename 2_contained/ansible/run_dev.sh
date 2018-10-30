ansible-playbook \
	-i ec2.py \
	--extra-vars @./env_vars/all_envs.yml \
	--extra-vars @./env_vars/dev.yml \
	--extra-vars @./env_vars/dev.vault \
	--vault-id vault-keys/dev.key \
	$1
