class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.11.3"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.3/knowns-darwin-arm64.tar.gz"
    sha256 "acb0f35473ec6dba05804c3c9e4cb7aea04651ac0a10ada3f95fb5d39131cc96"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.3/knowns-darwin-x64.tar.gz"
    sha256 "f6fae75fd35e362012183c624b7976642b111df93f23bb5a5b29efd668b8da75"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.3/knowns-linux-x64.tar.gz"
    sha256 "006296384d11d6aeac23081224ee1503487e6c7ff6c90bd1e92e21c9aa2aadaf"
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