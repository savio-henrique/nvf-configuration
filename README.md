# NVF configuration
My Nix-based Neovim Configuration to be used with all my non-Nix machines.

Uses [NVF](https://github.com/NotAShelf/nvf) to configure the flake, plugins and build the nvim binary.

## Dependencies

* Nix

## Usage 
Clone the repository:
```
git clone git@github.com:savio-henrique/nvf-configuration.git
cd ./nvf-configuration
```

Execute the `nix build` or `nix run` command: (You need to have the experimental-features nix-command and flakes active):
```
NIXPKGS_ALLOW_UNFREE=1 nix run . --impure
# or
NIXPKGS_ALLOW_UNFREE=1 nix build . --impure
```
