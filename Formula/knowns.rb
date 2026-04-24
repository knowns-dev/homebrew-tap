class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.3/knowns-darwin-arm64.tar.gz"
      sha256 "f01f128f7ef01d5ea2e892a1ef5a2a67d942501e46ece6c074242f931829c569"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.3/knowns-linux-x64.tar.gz"
      sha256 "01a003f57b37957eb5da41fca9ec8ca66e818716eb3c3ec6b593d17a8619e43e"
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
