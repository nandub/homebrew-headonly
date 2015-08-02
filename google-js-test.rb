require 'formula'

class GoogleJsTest < Formula
  homepage 'http://code.google.com/p/google-js-test/'
  url 'https://google-js-test.googlecode.com/files/gjstest-1.0.8.tar.bz2'
  sha1 '2209dd0c700f9420e29a844920f8614e3d97156d'

  depends_on :macos => :snow_leopard
  depends_on 'gflags'
  depends_on 'glog'
  depends_on 'protobuf'
  depends_on 're2'
  depends_on 'v8'

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
