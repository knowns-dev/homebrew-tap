class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.2/knowns-darwin-arm64.tar.gz"
      sha256 "4ea482be7356d1f648bad48e572555bedf5531311b5d375fbb84641513a0f216"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.2/knowns-darwin-x64.tar.gz"
      sha256 "6b2436f733a18e22a80e497eeac6ffeffaf7700f347c64b766821fe924bc4433"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.2/knowns-linux-x64.tar.gz"
      sha256 "f1c1915d33fc5e4c91b0e391af789b733c671431b8bb2376a5226e74c7ee72d0"
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
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
