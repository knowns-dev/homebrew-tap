class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.16.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.3/knowns-darwin-arm64.tar.gz"
      sha256 "cd6d787f04220fdaee674f7899ba129bb9da175d828c5682adc838fd65c83699"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.3/knowns-darwin-x64.tar.gz"
      sha256 "8847dc88427257a1513b184351e208af680caad520055337a4f068d9f9739b04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.16.3/knowns-linux-x64.tar.gz"
      sha256 "b4c8129312cf20729d282e86577faac6e8653248edfc8eb4d4f7e35d3ccfd945"
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
