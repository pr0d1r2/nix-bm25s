# SPEC — nix-bm25s

## §G GOAL

Standalone Nix package for [bm25s](https://github.com/xhluca/bm25s) — fast BM25 implementation in Python using sparse matrices and numpy. Pre-built via cachix (`pr0d1r2.cachix.org`). Consumed as flake input by downstream repos (nix-semble, etc.).

## §C CONSTRAINTS

- C1: Nix flake, pinned `nixos-25.11`
- C2: 4 systems: aarch64-darwin, x86_64-darwin, x86_64-linux, aarch64-linux
- C3: Source pinned as `flake = false` input
- C4: Python build via `buildPythonPackage` — setuptools backend
- C5: Core dep: numpy only
- C6: cachix binary cache in `nixConfig`
- C7: 6 nix-lefthook inputs w/ follows deduplication
- C8: ⊥ embedded shell in nix — extract to fragments/

## §I INTERFACES

- I.pkg: `packages.<system>.default` — bm25s Python package
- I.dev: `devShells.<system>.default` — dev environment w/ bm25s + linters + lefthook
- I.flake-input: `inputs.nix-bm25s.url = "github:pr0d1r2/nix-bm25s"` w/ `nixpkgs.follows`

## §V VERSIONING

- bm25s version: pinned in bm25s.nix (currently 0.3.9)
- Bump: update `bm25s-src` input URL tag + version in bm25s.nix

## §T TESTING

- T1: `nix flake check` — evaluates package + devShell for all systems
- T2: `pythonImportsCheck` validates import
- T3: lefthook pre-commit quality gates

## §B BUILD

- B1: `nix build` — builds bm25s for current system
- B2: `nix develop` — enters dev shell
- B3: cachix push: `nix build && cachix push pr0d1r2 result`
