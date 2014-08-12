require 'formula'

class Gccxml < Formula
  homepage 'http://gccxml.github.io/'
  head 'https://github.com/gccxml/gccxml/tarball/master'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
