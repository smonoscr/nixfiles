{lib, ...}: {
  imports = [./.];
  # When initializing a cluster from scratch also copy /etc/rancher/k3s/k3s.yaml
  # from the master to the https://github.com/ls1-courses/internal-docs/tree/main/runner

  services.k3s = {
    role = "agent";
    serverAddr = lib.mkDefault "https://${cfg.nodeIP}:6443";
    extraFlags = "--node-ip ${cfg.nodeIP} --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock";
  };
}
