class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.13.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "954f2caf716c01988e986fd1b7f1d0e604a157d51ace8a7762d253538ebeeab5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.13.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65f90e998b243d5d430533b2e182eaea25794bacc158491c258dd2342ce3803f"
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
