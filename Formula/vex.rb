class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  url "https://github.com/tenatarika/vex/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "7db946a96c626686eda74a180dc48ad2d9ce79753e8f32125aaee7cf6e347589"
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
