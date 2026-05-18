class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  url "https://github.com/tenatarika/vex/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "b2bf0571d507ce740404874dda9ce3e458e84532c9f43b7d5eef96a9ede1c197"
  license "MIT"
  head "https://github.com/tenatarika/vex.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "vex #{version}", shell_output("#{bin}/vex --version")
  end
end
