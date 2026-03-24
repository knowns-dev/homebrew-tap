class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.0/knowns-darwin-arm64.tar.gz"
      sha256 "323272ed582b7afa5ba12636d3b142b6cb56c30d33b716e31aae9e1ec01239dc"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.0/knowns-darwin-x64.tar.gz"
      sha256 "c6c96061b73ad234e0914fd05e7df7d859e90ecbb62732dfb26d1dcca93131b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.0/knowns-linux-x64.tar.gz"
      sha256 "365bf0e150f63e9a940e3400d28237646ba719ea8b52a8b048d51269b09abde4"
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
