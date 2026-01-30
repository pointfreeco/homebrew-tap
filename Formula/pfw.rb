class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.5.tar.gz"

  sha256 "cf85c1d5241fb07e68b30796c2119c12b4ee9b3dc82112c7e48b93232a2cdd10"

  bottle do
    root_url "https://github.com/pointfreeco/homebrew-tap/releases/download/pfw-0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "eaffed4ad66589e6dad72d676729d582aac1ca347200bce8f7931ba92f12586d"
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
