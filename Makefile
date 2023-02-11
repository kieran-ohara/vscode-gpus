vm/venv: requirements.txt
	python3 -m venv $@
	$@/bin/pip install -r $<

vm: vm/venv vm/ansible/collections
	cd $@ && packer build .

deployment:
	cd $@ && terraform apply

clean:
	cd deployment && terraform destroy

vm/ansible/collections: vm/ansible/requirements.yml vm/venv
	vm/venv/bin/ansible-galaxy collection install -f --collections-path $@ -r $<
	touch $@

.PHONY: vm deployment clean
