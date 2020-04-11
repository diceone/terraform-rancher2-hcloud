resource "hcloud_server" "k8sserver" {
  count       = "1"
  image       = var.k8sserver-image
  name        = "${var.prefix}-k8sserver"
  server_type = var.server_type
  user_data   = data.template_file.userdata_server.rendered
  ssh_keys    = var.ssh_keys
}

resource "hcloud_server" "k8s-all" {
  count       = var.count_k8s_all_nodes
  image       = var.k8sserver-image
  name        = "${var.prefix}-k8s-${count.index}-all"
  server_type = var.server_type
  user_data   = data.template_file.userdata_agent.rendered
  ssh_keys    = var.ssh_keys
}

resource "hcloud_server" "k8s-etcd" {
  count       = var.count_k8s_etcd_nodes
  image       = var.k8sworker-image
  name        = "${var.prefix}-k8s-${count.index}-etcd"
  server_type = var.server_type
  user_data   = data.template_file.userdata_agent.rendered
  ssh_keys    = var.ssh_keys
}

resource "hcloud_server" "k8s-controlplane" {
  count       = var.count_k8s_controlplane_nodes
  image       = var.k8sworker-image
  name        = "${var.prefix}-k8s-${count.index}-controlplane"
  server_type = var.server_type
  user_data   = data.template_file.userdata_agent.rendered
  ssh_keys    = var.ssh_keys
}

resource "hcloud_server" "k8s-worker" {
  count       = var.count_k8s_worker_nodes
  image       = var.k8sworker-image
  name        = "${var.prefix}-k8s-${count.index}-worker"
  server_type = var.server_type
  user_data   = data.template_file.userdata_agent.rendered
  ssh_keys    = var.ssh_keys
}

data "template_file" "userdata_server" {
  template = file("${path.module}/files/userdata_server")

  vars = {
    admin_password        = var.admin_password
    cluster_name          = var.cluster_name
    docker_version_server = var.docker_version_server
    rancher_version       = var.rancher_version
  }
}

data "template_file" "userdata_agent" {
  template = file("${path.module}/files/userdata_agent")

  vars = {
    admin_password        = var.admin_password
    cluster_name          = var.cluster_name
    docker_version_worker = var.docker_version_worker
    server_address        = hcloud_server.k8sserver[0].ipv4_address
    rancher_version       = var.rancher_version
    docker_version_agent  = var.docker_version_worker
  }
}

