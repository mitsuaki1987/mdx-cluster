locals {
  headless = true
}

source "vmware-vmx" "ubuntu-2204-cluster-server" {
  # run configuration
  headless = local.headless

  # export
  format = "ova"

  # input configuration
  source_path = "/mnt/ramfs/ubuntu-2204/ubuntu-2204.vmx"

  # communicator configuration
  ssh_username           = "mdxuser"
  ssh_password           = "mdxuserpassword!"
  ssh_timeout            = "20m"
  ssh_handshake_attempts = "100"

  # shutdown configuration
  shutdown_command = "echo 'mdxuserpassword!' | sudo -S shutdown -P now"
}

build {
  source "sources.vmware-vmx.ubuntu-2204-cluster-server" {
    vm_name          = "ubuntu-2204-cluster-server"
    output_directory = "/mnt/ramfs/ubuntu-2204-cluster-server"
  }

  provisioner "ansible" {
    user = "mdxuser"
    playbook_file = "ansible/ubuntu-cluster-server.yml"
  }
}

