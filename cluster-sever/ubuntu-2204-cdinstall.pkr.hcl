locals {
  headless = true
  ubuntu_release = "22.04"
  ubuntu_version = "22.04.3"
}

source "vmware-iso" "ubuntu-2204-cdinstall" {
  # run configuration
  headless = local.headless

  # export
  format = "vmx"

  # ISO configuration
  iso_urls = [
    "http://releases.ubuntu.com/${local.ubuntu_release}/ubuntu-${local.ubuntu_version}-live-server-amd64.iso"
  ]
  iso_checksum = "sha256:a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"  # 22.04.3

  # vmware-iso configuration
  guest_os_type = "ubuntu-64"
  version = "18"
  vmx_data = {
    "bios.bootDelay" = "1500"
    "firmware": "efi"
  }

  vmx_data_post = {
    "ide0:0.devicetype" = "cdrom-raw"
    "ide0:0.filename" = "auto detect"
    "ide0:0.present" = "TRUE"
  }

  # hardware configuration
  cpus   = 16
  memory = 2048

  # communicator configuration
  ssh_username           = "mdxuser"
  ssh_password           = "mdxuserpassword!"
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "150"

  # shutdown configuration
  shutdown_command = "echo 'mdxuserpassword!' | sudo -S shutdown -P now"

  # cdrom files
  cd_files = ["cloud-init/user-data", "cloud-init/meta-data"]
  cd_label = "cidata"


#  boot_key_interval = "4ms"
  boot_wait = "5s"
  boot_command = [
    "e<wait>",
    "<down><down><down><wait>",
    "<end><wait>",
    " autoinstall<wait>",
    "<leftCtrlOn><x><leftCtrlOff>"
  ]
}

build {
  name = "ubuntu-2204"

  source "sources.vmware-iso.ubuntu-2204-cdinstall" {
    name             = "22.04"
    output_directory = "/mnt/ramfs/ubuntu-2204-cdinstall"
  }

  provisioner "ansible" {
    user = "mdxuser"
    playbook_file = "ansible/ubuntu-cdinstall.yml"
  }
}
