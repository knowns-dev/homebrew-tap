class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.0/knowns-darwin-arm64.tar.gz"
      sha256 "ad700d28acc112e3c55b70da4d6ed73b242a6d816eb7303028a7b12e514cb994"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.0/knowns-darwin-x64.tar.gz"
      sha256 "14aaf7232081a87dfc44432a504477fa34e92f117c3482832cee2ef0dbf4d0d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.0/knowns-linux-x64.tar.gz"
      sha256 "28e5832e2da42e4697f9bbd6dd3405f1a9c8c3ce9c97c53cbaa47a883de4098b"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "knowns-darwin-arm64" => "knowns"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "knowns-darwin-x64" => "knowns"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "knowns-linux-x64" => "knowns"
    end
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
