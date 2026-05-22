class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  url "https://github.com/tenatarika/vex/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "cea974b8842ec4d0d083018fb277716d2cf565e86d25285a9b0b668e70b0898d"
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
