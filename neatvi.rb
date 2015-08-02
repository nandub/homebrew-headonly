class Neatvi < Formula
  desc "ex/vi clone for editing bidirectional uft-8 text"
  homepage "http://repo.or.cz/w/neatvi.git"
  head "git://repo.or.cz/neatvi.git"

  def install
    system "make"
    bin.install "vi" => "neatvi"
  end
end
