HOSTNAME := $(shell hostname)
#LOGFILE := ansible_$(shell date +%s).log

all: local

galaxy:
	sudo ansible-galaxy collection install -r requirements.yml

check:
	sudo ansible-playbook --check -c local -i $(HOSTNAME), local.yml

local: galaxy
	sudo ansible-playbook -c local -i $(HOSTNAME), local.yml

remote: galaxy
	sudo ansible-pull -U https://github.com/hertg/deploy