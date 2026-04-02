class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.1/knowns-darwin-arm64.tar.gz"
      sha256 "95d4b59c3b9b4f71e023814f97785cf2a3d7651cc716e563bc5d9253ac9dc967"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.1/knowns-darwin-x64.tar.gz"
      sha256 "ee1d42687e72af0a8821cb4baac2bd43faa74e95fa6981cc8da831b8d557b772"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.1/knowns-linux-x64.tar.gz"
      sha256 "7fec348087ba36f11e6491b7dc429c65eefa0a46b203b4c315e1b8c72ff4c3e0"
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
