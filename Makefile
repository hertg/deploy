HOSTNAME := $(shell hostname)
LOGFILE := ansible_$(shell date +%s).log

all: local

local:
	sudo ansible-playbook -c local -i $(HOSTNAME), local.yml 2>&1 | tee $(LOGFILE)

remote:
	sudo ansible-pull -U https://github.com/hertg/deploy 2>&1 | tee $(LOGFILE)