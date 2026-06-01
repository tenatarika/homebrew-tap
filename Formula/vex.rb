class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "32fb6fa32208eba432211d525fb9695de86c24840471e85ad570eebbd75d8bc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.11.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9726156fa99b5de9599a3bd0bc73ea94ef645be8326e9b79ed4ffd01bec4e7ea"
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
