class Vex < Formula
  desc "Fast hybrid structural + semantic code search (vector + index)"
  homepage "https://github.com/tenatarika/vex"
  version "1.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tenatarika/vex/releases/download/v1.28.0/vex-aarch64-apple-darwin.tar.gz"
      sha256 "2375bf120b9dd1a8ccb2d3b4f806714469fb7af19e7978e2b493c5e4647128a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tenatarika/vex/releases/download/v1.28.0/vex-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d92ea82b884435bb6473370f4124d41359ff5f5fdc57ec94527a3b4bdaa767c"
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
