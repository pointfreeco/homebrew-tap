class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.3.tar.gz"

  sha256 "7dcf5a8729ec31477e89a56c15d5af73880ec2bf4e8117956f707a25b3bd1014"

  bottle do
    root_url "https://github.com/pointfreeco/homebrew-tap/releases/download/pfw-0.0.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "da85c4c4eaf2baa343b06419c415a612149dc78f3644f11aec3325a5e466214f"
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
