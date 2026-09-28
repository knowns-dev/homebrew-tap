class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.34.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.1/knowns-darwin-arm64.tar.gz"
      sha256 "1b0637a6afbe99a0306bbc35869ed9d831f2ce2bf4eb35bd012b080baa7d477c"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.1/knowns-darwin-x64.tar.gz"
      sha256 "7f4b15eaa167914324337406dc783c4fbb4268c9704e7feeb0f7595f5b29dea4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.1/knowns-linux-x64.tar.gz"
      sha256 "efb9ecc4079ccdfa70293ef028a28a55b2b2eb549287eb770bd038a420056a18"
    end
  end

  def install
    bin.install "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
