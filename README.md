# nix-bm25s

[![CI](https://github.com/pr0d1r2/nix-bm25s/actions/workflows/ci.yml/badge.svg)](https://github.com/pr0d1r2/nix-bm25s/actions/workflows/ci.yml)

Nix package for [bm25s](https://github.com/xhluca/bm25s) — fast BM25 implementation using sparse matrices. Pre-built binaries served via [cachix](https://pr0d1r2.cachix.org).

## Usage

### As a flake input

```nix
{
  inputs.nix-bm25s = {
    url = "github:pr0d1r2/nix-bm25s";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # In devShell packages:
  nix-bm25s.packages.${system}.default
}
```

## Binary cache

bm25s is cached via [cachix](https://pr0d1r2.cachix.org). The flake includes `nixConfig` with the substituter, so `nix build` pulls pre-built binaries instead of compiling.

To accept the cache without prompts, add to `~/.config/nix/nix.conf`:

```ini
trusted-substituters = https://pr0d1r2.cachix.org
trusted-public-keys = pr0d1r2.cachix.org-1:NfWjbhgAj41byXhCKiaE+av3Vnphm1fTezHXEGsiQIM=
```

## License

MIT
