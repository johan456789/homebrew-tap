class Ghspeed < Formula
  desc "Check GitHub/Fastly download health from your current network"
  homepage "https://github.com/johan456789/homebrew-tap"
  url "https://raw.githubusercontent.com/johan456789/homebrew-tap/v1.0.0/ghspeed"
  sha256 "24e13c8ce3db75d56be4b4a4d461d65589b48226e451bc2a87f54552f2c22461"
  version "1.0.0"
  license "MIT"

  def install
    bin.install "ghspeed"
  end

  test do
    assert_match "ghspeed #{version}", shell_output("#{bin}/ghspeed --version")
  end
end
