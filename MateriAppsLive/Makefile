ubuntu: /mnt/ramfs/ubuntu-2204/ubuntu-2204.vmx
/mnt/ramfs/ubuntu-2204/ubuntu-2204.vmx: ubuntu-2204-cdinstall.pkr.hcl ubuntu-2204.pkr.hcl
	packer build ubuntu-2204-cdinstall.pkr.hcl
	packer build ubuntu-2204.pkr.hcl

materiapps-live: /mnt/ramfs/ubuntu-2204-materiapps-live/ubuntu-2204-materiapps-live.ova
/mnt/ramfs/ubuntu-2204-materiapps-live/ubuntu-2204-materiapps-live.ova: ubuntu-2204-materiapps-live.pkr.hcl /mnt/ramfs/ubuntu-2204/ubuntu-2204.vmx
	packer build ubuntu-2204-materiapps-live.pkr.hcl

.PHONY : fmt
fmt:
	packer fmt .

.PHONY : validate
validate:
	packer validate .

.PHONY : clean
clean:
	rm -rf /mnt/ramfs/*

