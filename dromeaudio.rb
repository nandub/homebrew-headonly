require 'formula'

class Dromeaudio < Formula
  homepage 'https://github.com/joshb/dromeaudio/'
  head 'https://github.com/joshb/dromeaudio.git'

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
