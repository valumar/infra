variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "us-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-1554733794"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-1554734066"
}
