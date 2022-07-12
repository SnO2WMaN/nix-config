# sno2wman/nix-config

## Usage

### `nixos-rebuild`

```sh
nixos-rebuild switch --use-remote-sudo
```

### Home Manager

```sh
home-manager switch --flake ".#marisa" --impure
```

#### memo

How to install home-manager

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install
```

See [Manual](https://nix-community.github.io/home-manager/)
