class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.22.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "9490db1762c81cd49bf46aad1a3c661841a16ff28ef02d0ffac1667163910c72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.22.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98475a794e859e57539700c2b11829af949ae0d59bd2a7386cabc7a09e715a7c"
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
