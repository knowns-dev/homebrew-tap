class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.12.2"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.2/knowns-darwin-arm64.tar.gz"
    sha256 "fbc1da4ed9dd291201f2d5a261e22f571407d107f2eef20db19172caa9b40a83"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.2/knowns-darwin-x64.tar.gz"
    sha256 "2b2d11940d2e551b7bcd4b38cff0417ff7f9ab8b994af31bfdefecc177f5e39b"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.2/knowns-linux-x64.tar.gz"
    sha256 "7f467f167264879bf653614a8f2e4f1fba220da26116199b52eb4a9a785810a0"
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