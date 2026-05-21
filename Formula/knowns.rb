class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.1/knowns-darwin-arm64.tar.gz"
      sha256 "17b93ea1ab4df9621f5a44da64ca7357ef77bd22c10aa87625e4ffa11644cf99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.1/knowns-linux-x64.tar.gz"
      sha256 "c92e10521de87a511c701947014389ca64ce61a69dbad4ea0a15e952e336041a"
    end
  end

  def install
    # ONNX Runtime native lib goes into libexec so knowns can find it
    libexec.install Dir["libonnxruntime*"]
    bin.install "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
