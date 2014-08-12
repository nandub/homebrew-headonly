require "formula"

class Shairport < Formula
  homepage "https://github.com/abrasive/shairport"
  head "https://github.com/abrasive/shairport.git"

  depends_on 'pkg-config' => :build
  depends_on 'pulseaudio' => :optional
  depends_on 'libao' => :optional
  depends_on 'openssl'

  def install
    system "./configure"
    system "make", "install", "PREFIX=#{prefix}"
  end
end
