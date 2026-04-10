class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.0/knowns-darwin-arm64.tar.gz"
      sha256 "f372afdf774e9b418c67478500a52730fc69765d1e73a55d2d9d517b29be13ae"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.0/knowns-darwin-x64.tar.gz"
      sha256 "6be972fa36049866c36f63fdcfc452a341af883ac1f39c3d21237850a247afd9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.18.0/knowns-linux-x64.tar.gz"
      sha256 "8e1df012a8da16a7ab1f6a2c2eaee98000093d651af423e61b12f8029240da6c"
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
