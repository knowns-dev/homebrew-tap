class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.1/knowns-darwin-arm64.tar.gz"
      sha256 "163fe7e3e034b283a7c6926c34bf5b5b13f7181de2253824570ef1e074479b4c"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.1/knowns-darwin-x64.tar.gz"
      sha256 "43ae9ab5e68d46ac01bab7460028ed7eb6d72cbbd49b9f5d4997ab75864c6087"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.1/knowns-linux-x64.tar.gz"
      sha256 "91c5020595016abeb9cb646cfc6c650dfb08396f90d090ce7bf69667332a2b61"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "knowns" => "knowns"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    end
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
