class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.21.0/knowns-darwin-arm64.tar.gz"
      sha256 "6de034a3837835bf18eb3644a34c23b33cf82f2a6e4f2ccf97e44dec5b04204f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.21.0/knowns-linux-x64.tar.gz"
      sha256 "65f514122432bcf2ddd35076a1a0055a66c72b7447e4cf452a5642cdc12adfcd"
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
