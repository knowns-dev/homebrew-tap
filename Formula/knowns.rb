class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.33.0/knowns-darwin-arm64.tar.gz"
      sha256 "f94e4f9544d0224d26b742bf38b6361b9f316bab79a87f8aad44a858612dfe74"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.33.0/knowns-darwin-x64.tar.gz"
      sha256 "68f6fd5cf7487e715b86877d993984f7e957dcf2163b45b199edbffef6f21fbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.33.0/knowns-linux-x64.tar.gz"
      sha256 "150f32143778c0be77d0e957f8ca9f70e91dd6b4c1c6412ab85252f36134c0c8"
    end
  end

  def install
    bin.install "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
