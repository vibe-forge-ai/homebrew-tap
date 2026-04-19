# Vibe Forge Homebrew Tap

Homebrew tap for Vibe Forge.

## Install

```bash
brew install vibe-forge-ai/tap/vibe-forge
```

## Upgrade

```bash
brew update
brew upgrade vibe-forge
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
