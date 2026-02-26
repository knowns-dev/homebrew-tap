class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.12.3"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.3/knowns-darwin-arm64.tar.gz"
    sha256 "9f28e63bd133e220455f79a4694495061e5ea908c3a7fd559f6dbbee7c11160f"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.3/knowns-darwin-x64.tar.gz"
    sha256 "eb4c0212d66b02928234010f30233ebcc1edb39be9bdbefbfa44eb957b89d922"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.3/knowns-linux-x64.tar.gz"
    sha256 "639302811e29e513d3093abd8ebb80f05bd04743e95073c5e299092f91ecd914"
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