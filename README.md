# NixOS Config

# Table of Contents

1. Overview
2. Table of Contents
3. Installation
4. Contributions
5. Roadmap
    1. MVP
    2. Wanted Modules
    3. Misc. Tasks
    4. Bugs


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



# Roadmap

## MVP

- [x] NVidia Setups
- [x] Steam 
- [x] Stoat
- [x] `spysi` profile
- [x] `rockingcone` profile
  - [ ] `rockingcone-laptop` profile
- [ ] `ozy` profile
  - [x] `ozy-laptop` profile
- [x] vivaldi

## Roadmap



## Misc. Tasks

## Bugs
