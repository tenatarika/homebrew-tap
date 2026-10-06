class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.27.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.27.3/vex-aarch64-apple-darwin.tar.gz"
      sha256 "5a0983318fe12551264a7794b55bc3c62b4be07eaa23bf94eaf12b7f808c1ed0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.27.3/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f1fef131ccba2ed66d0577ad2ab3d76f59ffdbef44f819499821334f3167799"
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
    # The prebuilt binary is built from the tag checkout and prints
    # the git-describe form "vex v1.27.2"; also accept the bare
    # "vex 1.27.2" of a build without .git. (No backticks in this
    # heredoc: it is unquoted, so the shell would run them.)
    assert_match(/\Avex v?#{Regexp.escape(version.to_s)}\z/, shell_output("#{bin}/vex --version").strip)
  end
end
