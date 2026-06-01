class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "25c027d636e6482bbf615851df8a39ec71c27afdf650ece9147e140ff69cdbe6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "111b610fd31953f808969e88b42db6ce638597a554bb4aed32260b1a546ee660"
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
