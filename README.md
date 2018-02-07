# Typhoon <img align="right" src="https://storage.googleapis.com/poseidon/typhoon-logo.png">

Typhoon is a minimal and free Kubernetes distribution.

* Minimal, stable base Kubernetes distribution
* Declarative infrastructure and configuration
* Free (freedom and cost) and privacy-respecting
* Practical for labs, datacenters, and clouds

Typhoon distributes upstream Kubernetes, architectural conventions, and cluster addons, much like a GNU/Linux distribution provides the Linux kernel and userspace components.

## Features <a href="https://www.cncf.io/certification/software-conformance/"><img align="right" src="https://storage.googleapis.com/poseidon/certified-kubernetes.png"></a>

* Kubernetes v1.9.2 (upstream, via [kubernetes-incubator/bootkube](https://github.com/kubernetes-incubator/bootkube))
* Single or multi-master, workloads isolated on workers, [Calico](https://www.projectcalico.org/) or [flannel](https://github.com/coreos/flannel) networking
* On-cluster etcd with TLS, [RBAC](https://kubernetes.io/docs/admin/authorization/rbac/)-enabled, [network policy](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
* Ready for Ingress, Dashboards, Metrics, and other optional [addons](https://typhoon.psdn.io/addons/overview/)

## Docs

Please see the [official docs](https://typhoon.psdn.io) and the Digital Ocean [tutorial](https://typhoon.psdn.io/digital-ocean/).
Read [concepts](https://typhoon.psdn.io/concepts/) to learn about Terraform, modules, and organizing resources.

## Install
Install terraform on your system:
```
$ brew install terraform
```

Add the terraform-provider-ct plugin binary for your system:
```
$ wget https://github.com/coreos/terraform-provider-ct/releases/download/v0.2.0/terraform-provider-ct-v0.2.0-linux-amd64.tar.gz
$ tar xzf terraform-provider-ct-v0.2.0-linux-amd64.tar.gz
$ mv terraform-provider-ct-v0.2.0-linux-amd64/terraform-provider-ct /usr/local/bin/
```

Add the plugin to your ~/.terraformrc:
```
providers {
  ct = "/usr/local/bin/terraform-provider-ct"
}
```

Initial bootstrapping requires bootkube.service be started on one controller node. Terraform uses ssh-agent to automate this step. Add your SSH private key to ssh-agent:
```
$ ssh-add ~/.ssh/id_rsa
$ ssh-add -L
```

Initialize the config directory if this is the first use with Terraform:
```
$ terraform init
```

Get or update Terraform modules:
```
$ terraform get            # downloads missing modules
$ terraform get --update   # updates all modules
Get: git::https://github.com/poseidon/typhoon (update)
Get: git::https://github.com/poseidon/bootkube-terraform.git?ref=v0.10.0 (update)
```

Plan the resources to be created:
```
$ terraform plan
Plan: 54 to add, 0 to change, 0 to destroy.
```

Apply the changes to create the cluster:
```
$ terraform apply
module.digital-ocean-nemo.null_resource.bootkube-start: Still creating... (30s elapsed)
module.digital-ocean-nemo.null_resource.bootkube-start: Provisioning with 'remote-exec'...
...
module.digital-ocean-nemo.null_resource.bootkube-start: Still creating... (6m20s elapsed)
module.digital-ocean-nemo.null_resource.bootkube-start: Creation complete (ID: 7599298447329218468)

Apply complete! Resources: 54 added, 0 changed, 0 destroyed.
```

In 3-6 minutes, the Kubernetes cluster will be ready.
