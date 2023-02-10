vm/venv: requirements.txt
	python3 -m venv $@
	$@/bin/pip install -r $<

vm: vm/venv
	cd $@ && packer build .

deployment:
	cd $@ && terraform apply

clean:
	cd deployment && terraform destroy

.PHONY: vm deployment clean
