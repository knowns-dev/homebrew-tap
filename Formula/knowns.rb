class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.29.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.1/knowns-darwin-arm64.tar.gz"
      sha256 "824fa93686ee093a6cae113bc6b163e52ab21e509f1c15f458c024bc3dce3306"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.1/knowns-darwin-x64.tar.gz"
      sha256 "e041730afcdeb3a831e224a2144d307cd0234a7db771e2de5adb28dbc626410b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.1/knowns-linux-x64.tar.gz"
      sha256 "9fe98cc369add5979246e6715c61f1b1b3110014d7d1e9ae0cfaf33d02097a10"
    end
  end

  def install
    # ONNX Runtime native lib goes into libexec so knowns can find it
    onnx_libraries = Dir["libonnxruntime*"]
    libexec.install onnx_libraries unless onnx_libraries.empty?
    bin.install "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
