class VibeForge < Formula
  desc "AI-assisted development framework CLI"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/cli/-/cli-3.1.6.tgz"
  sha256 "c6c381e948e159275b8b6ef8204411623b5b1d6a6b91a99a82a1da8efbaeb85d"
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
