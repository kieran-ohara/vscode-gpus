build/venv: requirements.txt
	python -m venv $@
	$@/bin/pip install -r $<

image: build/venv
	cd build && packer build .

.PHONY: image
