module "secretpool" {
  source = "git::https://github.com/poseidon/typhoon//digital-ocean/container-linux/kubernetes?ref=v1.9.2"

  providers = {
    digitalocean = "digitalocean.default"
    local = "local.default"
    null = "null.default"
    template = "template.default"
    tls = "tls.default"
  }

  region   = "sfo2"
  dns_zone = "secretpool.org"

  cluster_name     = "k8s"
  image            = "coreos-stable"
  controller_count = 1
  controller_type  = "s-2vcpu-2gb"
  worker_count     = 3
  worker_type      = "s-2vcpu-4gb"
  ssh_fingerprints = ["7e:ae:d9:87:6b:c3:92:46:d2:7d:ae:f6:77:0b:88:fe"]

  # output assets dir
  asset_dir = "assets"
}
