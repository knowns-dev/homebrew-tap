class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.0/knowns-darwin-arm64.tar.gz"
      sha256 "0fa02927d93daf3960a8bad0df2d241aac96a04209e5bd93f476959b96e00338"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.0/knowns-darwin-x64.tar.gz"
      sha256 "13647c3244cd38bcc067b018b021cde73c7746071218cc6621ca6d52913fd7d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.17.0/knowns-linux-x64.tar.gz"
      sha256 "a2b4329d4c5cc9597a740da65a6a160148f0ff2802fa63b4754087ba0cbf39ff"
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
