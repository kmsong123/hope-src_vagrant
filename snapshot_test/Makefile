
SHELL := bash
VAGRANTCMD := vagrant
VAGRANTMACHINE := hope-src

.PHONY: all

all: build

clean: Vagrantfile ## Destroy vagfrant instance and delete snapshots(s)
	@$(VAGRANTCMD) destroy $(VAGRANTMACHINE) --force
	@$(VAGRANTCMD) global-status --prune >/dev/null 2>&1

build: Vagrantfile build-1 build-2 build-3

build-1: Vagrantfile
	@echo "Stage 0: Configuring proxy settings"
	@sleep 3
	@PROXY_CONFIG=1 $(VAGRANTCMD) up $(VAGRANTMACHINE) --provision
	-@while $(VAGRANTCMD) status | grep -q "$(VAGRANTMACHINE).*running"; do sleep 1; done
	@$(VAGRANTCMD) halt -f
	@echo "Proxy settings configured successfully."
	@$(VAGRANTCMD) snapshot save --force $(VAGRANTMACHINE) "0-proxy-settings"

build-2:
	@echo "Stage 1: Installing dependencies"
	@DEPENDENCIES=1 $(VAGRANT_CMD) up $(VAGRANTMACHINE) --provision
	-@while $(VAGRANTCMD) status | grep -q "$(VAGRANTMACHINE).*running"; do sleep 1; done
	@$(VAGRANTCMD) halt -f
	echo "Dependencies successfully installed."
	@$(VAGRANTCMD) snapshot save --force $(VAGRANTMACHINE) "0-install-dependencies"

build-3:
	@echo "Cloning hope-src repository"
	@CLONE_REPO=1 $(VAGRANT_CMD) up $(VAGRANTMACHINE) --provision
	-@while $(VAGRANTCMD) status | grep -q "$(VAGRANTMACHINE).*running"; do sleep 1; done
	@$(VAGRANTCMD) halt -f
	echo "repository and submodules successfully cloned."
	@$(VAGRANTCMD) snapshot save --force $(VAGRANTMACHINE) "0-clone-repo"

build-4:
	@echo "Building hope-src repo"
	@BUILD=1 $(VAGRANTCMD) up $(VAGRANTMACHINE) --provision
	-@while $(VAGRANTCMD) status | grep -q "$(VAGRANTMACHINE).*running"; do sleep 1; done
	@$(VAGRANTCMD) halt -f
	echo "hope-src toolchain successfully built."
	@$(VAGRANTCMD) snapshot save --force $(VAGRANTMACHINE "0-build-repo"
	
