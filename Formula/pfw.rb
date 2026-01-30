class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.4.tar.gz"

  sha256 "fa8666dacdce092772da2d0707f0b82c6206b1b16f86efdf3cc6579cf48c3109"

  bottle do
    root_url "https://github.com/pointfreeco/homebrew-tap/releases/download/pfw-0.0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "457d6806f84334c04037224ca56c69a1bfa75223397f2d330b8355c18de978e1"
  end

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
