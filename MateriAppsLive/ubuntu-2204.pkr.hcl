locals {
  headless = true
}

source "vmware-vmx" "ubuntu-2204" {
  # run configuration
  headless = local.headless

  # export
  format = "vmx"

  # input configuration
  source_path = "/mnt/ramfs/ubuntu-2204-cdinstall/packer-ubuntu-2204-cdinstall.vmx"

  # communicator configuration
  ssh_username           = "mdxuser"
  ssh_password           = "mdxuserpassword!"
  ssh_timeout            = "20m"
  ssh_handshake_attempts = "100"

  # shutdown configuration
  shutdown_command = "echo 'mdxuserpassword!' | sudo -S shutdown -P now"
}

build {
  source "sources.vmware-vmx.ubuntu-2204" {
    vm_name          = "ubuntu-2204"
    output_directory = "/mnt/ramfs/ubuntu-2204"
  }

  provisioner "ansible" {
    user = "mdxuser"
    playbook_file = "ansible/ubuntu.yml"
  }
}

