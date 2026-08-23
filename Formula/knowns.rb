class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.31.0/knowns-darwin-arm64.tar.gz"
      sha256 "f2c584cf702ba7b1c0082e209d2e4392162db870b7b646630235a631ae5e433d"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.31.0/knowns-darwin-x64.tar.gz"
      sha256 "9c670387773c8afb672c617113a6d748de2579cf759ab36ecdb85dae7e88d9d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.31.0/knowns-linux-x64.tar.gz"
      sha256 "a47015926577bc03efd0530c0409393ba33e4e9b7cf803d22c76bd0c092e1588"
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
