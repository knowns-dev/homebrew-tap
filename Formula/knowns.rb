class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.35.0/knowns-darwin-arm64.tar.gz"
      sha256 "5450a0a63b34bc4abd5dc99ac451d38aef4c47fb185548951035ba5bdbb141ae"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.35.0/knowns-darwin-x64.tar.gz"
      sha256 "1d079fb85ce0c1d3de9c71aae78e8299c0b964ca16ed69895bcd673b8219f35b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.35.0/knowns-linux-x64.tar.gz"
      sha256 "6179a8bc92448836d58f7195f575f68eb5c689cb880269f145036747eb6d7f3b"
    end
  end

  def install
    bin.install "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
