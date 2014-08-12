require "formula"

class ExactImage < Formula
  homepage "http://www.exactcode.com/site/open_source/exactimage/"
  head "https://svn.exactcode.de/exact-image/trunk"

  depends_on "libagg" => :build
  depends_on "pkg-config" => :build
  depends_on "freetype" => :optional

  # fixing a double inclusion
  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end

__END__
diff --git a/lib/scale.hh b/lib/scale.hh
index 0b9f75a..f3329c1 100644
--- a/lib/scale.hh
+++ b/lib/scale.hh
@@ -16,6 +16,9 @@
  * copyright holder ExactCODE GmbH Germany.
  */
 
+#ifndef _SCALE_HH
+#define _SCALE_HH
+
 // pick the best
 void scale (Image& image, double xscale, double yscale);
 
@@ -29,3 +32,5 @@ void bicubic_scale (Image& image, double xscale, double yscale);
 void ddt_scale (Image& image, double xscale, double yscale);
 
 void thumbnail_scale (Image& image, double xscale, double yscale);
+
+#endif

