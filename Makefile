vm/venv: requirements.txt
	python -m venv $@
	$@/bin/pip install -r $<

vm: vm/venv
	cd $@ && packer build .

deployment:
	cd $@ && terraform apply

.PHONY: vm deployment
