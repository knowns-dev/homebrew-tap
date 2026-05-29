class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.23.0/knowns-darwin-arm64.tar.gz"
      sha256 "f7bdfda7d0f00b9ee2f9f38ecb51169312f8326d58976e5ee66abcab6e5993bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.23.0/knowns-linux-x64.tar.gz"
      sha256 "009b32261038f932647dc6876b1582ed80552a7891d5c3c49026022f48a92e72"
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
