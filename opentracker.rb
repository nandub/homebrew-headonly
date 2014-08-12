require 'formula'

class Opentracker < Formula
  head 'cvs://:pserver:anoncvs:@cvs.erdgeist.org:/home/cvsroot:opentracker'
  homepage 'http://erdgeist.org/arts/software/opentracker/'

  # http://www.fefe.de/libowfat/
  resource 'libowfat' do
    url 'http://dl.fefe.de/libowfat-0.28.tar.bz2'
    sha1 '6bbe997ae1bbe94b784ab50a3d44b63a2e08d857'
  end

  def install
    # First libowfat must be compiled and installed where opentracker is expecting it
    libowfat_include = Pathname.new(pwd) + 'libowfat'
    resource("libowfat").stage do
      system "make", "install", "INCLUDEDIR=#{libowfat_include}", "LIBDIR=#{libowfat_include}", "MAN3DIR=."
    end

    # Tell opentracker that libowfat headers are located in the same directory as itself
    ENV['PREFIX'] = '.'

    system "make", "opentracker"
    bin.install "opentracker"
  end
end
