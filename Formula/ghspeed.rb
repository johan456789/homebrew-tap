class Ghspeed < Formula
  desc "Check GitHub/Fastly download health from your current network"
  homepage "https://github.com/johan456789/homebrew-tap"
  url "https://raw.githubusercontent.com/johan456789/homebrew-tap/v1.1.0/ghspeed"
  sha256 "7e429b6ad5446c13c3e3364ec587a8e70fc9fa35fda7dd2b3264d3486393020e"
  version "1.1.0"
  license "MIT"

  def install
    bin.install "ghspeed"
  end

  test do
    assert_match "ghspeed #{version}", shell_output("#{bin}/ghspeed --version")
  end
end
