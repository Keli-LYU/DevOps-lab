packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}


source "virtualbox-iso" "local_linux" {
  guest_os_type        = "Ubuntu_64" 
  iso_url              = "https://releases.ubuntu.com/22.04/ubuntu-22.04.3-live-server-amd64.iso"
  iso_checksum         = "sha256:a425f78de25433af0d0b230754961d5a4406a92b794458003ccfd4630a5202f6"  
  ssh_username         = "packer"
  ssh_password         = "packer"
  shutdown_command     = "echo 'packer' | sudo -S shutdown -P now"  
  cpus                 = 2
  memory               = 2048
  headless             = false   
  vm_name              = "sample-app-local-${uuidv4()}"
}

build {
  sources = ["source.virtualbox-iso.local_linux"]

  provisioner "file" {
    source      = "app.js"
    destination = "/home/packer/app.js"
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nodejs npm",
      "node -v"
    ]
    pause_before = "30s"
  }
}