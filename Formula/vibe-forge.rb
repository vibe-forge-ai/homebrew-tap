class VibeForge < Formula
  desc "AI-assisted development framework CLI"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/cli/-/cli-3.1.1.tgz"
  sha256 "11043f721c1b1247a49b303e0d92c80b0ea15efde7f67cbf6b2250d63fbfaf01"
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
