# Hosts config

| Name      | Description                                                                       |
| --------- | --------------------------------------------------------------------------------- |
| `desktop` | main desktop machine                                                              |
| `server`  | dedicated hetzner online                                                          |
| `k8s`     | k3s multi-node cluster - currently not deployed but worked on 3 hetzner cloud VPS |

Each host imports its own modules inside `configuration.nix`.
