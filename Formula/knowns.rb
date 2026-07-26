class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.0/knowns-darwin-arm64.tar.gz"
      sha256 "c92c463396135f6da36167ca5c55044696cb6bd6e9c220801f3be3522d25c59c"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.0/knowns-darwin-x64.tar.gz"
      sha256 "3de5421f9e710445cd05b29035ddac1e0b9f9d804559651db09027920749ad77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.29.0/knowns-linux-x64.tar.gz"
      sha256 "9e9f46e8cc91234e87756e8e31fcd65c3d78612ff1ff393fefa3b597f5984fa3"
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
