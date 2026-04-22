class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.19.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.2/knowns-darwin-arm64.tar.gz"
      sha256 "9cbc0936c8ef90b28b42df978205d614350bd34c6d5db93c25b7542ba89457fc"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.2/knowns-darwin-x64.tar.gz"
      sha256 "df42869d4611807438702654223d2f2e01da2f24af90ac7f31d831487e21f10a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.19.2/knowns-linux-x64.tar.gz"
      sha256 "c5b3e7a40690f5305fdd2a2dc3052612dc75a91bf0534c002190af69f8983e59"
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
