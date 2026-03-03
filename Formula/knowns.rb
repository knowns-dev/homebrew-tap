class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.12.4"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.4/knowns-darwin-arm64.tar.gz"
    sha256 "b62c22d2af3a5a2796dca79e14596fa4194d29eb64382fb8a6307547055877e0"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.4/knowns-darwin-x64.tar.gz"
    sha256 "2b89f57d8d89f280f02f21d738e314ab5d8aadb577d05d19c1e99ac3c24cf486"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.4/knowns-linux-x64.tar.gz"
    sha256 "b466eef8a196d20f244bb119c29d96a714b67bdad9e45dedbf85256449deb56a"
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