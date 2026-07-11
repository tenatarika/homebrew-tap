class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.25.1/vex-aarch64-apple-darwin.tar.gz"
      sha256 "7a81ad42d42359a1ebb7251673d336dad968eef9196a1ce3d91dd0dce1dd24c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.25.1/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3b02a99e196f2fc3adef0b86132d5ecff8e1360c235341d2d5c048242179230"
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
