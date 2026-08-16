class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.30.0/knowns-darwin-arm64.tar.gz"
      sha256 "15e0f093f1ad44812fde259e0f8f74d6fba853c57c8c74f26d0087a494a3ceb2"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.30.0/knowns-darwin-x64.tar.gz"
      sha256 "28f0c3b6e66f2020b4ea34ae9270fe0dbfad55eb6df20dbfa79302d391ed2c1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.30.0/knowns-linux-x64.tar.gz"
      sha256 "2a1f18c9c93928adea3183c11c5414dc08045b21167002adc4bb09794d383ad3"
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
