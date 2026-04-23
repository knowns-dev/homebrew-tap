class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.0/knowns-darwin-arm64.tar.gz"
      sha256 "1b4db786ddfa94fc60e75bf6e47ccf1bc60143508867515dba7d166520bab72a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.0/knowns-linux-x64.tar.gz"
      sha256 "d60dd61c731dd6f0c853e7015c6c545db5301b8c1c24d140697dc77be4136a5e"
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
