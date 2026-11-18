class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.0/knowns-darwin-arm64.tar.gz"
      sha256 "f820e58ab49b0181c61903bfcbf448416804c195953569df4f18b32bd57a5c06"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.0/knowns-darwin-x64.tar.gz"
      sha256 "3a35976e0211f4a382cdc10d527ebd51331ed35fa19855c45b0f2ea2a768f8ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.0/knowns-linux-x64.tar.gz"
      sha256 "338cb2261c64087c26aa729e2f86b184a9e7340357f5d636329e44d5d5f54d2d"
    end
  end

  def install
    # The archive's  is the engine and  the launcher (layout.json);
    # installed, the launcher is  and the engine sits beside it as knowns-engine.
    bin.install "knowns" => "knowns-engine"
    bin.install "knowns.launcher" => "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
