class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.1/knowns-darwin-arm64.tar.gz"
      sha256 "d5a3380bc323b9df142d45d0d414c361d0006fe562f3c645dfa51dfae139697e"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.1/knowns-darwin-x64.tar.gz"
      sha256 "ac41c37a8548090917e43a2d59c6c3a73b1f0af099b602f7abb496dba41f0a71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.1/knowns-linux-x64.tar.gz"
      sha256 "bd1b984f4e7a05c180acb5a2bd46257d0ce7ddf4d47d8790c381e92618a46864"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "knowns" => "knowns"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    end
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
