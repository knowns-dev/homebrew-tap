class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.1/knowns-darwin-arm64.tar.gz"
      sha256 "0a5d587dac6a6b0fac6decdf2977bcb292caa34a746fa94356387d76aed872b4"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.1/knowns-darwin-x64.tar.gz"
      sha256 "fd4a560a131e15305fec131c968584574eb870efa72c18f108e1add5a4372e78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.1/knowns-linux-x64.tar.gz"
      sha256 "575ea72bd3925cdd09cd8a41701436c01318a0b03e711f4d9b634158a33ff49e"
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
