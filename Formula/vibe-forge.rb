class VibeForge < Formula
  desc "AI-assisted development framework CLI"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/cli/-/cli-3.1.0.tgz"
  sha256 "fce67d84e903e07db84b1a7c8f7ae68e3b92c9dd42ef0fdd1f0be18faa02095c"
  license "MIT"

  depends_on "node"

  def install
    # Remove this once @vibe-forge/cli publishes bin entrypoints with shebangs.
    inreplace "cli.js", /\A/, "#!/usr/bin/env node\n"

    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/{vf,vforge,vibe-forge}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vf --version")
  end
end
