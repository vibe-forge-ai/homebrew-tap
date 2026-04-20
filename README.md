# Vibe Forge Homebrew Tap

Homebrew tap for Vibe Forge.

## Install

```bash
brew install vibe-forge-ai/tap/vibe-forge
brew install vibe-forge-ai/tap/vibe-forge-bootstrap
```

## Upgrade

```bash
brew update
brew upgrade vibe-forge
brew upgrade vibe-forge-bootstrap
```

## Maintain

This repository is tracked as a submodule from `vibe-forge.ai` at `infra/homebrew-tap`.

After publishing a stable `@vibe-forge/cli` version, update this tap from the parent repository:

```bash
pnpm tools homebrew-tap sync-cli --version <version>
brew style infra/homebrew-tap/Formula/vibe-forge.rb
git -C infra/homebrew-tap add Formula/vibe-forge.rb
git -C infra/homebrew-tap commit -m "chore: update vibe-forge to <version>"
git -C infra/homebrew-tap push origin main
git add infra/homebrew-tap
```

`sync-cli` downloads the published npm tarball and writes the matching `url` and `sha256` to `Formula/vibe-forge.rb`.

After publishing a stable `@vibe-forge/bootstrap` version, update the launcher formula from the parent repository:

```bash
pnpm tools homebrew-tap sync-bootstrap --version <version>
brew style infra/homebrew-tap/Formula/vibe-forge-bootstrap.rb
git -C infra/homebrew-tap add Formula/vibe-forge-bootstrap.rb README.md
git -C infra/homebrew-tap commit -m "chore: update vibe-forge-bootstrap to <version>"
git -C infra/homebrew-tap push origin main
git add infra/homebrew-tap
```

`sync-bootstrap` downloads the published npm tarball and writes the matching `url` and `sha256` to `Formula/vibe-forge-bootstrap.rb`.
