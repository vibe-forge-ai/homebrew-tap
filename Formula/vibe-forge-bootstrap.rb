class VibeForgeBootstrap < Formula
  desc "Vibe Forge bootstrap launcher"
  homepage "https://github.com/vibe-forge-ai/vibe-forge.ai"
  url "https://registry.npmjs.org/@vibe-forge/bootstrap/-/bootstrap-1.0.0.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "node"

  def install
    # Remove this once @vibe-forge/bootstrap publishes bin entrypoints with shebangs.
    inreplace "cli.js", /\A/, "#!/usr/bin/env node\n"

    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/{vibe-forge-bootstrap,vfb}")
  end

  test do
    assert_match "Vibe Forge bootstrap launcher", shell_output("#{bin}/vibe-forge-bootstrap --help")
  end
end
