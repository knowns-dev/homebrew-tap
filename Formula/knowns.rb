class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.22.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.2/knowns-darwin-arm64.tar.gz"
      sha256 "4567fab8600eee5ff444340fede329c97c3591a55d39b9274d7fdc04d25ee500"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.2/knowns-linux-x64.tar.gz"
      sha256 "8d81c51f79c22decc28f4022fb2f304a0f5630a8bed6303e5962671aaf7cbcd5"
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
