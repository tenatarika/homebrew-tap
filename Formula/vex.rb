class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.19.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "306d88e43c8605abd7ccc2f0c5961e35b25d7a9630b3fe0022fc927629694b3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.19.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "611d5d9cfc06ecc904c498a6681a94723b0981f59db3294738e165483e77b726"
    end
  end

  head do
    url "https://github.com/tenatarika/vex.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      # Match the prebuilt bottle: bake CoreML into macOS source
      # builds. Linux --HEAD stays CPU (no vendor-agnostic EP; CUDA
      # needs a host SDK). See docs/GPU_SUPPORT.md §6.
      args = std_cargo_args
      args += ["--features", "gpu-coreml"] if OS.mac?
      system "cargo", "install", *args
    else
      bin.install "vex"
    end
  end

  test do
    assert_match "vex #{version}", shell_output("#{bin}/vex --version")
  end
end
