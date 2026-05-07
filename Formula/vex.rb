class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  url "https://github.com/tenatarika/vex/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b7dec58dd0c372c9632d2d420296561f709514e9a4f101d7fd1553aaa116e5a8"
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
