class Knowns < Formula
  desc "AI-first CLI for task management and documentation"
  homepage "https://cli.knowns.dev"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.11.1/knowns-darwin-arm64.tar.gz"
      sha256 "be1382ec5a40a3e7bd9eb4a504caca1528d86eaa9891667818b411fdd438beb1"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.11.1/knowns-darwin-x64.tar.gz"
      sha256 "7c010e2e45a40922b3f90be51bdc6f8b06a0b2979c0da2de7a2fbe89d02408d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.11.1/knowns-linux-x64.tar.gz"
      sha256 "b3a945c99b350f42ffd3cdede5bd02566f07ba7b6ec61cf0682d4c09490d79ed"
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
    assert_match version.to_s, shell_output("#{bin}/knowns --version")
  end
end
