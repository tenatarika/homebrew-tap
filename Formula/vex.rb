class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.12.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "94e532afba720843d8f8d817fd0c7746584f4902765e624541bfd6b0aafaadca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.12.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9c0b90a20b4fb6bebf73448cfb03e02ac3f62fcb326f74ecbcdc463a822c07b"
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
