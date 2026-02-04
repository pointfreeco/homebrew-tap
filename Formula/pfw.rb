class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.7.tar.gz"

  sha256 "f78b3196831bdaec10021c351eb832589491e5eba076e64f5c1b8b8e6fcc3333"

  bottle do
    root_url "https://github.com/pointfreeco/homebrew-tap/releases/download/pfw-0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "19ed953123b74679285cde996078bfa9ef45e4ec3ed153b4617c28ec19d620ca"
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
