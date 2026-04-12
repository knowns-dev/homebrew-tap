class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.18.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.3/knowns-darwin-arm64.tar.gz"
      sha256 "af645fd293baee2138deddaf13707686c71d58c14bd4a3197a90c3fc9da0c9de"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.3/knowns-darwin-x64.tar.gz"
      sha256 "351c5578a130e80bdbe678e1f3ebd5f7d0328824f9a73749844e0898f4213aed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.3/knowns-linux-x64.tar.gz"
      sha256 "2c31c175bfe72c14b6a688228f96bc01459bb5f7e251cc2236e136cec37b1065"
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
