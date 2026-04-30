class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.5/knowns-darwin-arm64.tar.gz"
      sha256 "0c242307f972f40033e1a574a92409cb5eca3052c1a0327e48d5a5f4ac75262f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.5/knowns-linux-x64.tar.gz"
      sha256 "af157ad7b0d5a8fce143bc57dad09ab89336424e5039dcc04ab7b2ade46b2238"
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
