# user memory

## coding style and conventions

### text formatting

- never use capital letters except for company or product names (NixOS, GitHub, Claude, etc.)
- all text should be lowercase including comments, documentation, and responses
- commit messages must be lowercase
- always add a newline at the end of files (essential for proper file formatting)

### file formatting by type

- **nix files**: nixfmt-rfc-style formatting (2-space indentation, aligned attributes)
- **yaml/yml**: 2-space indentation, no trailing spaces
- **json**: 2-space indentation, proper nested structure
- **shell scripts**: 2-space indentation, proper quoting
- **markdown**: consistent heading styles, proper list formatting
- **helm charts**: yaml formatting with 2-space indentation, proper template syntax, consistent values.yaml structure
- **go**: gofmt standard formatting (tabs for indentation, proper imports grouping, no trailing spaces)

## technology stack

### desktop environment

- **compositor**: hyprland (wayland) with quickshell/hyprpanel bars
- **launcher**: anyrun and sherlock
- **terminals**: ghostty, wezterm with fish shell and starship prompt
- **editors**: zed, neovim, vscodium

### core tools and patterns

- **package management**: nix flakes for reproducible builds and development environments
- **system management**: `nh` wrapper for better nixos-rebuild/home-manager experience
- **secrets management**: agenix (age encryption) and sops-nix
- **documentation**: primarily markdown with some typst for formatted documents

## development workflows

### nix ecosystem

- `nix develop` - enter development shell
- `nix flake check` - validate flake configuration
- `nix flake update` - update all inputs
- `nix build` - build packages/systems
- `direnv allow` - enable automatic dev shell activation

### nixos system management

- `nh os switch` - rebuild and switch nixos system configuration (preferred method)
- `nh home switch` - rebuild and switch home manager configuration
- `nixos-rebuild switch --flake .` - alternative system rebuild method

### code quality (nix projects)

- `nixfmt-rfc-style` - format nix files (runs automatically via pre-commit)
- `deadnix` - find unused nix code
- `statix` - static analysis for nix code
- `nil` - nix language server for diagnostics

## devops and infrastructure

### infrastructure as code

- prefer declarative configurations over imperative scripts
- use nix for reproducible system configurations and development environments
- version control all infrastructure definitions
- document infrastructure decisions and architectural choices

### kubernetes and container orchestration

- `kubectl apply -f` - apply kubernetes manifests
- `helm template` - render helm charts
- `argocd app sync` - sync applications
- use kubectl with context switching for multi-cluster management
- prefer helm charts for application deployments
- use gitops patterns with argocd/kargo for deployment automation
- container images should be built reproducibly with proper tagging

### monitoring and observability

- implement proper logging with structured formats
- use meaningful metric names and labels
- set up alerts for critical system components
- document runbooks for common operational tasks

### security practices

- follow least privilege principles for service accounts
- use secrets management tools (sops, agenix) rather than plain text
- regularly update dependencies and base images
- implement proper network policies and rbac

### operational excellence

- automate repetitive tasks wherever possible
- use infrastructure testing and validation
- maintain disaster recovery procedures
- prefer immutable infrastructure patterns
