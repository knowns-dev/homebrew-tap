class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.1/knowns-darwin-arm64.tar.gz"
      sha256 "b14e3f39da0a8e30ba247e239022a7e55fe194915149d8e422d5d08a42a49123"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.1/knowns-darwin-x64.tar.gz"
      sha256 "0a917ebdb233106976bc53d00a47725bce1f6c1eb7ad2d8ff1facfe691372e0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.1/knowns-linux-x64.tar.gz"
      sha256 "be93ab7a301235490007e3779953520aaf85dbd7a12f613ba84865e37561ef4e"
    end
  end

  def install
    # Sidecar bundle goes into libexec so @loader_path resolves the dylib
    # and the .node addon as siblings of knowns-embed.
    libexec.install "knowns-embed"
    libexec.install Dir["libonnxruntime*"]
    libexec.install "onnxruntime_binding.node" if File.exist?("onnxruntime_binding.node")
    bin.install "knowns"
    bin.install_symlink libexec/"knowns-embed"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
