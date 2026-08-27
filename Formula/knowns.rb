class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.32.0/knowns-darwin-arm64.tar.gz"
      sha256 "263932e6023f0c591b7da497babb612743bc446348521596e4d1dc9526714347"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.32.0/knowns-darwin-x64.tar.gz"
      sha256 "49227c61f2d8503f3f92badb1b397c4dee0e5ac8ddb9b8c7ebc32dd9bf94d677"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.32.0/knowns-linux-x64.tar.gz"
      sha256 "ebc0517abf677415d6029e612fcb8b7795f0bdba7d7e067fe3d490978c280fc7"
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
