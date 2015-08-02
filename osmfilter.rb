require "formula"

class Osmfilter < Formula
  homepage "http://wiki.openstreetmap.org/wiki/Osmfilter"
  head "http://m.m.i24.cc/osmfilter.c"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o osmfilter osmfilter.c"
    bin.install "osmfilter"
  end

  test do
    system "osmfilter -h"
  end
end
