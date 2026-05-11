class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  url "https://github.com/tenatarika/vex/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "6f3e646713ef65f51d653f86e47023d726fb8ddfcf4bf659aed47acb6a7fb6bf"
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
