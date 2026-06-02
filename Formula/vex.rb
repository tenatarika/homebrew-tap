class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.2/vex-aarch64-apple-darwin.tar.gz"
      sha256 "3857072f3a6515cf3ec5b3a110c6f6f8b7f33a82ecad29932a7f8baf0168cb3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.2/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdf7ea3b025255b40f7c2ef549ed423b8a72518c1089054dc4b2bb159e5f6ba9"
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
