class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.10.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "ba709c77ba9d99a561ed0ea45a39ac05eb4ccbf633619ce0278a80a91a743f9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.10.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c079eb17d962c781e04465b867ec74e23ca3c78dd004c4a19d9d78498d88b4d"
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
