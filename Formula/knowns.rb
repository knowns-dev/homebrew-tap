class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.27.1/knowns-darwin-arm64.tar.gz"
      sha256 "1ce5c25eb7d562f2e4e0b4cb6e291c6bd0cdb2128f8d7fc805cd97b89ffd792f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.27.1/knowns-linux-x64.tar.gz"
      sha256 "dc28849dae824137670edf849c79c4a102c368680eb93abf31990a79817ce9ee"
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
