class Pfw < Formula
  desc "CLI for the Point-Free Way"
  homepage "https://github.com/pointfreeco/pfw"
  url "https://github.com/pointfreeco/pfw/archive/refs/tags/0.0.9.tar.gz"

  sha256 "7a445ecaa6f79a7a63914bc097559cc0530f311c1867692b9060bd3c864b07fe"

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
