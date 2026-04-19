class VibeForge < Formula
  desc "AI-assisted development framework CLI"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/cli/-/cli-1.0.1.tgz"
  sha256 "cc3992d84090cbce3eb30b49c49af87a119442ee5af3a4c5009a0dfd4abb68e3"
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
