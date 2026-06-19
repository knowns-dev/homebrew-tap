class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.25.0/knowns-darwin-arm64.tar.gz"
      sha256 "c966fcfa6d24637c9ce33d24b4e51d98cf9fc3a90d47f68118ed4801bfdd1e26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.25.0/knowns-linux-x64.tar.gz"
      sha256 "cc2e1d05528069e95d622e400cf5d018cc1f3ced795b0b795c9314ae8cdb784a"
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
