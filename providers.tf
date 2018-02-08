variable "token" {
  type        = "string"
  description = "Digital Ocean token"
}

provider "digitalocean" {
  version = "0.1.3"
  alias = "default"
  token = "${var.token}"
}

provider "local" {
  version = "~> 1.0"
  alias = "default"
}

provider "null" {
  version = "~> 1.0"
  alias = "default"
}

provider "template" {
  version = "~> 1.0"
  alias = "default"
}

provider "tls" {
  version = "~> 1.0"
  alias = "default"
}
