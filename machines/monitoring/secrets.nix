{ ... }:
{
  sops.secrets = {
    "admin-password" = {
      owner = "grafana";
      group = "grafana";
    };

    "grafana-oidc-client-id" = {
      owner = "grafana";
      group = "grafana";
    };

    "grafana-oidc-client-secret" = {
      owner = "grafana";
      group = "grafana";
    };

    "pve-exporter.env" = { };
  };
}
