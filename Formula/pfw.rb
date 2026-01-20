class Pfw < Formula
  desc "The Point-Free Way CLI for installing/updating skill documents"
  # homepage "https://github.com/pointfreeco/pfw-cli"
  url "https://github.com/pointfreeco/pfw-cli/archive/refs/heads/main.tar.gz"
  version "0.0.1"

  def install
    system "swift", "build",
      "--configuration", "release",
      "--disable-sandbox"

    bin.install ".build/release/pfw"
  end
end

