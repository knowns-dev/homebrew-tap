class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.20.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.4/knowns-darwin-arm64.tar.gz"
      sha256 "01e877f91b8d9b7ba9ccccdead9d934c009612781a23e5980604ee8ed3edb7fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.20.4/knowns-linux-x64.tar.gz"
      sha256 "c7e6854f4acb42472d7d06bf54724483c6a5f22f6f9af7c66798cca1cf27c039"
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
