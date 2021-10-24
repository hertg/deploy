HOSTNAME := $(shell hostname)

all: local

local:
	sudo ansible-playbook -c local -i $(HOSTNAME), local.yml

remote:
	sudo ansible-pull -U https://github.com/hertg/deploy