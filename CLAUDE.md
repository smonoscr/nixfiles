# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal NixOS configuration repository (nixfiles) that manages both system-level configuration and user environment through flakes, NixOS modules, and Home Manager. The repository follows a modular structure separating system configuration, user configuration, and reusable components.

## Key Development Commands

### Building and Deployment

- `nh os switch` - Rebuild and switch NixOS system configuration (preferred method)
- `nh home switch` - Rebuild and switch Home Manager configuration
- `nixos-rebuild switch --flake .` - Alternative system rebuild method
- `nix flake check` - Validate flake configuration and run checks
- `nix develop` - Enter development shell with pre-commit hooks

### Formatting and Linting

- `nixfmt-rfc-style` - Format Nix files (runs automatically via pre-commit)
- `deadnix` - Find unused Nix code
- `statix` - Static analysis for Nix code
- `nil` - Nix language server for diagnostics

### Flake Management

- `nix flake update` - Update all flake inputs
- `nix flake lock --update-input <input>` - Update specific input
- `nix flake show` - Show flake outputs

## Architecture Overview

### Directory Structure

- `flake.nix` - Main flake configuration defining inputs, outputs, and system configurations
- `hosts/` - System-specific configurations (currently contains `desktop` host)
- `home/` - Home Manager configurations and user-specific settings
- `lib/` - Custom Nix library functions
- `modules/` - Custom NixOS and Home Manager modules
- `overlays/` - Package overlays for different nixpkgs branches
- `templates/` - Flake templates for various development environments
- `checks/` - Pre-commit hooks and validation

### Configuration Flow

1. **System Configuration**: `hosts/desktop/configuration.nix` imports modular system components (core, gaming, hardware, network, services, etc.)
2. **User Configuration**: `home/simon/home.nix` imports user-specific modules (desktop, editors, terminal, themes, etc.)
3. **Module System**: Custom modules in both system and home configurations use `module.<category>.<name>.enable` options

### Key Components

- **Desktop Environment**: Hyprland (Wayland compositor) with QuickShell/HyprPanel bars
- **Application Launcher**: Anyrun and Sherlock
- **Terminal**: Ghostty, Wezterm with Fish shell and Starship prompt
- **Editors**: Zed, Neovim, VSCodium
- **Package Management**: Uses `nh` wrapper for better nixos-rebuild/home-manager experience

### Flake Inputs

Notable inputs include Hyprland ecosystem (hyprland, hyprlock, hypridle, hyprpaper), home-manager, chaotic-nyx, zen-browser, quickshell, and various gaming-related inputs. Uses nixos-unstable as the primary nixpkgs source.

### Pre-commit Hooks

The repository uses pre-commit hooks for code quality: nixfmt-rfc-style formatting, flake-checker validation, nil diagnostics, deadnix unused code detection, statix analysis, and prettier for non-Nix files.

## Development Notes

- Home Manager is integrated at the NixOS level, not run standalone
- Configuration uses a modular approach with custom enable options throughout
- The system uses impermanence and SOPS for secrets management
- Gaming configuration includes Steam, Lutris, GameMode, and various compatibility layers

## Important Style Guidelines

**CRITICAL**: This repository has a strict no-capital-letters policy:

- commit messages must use lowercase (including commit body, not just the type:description)
- comments in code must use lowercase
- documentation (README, CLAUDE.md, etc.) must use lowercase
- the only exceptions are proper nouns (NixOS, GitHub, etc.) and code syntax that requires capitals

**NEVER** add Claude Code attribution or co-author lines to commit messages. Do not include:

- "🤖 Generated with [Claude Code]" references
- "Co-Authored-By: Claude" lines
- any other AI attribution in commits or code
