provider "digitalocean" {
  version = "0.1.3"
  alias = "default"
  token = "107c684cc64c22cc9d5e89804993d060d3d3f23409555bbf45617a41aa34d84f"
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
