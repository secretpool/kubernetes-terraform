module "digital-ocean-secretpool" {
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

  cluster_name     = "secretpool"
  image            = "coreos-stable"
  controller_count = 1
  controller_type  = "s-2vcpu-2gb"
  worker_count     = 3
  worker_type      = "s-2vcpu-4gb"
  ssh_fingerprints = ["d7:9d:79:ae:56:32:73:79:95:88:e3:a2:ab:5d:45:e7"]

  # output assets dir
  asset_dir = "./assets"
}
