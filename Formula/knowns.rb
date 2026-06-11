class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.24.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.24.1/knowns-darwin-arm64.tar.gz"
      sha256 "2d7ff0692e3ad6d9e6d76fe81f5d5a3a5c110e83ff3cac7ba6f42b7c7032abe1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.24.1/knowns-linux-x64.tar.gz"
      sha256 "114be5d219173fee50834595c18703f425e001bb439654334a6ee7b2da9b896e"
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
