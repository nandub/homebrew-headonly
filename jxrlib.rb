class Jxrlib < Formula
  desc "Tools for JPEG-XR image encoding/decoding"
  homepage "https://jxrlib.codeplex.com/"

  head "https://git01.codeplex.com/jxrlib", :using => :git

  def install
    system "make", "install", "DIR_INSTALL=#{prefix}"
  end

  test do
    bmp = "Qk06AAAAAAAAADYAAAAoAAAAAQAAAAEAAAABABgAAAAAAAQAAADDDgAAww4AAAAAAAAAAAAA////AA==".unpack("m")[0]
    infile  = "test.bmp"
    outfile = "test.jxr"
    File.open(infile, "wb") { |f| f.write bmp }
    system bin/"JxrEncApp", "-i", infile,  "-o", outfile
    system bin/"JxrDecApp", "-i", outfile, "-o", infile
  end
end
