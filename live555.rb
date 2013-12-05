require 'formula'

class Live555 < Formula
  homepage 'http://www.live555.com/liveMedia/'
  head 'http://www.live555.com/liveMedia/public/live555-latest.tar.gz'

  def install
      system "./genMakefiles", "macosx"

      %W{ BasicUsageEnvironment/Makefile
          UsageEnvironment/Makefile
          groupsock/Makefile
          liveMedia/Makefile
          mediaServer/Makefile
          proxyServer/Makefile
          testProgs/Makefile }.each do | file |
          chmod 0755, file
          inreplace file, "PREFIX = /usr/local", "PREFIX = #{prefix}"
      end

      system "make"
      system "make install"

      include.install_symlink Dir[include + 'BasicUsageEnvironment/*']
      include.install_symlink Dir[include + 'UsageEnvironment/*']
      include.install_symlink Dir[include + 'groupsock/*']
      include.install_symlink Dir[include + 'liveMedia/*']
  end

  def test
    system "#{bin}/openRTSP 2>&1 | grep -q startPortNum"
  end
end
