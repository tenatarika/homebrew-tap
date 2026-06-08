class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.2/vex-aarch64-apple-darwin.tar.gz"
      sha256 "d3448b05cc7a23cc7678e14701103aa656cb3cf509eab21545e4e42772d857ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.15.2/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b561969f008f3f1509bcbe0868ca8e54374962699b401b9baad3e84ce52e29dd"
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
