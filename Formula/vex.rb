class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.25.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.25.5/vex-aarch64-apple-darwin.tar.gz"
      sha256 "87e9e8295742291df01b0b7d442ebb75409c27daf87cd528970a66af1f279a60"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.25.5/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42da92cfd7fa190312a4178d80a7a5d3d7a751f3d072ab3ef14ffeac113c0014"
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
