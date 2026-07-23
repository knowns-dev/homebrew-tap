class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.28.0/knowns-darwin-arm64.tar.gz"
      sha256 "69d2620c5655b47f0f75a07ebc0e5b76649285c6ef146cc3a67c436f062af31a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.28.0/knowns-linux-x64.tar.gz"
      sha256 "9df21624272542e84f930bb943932a44d529a8cad69f1c561ad23adfc85d8817"
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
