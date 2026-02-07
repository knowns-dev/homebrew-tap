class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.11.4"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.4/knowns-darwin-arm64.tar.gz"
    sha256 "83bd7efa0ee8d9297add37b1a9605e600e21dab73561c0862e9572ad04737957"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.4/knowns-darwin-x64.tar.gz"
    sha256 "6425b34230e98aed2be21a3a2113b1c7d0aed8a7ab87d7038de98e578aa29cb9"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.11.4/knowns-linux-x64.tar.gz"
    sha256 "17e89193b86e92f98d752c86c38342f9b077e42f2569c03a7c4c4480a9bbab09"
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