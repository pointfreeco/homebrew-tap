class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.1.tar.gz"

  sha256 "0fe2b206bdeec050a942281cb5f6b527f539a2ae7e7b2ae9406620fa639f36e0"

  bottle do
    root_url "https://github.com/pointfreeco/homebrew-tap/releases/download/pfw-0.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6c2f3086a8ba699ad7e5c7dbf6e6b662a7f18c449416f07016fc06b7d93ce152"
    sha256 cellar: :any_skip_relocation, sequoia:     "db9330129e453264304b9b5094033552481b7e7becf2d48b62408369bb3a6562"
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
