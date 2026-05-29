class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.10.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "3eef25e3f0c1d042cd3cf32cd06b1e27b8e60bd4613978e80762adf612ee9fc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.10.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29596ed9c456ff7cfbdd4911e2007d01ebc21e202dd266f235183224bfbdcd39"
    end
  end

  head do
    url "https://github.com/tenatarika/vex.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "vex"
    end
  end

  test do
    assert_match "vex #{version}", shell_output("#{bin}/vex --version")
  end
end
