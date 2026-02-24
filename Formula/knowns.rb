class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.12.0"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.0/knowns-darwin-arm64.tar.gz"
    sha256 "38580170ae79b86ade5c299ad1cebddaeb892ecb912964d36d25a20123d7a8f6"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.0/knowns-darwin-x64.tar.gz"
    sha256 "08bb09f643699bcab68c216ac051f5e9ba7f064d43b0d217149f4a05aa68f200"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.0/knowns-linux-x64.tar.gz"
    sha256 "7d3d777a40bb0d8b1d71afe426bea0f01f336193d35fb8337d7bd30c593828db"
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