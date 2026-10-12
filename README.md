[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A8E628KA51)
# NixOS Config

# Table of Contents

1. Overview
2. Table of Contents
3. Installation
4. Contributions
5. Layout
    1. Philosophy
    2. Repository Structure
    3. Top Level
    4. Adding Users
    5. Adding Modules


# Installation

# Contributions

## Commit Message Convention

I am now using [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) for commit messages and PR titles. Many older commits will not follow this. Inspired by [PX4](https://github.com/PX4/PX4-Autopilot/blob/main/CONTRIBUTING.md#commit-message-convention) convention.

### Format

```
type(scope): short description of change

Longer description of changes and reasoning
```

| Part | Rule |
| ---- | ---- | 
| type | Category of change (see types table below) |
| scope | The optional scope of the change (see scopes table below |
| `!` | Optionally appended before `:` to mark a breaking change |
| description | What the change does, imperatively |

### Types 

| Type | Description | 
| ---- | ----------- |
| feat | A new feature |
| fix  | A bug fix |
| docs | A documentation only change | 
| style | Changes that don't affect codde (formatting, whitespace) |
| refactor | Changing code syntax without changing semantics |
| tools | Adding tools, flakes, etc, that don't affect main build |
| chore | Change that doesn't touch source or documentation |
| revert | Reverts a previous commit |
| merge | A merge commit | 

### Scopes 

The scope identifies which part of the setup is being changed

| Scope | Area | 
| ----- | ---- |
| host/ozy | Only affects one host (replace ozy with hostname) |
| theme/tron | Editing a theme setup (replace tron with theme) |


# Layout

## Philosophy

This repository is used across multiple users and multiple devices. The intent is to minimize rewriting of code, minimize the setup boilerplate for new users and new hosts, while maintaining a reasonable degree of flexibility and customization. 

## Repository Structure 

The Repository is setup to have minimal depth, and maximum breadth. 

```text
.
├── flake.nix
├── flake.lock
├── lib/
│   └── default.nix
├── hosts/
│   └── <host>/
│       ├── default.nix
│       └── hardware-configuration.nix
├── users/
│   └── <user>.nix
├── modules/
│   ├── nixos/
│   │   ├── default.nix
│   │   └── ...
│   └── home/
│       ├── default.nix
│       └── ...
├── profiles/
│   ├── desktop.nix
│   ├── laptop.nix
│   └── server.nix
├── themes/
│   ├── <theme>/
│   └── ...
├── wallpapers/
├── overlays/
└── pkgs/
```

## Top Level

### `flake.nix`

This contains the input sources, and the build target declarations. That is all, to keep it minimal. 

### `lib/`

Contains helper functions for the repository, like mkHost. Will stay in default.nix until enough helpers are added.

### `hosts/`

This directory will contain a subdirectory for each 'host', that is, each machine. Inside of each host subdirectory there needs to be a default.nix, containing that hosts hardware setup, and any hardware specific overrides. 

### `users/`

Each file adds one user to home manager, with user baselines. 

### `modules/`

Contains two subdirectories, `nixos/` for option-gated nixos modules, and `home/`, for option-gated home-manager modules. These will all be imported into every build, and disabled by default. 

### `profiles/`

Shared sets of pre-configured options, for like machine or goals. 

### `themes/`

Bundles of options pre-configured for specific system themes, containing a subdirectory for each theme. 

### `overlays/`

### `pkgs/`

## Adding Users

## Adding Modules
