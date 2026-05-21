class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.0/knowns-darwin-arm64.tar.gz"
      sha256 "554edf6e55f8f0109260063721d7306460a3df5215356253d28d7a1fbf73ec06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.22.0/knowns-linux-x64.tar.gz"
      sha256 "8d14e41af89f561e2ffc229e3958c2f61dd0dfdd2d238ce5642b0217d0ccfa1f"
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
