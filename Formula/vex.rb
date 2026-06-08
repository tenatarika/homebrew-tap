class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "a78f90d3a2921788845b5fa19288915209cf0a162b08b8650363fc9113bca373"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f25f40f99fac7b3730791806aeeee59537c8ed9aebacba054089cc5af714500e"
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
