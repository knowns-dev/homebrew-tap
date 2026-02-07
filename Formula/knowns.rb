class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.11.2"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.2/knowns-darwin-arm64.tar.gz"
    sha256 "ae0a0543f66d2320815bcd75fb433473132c454d51e97723af6dfcd3378433d0"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.2/knowns-darwin-x64.tar.gz"
    sha256 "336febb85b879bf217684d4633892a05b26f0669b71c7e6d04ac1041c5b2a22b"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.2/knowns-linux-x64.tar.gz"
    sha256 "fd748e021a5ca054a8918e78ec27908095e15c87aa2064fcda2c45663a398669"
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