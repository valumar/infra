provider "google" {
    project = "otus-236614"
    region = "us-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app"
    machine_type = "f1-micro"
    zone = "us-west1-b" 
    tags = ["reddit-app"]
    metadata {
        sshKeys = "appuser:${file("~/.ssh/appuser.pub")}"
    }

    # определение загрузочного диска
    boot_disk {
        initialize_params {
            image = "reddit-base-1554544934"
        }
    }
    # определение сетевого интерфейса
    network_interface {
        # сеть, к которой присоединить данный интерфейс
        network = "default"
        # использовать ephemeral IP для доступа из Интернет
        access_config {}
    }

    connection {
        type = "ssh"
        user = "appuser"
        agent = false
        private_key = "${file("~/.ssh/appuser")}"
    }

    provisioner "file" {
        source = "files/puma.service"
        destination = "/tmp/puma.service"
    }

    provisioner "remote-exec" {
        script = "files/deploy.sh"
    }

}

resource "google_compute_firewall" "firewall_puma" {
    name = "allow-puma-default"
    # Название сети, в которой действует правило
    network = "default"
    # Какой доступ разрешить
    allow {
        protocol = "tcp"
        ports = ["9292"]
    }
    # Каким адресам разрешаем доступ
    source_ranges = ["0.0.0.0/0"]
    # Правило применимо для инстансов с тегом …
    target_tags = ["reddit-app"]
}
