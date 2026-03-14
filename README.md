# homebrew-tap

Personal Homebrew tap for custom formulae.

## Install

```bash
brew tap johan456789/tap
brew install ffmpeg-zscale
```

If Homebrew core `ffmpeg` is already installed, remove it first because both
formulae install the same `ffmpeg` and `ffprobe` binaries.

## Included formulae

- `ffmpeg-zscale`: FFmpeg built from source with `--enable-libzimg` and `--enable-libx265`.
