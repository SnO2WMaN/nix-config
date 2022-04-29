# sno2wman/dotfiles

## Usage

Setup nix, home-manager, and nix flake

```
rm -rf ~/.config/nixpkgs
git clone https://github.com/SnO2WMaN/nix-dotfiles ~/.config/nixpkgs

home-manager switch --flake ".#marisa"
```

### Update lockfile

```
nix flake update ~/.config/nixpkgs   
```
