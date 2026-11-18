class Knowns < Formula
  desc "The memory layer for AI-native software development"
  homepage "https://knowns.sh"
  version "0.36.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.1/knowns-darwin-arm64.tar.gz"
      sha256 "39534be795e47807053367592041591a0da0a184c140530137c6f94d50a7a9cd"
    end
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.1/knowns-darwin-x64.tar.gz"
      sha256 "362538054905bb7e20eb528eb625af739389de5a415474dfbf1787b8afed7695"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/knowns-dev/knowns/releases/download/v0.36.1/knowns-linux-x64.tar.gz"
      sha256 "b8957266496fe47d62652dd432223e9bb29d9760558297314506c699fd40fbd1"
    end
  end

  def install
    # The archive's  is the engine and  the launcher (layout.json);
    # installed, the launcher is  and the engine sits beside it as knowns-engine.
    bin.install "knowns" => "knowns-engine"
    bin.install "knowns.launcher" => "knowns"
    bin.install_symlink "knowns" => "kn"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/knowns --version")
  end
end
