class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.0/knowns-darwin-arm64.tar.gz"
      sha256 "f2846bca6a1e809a6b968b50bc100224b336e3901a51fa187510bb7f3b706652"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.0/knowns-darwin-x64.tar.gz"
      sha256 "4e7620646589237aadbddfbaba586135f7ceff32b70c98891df441fbdc93d34a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.34.0/knowns-linux-x64.tar.gz"
      sha256 "92dd182af9505affa6b97cf625b24a4305de8f53c028e59ec63999964957f578"
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
