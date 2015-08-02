require "formula"

class Libphenom < Formula
  homepage "https://facebook.github.io/libphenom"
  head "https://github.com/facebook/libphenom.git"

  depends_on "libtool" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "concurrencykit"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end
end
