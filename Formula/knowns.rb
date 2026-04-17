class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.18.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.4/knowns-darwin-arm64.tar.gz"
      sha256 "7e2a4288b12f11f4f177de7960806adfa2fd3fda2d2919b82538a61f37d6a2d1"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.4/knowns-darwin-x64.tar.gz"
      sha256 "5c061855c47f6250e5e378512c8c3e28737f925b5f44ec6da08c50f9f6253ae3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.4/knowns-linux-x64.tar.gz"
      sha256 "84fd0b8afe857a628cf43762fdc81f49024b3e83a14959c50eda4e5b61450e16"
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
