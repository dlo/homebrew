class Xdelta < Formula
  desc "Binary diff, differential compression tools"
  homepage "http://xdelta.org"
  url "https://github.com/jmacd/xdelta/archive/v3.1.0.tar.gz"
  sha256 "7515cf5378fca287a57f4e2fee1094aabc79569cfe60d91e06021a8fd7bae29d"

  depends_on "xz"
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    cd "xdelta3" do
      system "autoreconf", "--install"
      system "./configure", *args
      system "make", "install"
    end
  end
end
