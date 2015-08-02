class Zzz < Formula
  desc "Command-line tool to put Macs to sleep"
  homepage "https://github.com/Orc/Zzz"
  head "https://github.com/Orc/Zzz.git"

  # No test is possible: this has no --help or --version, it just
  # sleeps the Mac instantly.
  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end
