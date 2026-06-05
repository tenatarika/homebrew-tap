class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.14.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "9b4c57a1dc62514a7bd6619daac015bd39d86cf3b46eab100752427a39bb1a7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.14.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04b195f93659d2b2f1ae70e334bb0fa1aa711870a01d2d6c626e80f15ac49d28"
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
