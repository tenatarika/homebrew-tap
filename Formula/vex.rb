class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "0ca82a9946ba96d2255c973f48a6ba60dd515e01cf957050baea2f33164ce3b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "146a1ff119e8cf57bf0402401aadb62916007f7f1a9cd574facbab94f798e86a"
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
