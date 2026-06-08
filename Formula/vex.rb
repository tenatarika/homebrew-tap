class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.2/vex-aarch64-apple-darwin.tar.gz"
      sha256 "f40915be3b1a8b7d1c94a8c414678446d2ec69d21c5c5401e65939f40d3a8c66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.2/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa78e317134d83a842312e57efb08e622c917b5e829a87697f03bbd8a33d1c1e"
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
