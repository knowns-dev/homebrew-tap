class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.15.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.3/knowns-darwin-arm64.tar.gz"
      sha256 "b7e61948bd5275dacc6ff8720ff731c385e388d123b21807138bc2c60ada5f1f"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.3/knowns-darwin-x64.tar.gz"
      sha256 "693fd3f57accd0b24a7615627e186080d599498267ccb4454aa3b099580be97e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.15.3/knowns-linux-x64.tar.gz"
      sha256 "850e7174a3c49111676ba2debde2fbf60714263631bb6b452fc845c697538b9a"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "knowns-darwin-arm64" => "knowns"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "knowns-darwin-x64" => "knowns"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "knowns-linux-x64" => "knowns"
    end
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
