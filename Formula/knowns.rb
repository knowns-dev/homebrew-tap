class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.24.0/knowns-darwin-arm64.tar.gz"
      sha256 "13b25758923905634d2c3191ccb77a8666f4ec6d7970a941f47ecc4d65d5415e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.24.0/knowns-linux-x64.tar.gz"
      sha256 "9c8dc53b092098fe4647de1ba1f256419a103aeccb34f2033f72a998cbf1a23e"
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
