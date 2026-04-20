class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.0/knowns-darwin-arm64.tar.gz"
      sha256 "e0bc395af8a35baeb7a3de111906d8366cbc562253ef76d01c36f6a4c03c743c"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.0/knowns-darwin-x64.tar.gz"
      sha256 "8c668ba91022b9cf7e6dab45e0629fe8d234c3d7adabc8ec3f85c9303128ff53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.0/knowns-linux-x64.tar.gz"
      sha256 "97f3241e26b2f5364dc79ac24a46588dfab10abecfe1cb5e5ed6fb1554d043b6"
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
