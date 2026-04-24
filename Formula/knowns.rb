class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.2/knowns-darwin-arm64.tar.gz"
      sha256 "3e347db8204bd81c8dbf2c7fc79094c003e4faeedaf38d926af0b6b057ee29d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.2/knowns-linux-x64.tar.gz"
      sha256 "6415226d7f9016fc1b25ba338e8ae5bd4904204b3a5fcbf40bd4ec6e8d54aded"
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
