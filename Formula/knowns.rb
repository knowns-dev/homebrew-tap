class Knowns < Formula
desc "AI-first CLI for task management and documentation"
homepage "https://cli.knowns.dev"
version "0.12.1"
license "MIT"

on_macos do
  on_arm do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.1/knowns-darwin-arm64.tar.gz"
    sha256 "783d5ec688f02e652b43f7fdb9044fefe1aa9782afd8629cb98e33c402eabde2"
  end
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.1/knowns-darwin-x64.tar.gz"
    sha256 "aaccaf55de384511ef7c07df61eb6a4ecc48145595591dcce8640def78e3ff0c"
  end
end

on_linux do
  on_intel do
    url "https://github.com/knowns-dev/knowns/releases/download/v0.12.1/knowns-linux-x64.tar.gz"
    sha256 "8cb93e9a38ce9449dff9e2dd0d2e91ca68af065441bb01ef143651c6adab77e2"
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