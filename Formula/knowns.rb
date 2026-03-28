class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.16.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.2/knowns-darwin-arm64.tar.gz"
      sha256 "6613d9b4c615616bff3aaa943bea3c153afc3491a630e4d01c033f841971ba2b"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.2/knowns-darwin-x64.tar.gz"
      sha256 "c9bc68874e5be5c641bca6bb8c8c752f201ab53b163e3505a6089b8fcc577623"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.2/knowns-linux-x64.tar.gz"
      sha256 "dab32037bc49fb808175da40d921991e4a47c9f056dcb2a421f00f3c7d032d7c"
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
