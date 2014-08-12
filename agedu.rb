require "formula"

class Agedu < Formula
  homepage 'http://www.chiark.greenend.org.uk/~sgtatham/agedu/'

  # The tarball here is not stable, and the checksum changes over time
  head "http://www.chiark.greenend.org.uk/~sgtatham/agedu/agedu-r10126.tar.gz"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/agedu", "-s", "."
    assert File.exist?("agedu.dat")
  end
end
