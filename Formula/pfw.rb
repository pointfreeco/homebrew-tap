class Pfw < Formula
  desc "The Point-Free Way CLI for installing/updating skill documents"
  homepage "https://github.com/pointfreeco/pfw-cli"
  url "https://github.com/pointfreeco/pfw-cli/archive/refs/heads/main.tar.gz"
  version "0.0.1"

  sha256 "201036afc2d1b4a32b42e468f08f740b4ff6ddd616640c16446cc0f91718866d"

  def install
    system "swift", "build",
      "--configuration", "release",
      "--disable-sandbox"

    bin.install ".build/release/pfw"
  end
end

