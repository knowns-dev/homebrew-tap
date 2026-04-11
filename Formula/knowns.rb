class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.18.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.2/knowns-darwin-arm64.tar.gz"
      sha256 "e767f103c286b18429860c45a835620f93116592269f2298f2d130f32de6c3e0"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.2/knowns-darwin-x64.tar.gz"
      sha256 "fcbabab8a34695cb19b46f3d5b02f0ffa7a26c4cb8cc27f6a518287c5bdad34d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.2/knowns-linux-x64.tar.gz"
      sha256 "487b2e9c3a723e49cdabcb2290e1436e66e4c52a4b94c548fa9547d80f17bdaf"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "knowns" => "knowns"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "knowns" => "knowns"
    end
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
