class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.1/knowns-darwin-arm64.tar.gz"
      sha256 "8d15ae8a6fc831df72fd8252920f142bbc6e357e1780445f7d9e25acccfa32f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.1/knowns-linux-x64.tar.gz"
      sha256 "5b7e67d53f5b1aea9bc64c1bfdfd0bfc5873db14ef9a4984601fc65d68b45e18"
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
