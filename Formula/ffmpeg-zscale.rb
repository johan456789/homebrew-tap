class FfmpegZscale < Formula
  desc "FFmpeg with libzimg/zscale and libx265 enabled"
  homepage "https://ffmpeg.org/"
  url "https://ffmpeg.org/releases/ffmpeg-8.0.1.tar.xz"
  sha256 "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://ffmpeg.org/download.html"
    regex(/href=.*?ffmpeg[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  depends_on "pkgconf" => :build
  depends_on "x265"
  depends_on "zimg"

  uses_from_macos "bzip2"
  uses_from_macos "libxml2"

  on_linux do
    depends_on "xz"
    depends_on "zlib-ng-compat"
  end

  conflicts_with "ffmpeg", because: "both install ffmpeg, ffprobe, and related binaries"
  conflicts_with "ffmpeg@7", because: "both install ffmpeg and ffprobe binaries"
  conflicts_with "ffmpeg@6", because: "both install ffmpeg and ffprobe binaries"
  conflicts_with "ffmpeg@5", because: "both install ffmpeg and ffprobe binaries"
  conflicts_with "ffmpeg@4", because: "both install ffmpeg and ffprobe binaries"

  def install
    # Avoid duplicate symbol issues with Apple's newer linker.
    if OS.mac? && DevelopmentTools.ld64_version&.between?("1015.7", "1022.1")
      ENV.append "LDFLAGS", "-Wl,-ld_classic"
    end

    args = %W[
      --prefix=#{prefix}
      --enable-gpl
      --enable-shared
      --enable-pthreads
      --enable-version3
      --cc=#{ENV.cc}
      --host-cflags=#{ENV.cflags}
      --host-ldflags=#{ENV.ldflags}
      --disable-ffplay
      --enable-libx265
      --enable-libzimg
    ]

    args << "--enable-neon" if Hardware::CPU.arm?

    system "./configure", *args
    system "make", "install"
  end

  test do
    assert_match "zscale", shell_output("#{bin}/ffmpeg -hide_banner -filters 2>&1")
    assert_match "libx265", shell_output("#{bin}/ffmpeg -hide_banner -encoders 2>&1")
  end
end
