class Pfw < Formula
  desc "The Point-Free Way CLI"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw-cli/archive/refs/heads/main.tar.gz"
  version "0.0.1"

  sha256 "a9ddcbf5df7ee9adbb39a99919b757c19bd35eae752c7faf0f30a3cfc8c1f885"

  def install
    system "swift", "build",
      "--configuration", "release",
      "--disable-sandbox"

    bin.install ".build/release/pfw"
  end
end
