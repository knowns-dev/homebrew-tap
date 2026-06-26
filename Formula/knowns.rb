class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.26.0/knowns-darwin-arm64.tar.gz"
      sha256 "962ac129f50974d835939f168ada7a667e2a5326faa5552463bce7bddc21e535"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.26.0/knowns-linux-x64.tar.gz"
      sha256 "e1fe922fcf9c14c5735fca0257cb9627dd475b4b2a4126736a781df71972769a"
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
