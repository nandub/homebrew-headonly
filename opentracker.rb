require "formula"

class Opentracker < Formula
  homepage "http://erdgeist.org/arts/software/opentracker/"
  head ":pserver:anoncvs:@cvs.erdgeist.org:/home/cvsroot", :using => :cvs

  option "without-full-scrape", "Enable full scrape"
  option "with-ipv6", "IPv6-only tracker"
  option "with-sync-live", "Enable multicast sync"
  option "with-ip-from-query", "Trust IP from query string"
  option "with-gzip", "Use gzip if client requests it"
  option "with-syslog", "Use syslog"
  option "with-dev-random", "Use /dev/random"

  depends_on "libowfat" => :build

  def install
    libowfat_headers = "#{Formula["libowfat"].opt_include}/libowfat"

    features = []
    features << "-DWANT_FULLSCRAPE" if build.with? "full-scrape"
    features << "-DWANT_V6" if build.with? "ipv6"
    features << "-DWANT_SYNC_LIVE" if build.with? "sync-live"
    features << "-DWANT_IP_FROM_QUERY_STRING" if build.with? "ip-from-query"
    features << "-DWANT_COMPRESSION_GZIP" if build.with? "gzip"
    features << "-DWANT_SYSLOGS" if build.with? "syslog"
    features << "-DWANT_DEV_RANDOM" if build.with? "dev-random"

    system "make", "opentracker", "FEATURES=#{features.join(" ")}", "LIBOWFAT_HEADERS=#{libowfat_headers}"
    bin.install "opentracker"
  end
end
