class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.2.tar.gz"

  sha256 "855aac98cbce3c983c352e11c2e3d3e0974f30dba6063a647496c6312501fbdb"

  depends_on xcode: ["16.0", :build]

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args,
      "--configuration", "release",
      "--product", "pfw"
    bin.install ".build/release/pfw"
  end

  test do
    assert_match(version.to_s, shell_output("#{bin}/pfw --version"))
  end
end
