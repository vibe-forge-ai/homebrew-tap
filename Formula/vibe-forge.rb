class VibeForge < Formula
  desc "AI-assisted development framework CLI"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/cli/-/cli-3.1.7.tgz"
  sha256 "f87db6859c89508d02819d2db63b1e716a41634b902543ab5aeb5bccb0b66589"
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
