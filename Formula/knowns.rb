class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.27.0/knowns-darwin-arm64.tar.gz"
      sha256 "b8851811f949344b5c05c125fee6b8d1e255fef2c5301afae7352de18c08f6ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.27.0/knowns-linux-x64.tar.gz"
      sha256 "ae7ca383e7191c119959d500ab821710263c3ba1844539032081a275e7335749"
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
