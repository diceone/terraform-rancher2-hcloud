# Admin password to access Rancher
admin_password = "admin"
# Resources will be prefixed with this to avoid clashing names
prefix = "test"
# rancher/rancher image tag to use
rancher_version = "v2.4.2"
# Count of agent nodes with role all
count_agent_all_nodes = "3"
# Count of agent nodes with role etcd
count_agent_etcd_nodes = "0"
# Count of agent nodes with role controlplane
count_agent_controlplane_nodes = "0"
# Count of agent nodes with role worker
count_agent_worker_nodes = "0"
# Docker version of host running `rancher/rancher`
docker_version_server = "19.03"
# Docker version of host being added to a cluster (running `rancher/rancher-agent`)
docker_version_agent = "19.03"