require "formula"

class Termbox < Formula
  homepage "https://code.google.com/p/termbox/"
  head "https://github.com/nsf/termbox.git"

  def install
    system "./waf", "configure", "--prefix=#{prefix}"
    system "./waf"
    system "./waf", "install"
  end
end
