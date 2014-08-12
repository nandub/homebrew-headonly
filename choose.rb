require "formula"

class Choose < Formula
  homepage "https://github.com/geier/choose"
  head "https://github.com/geier/choose.git", :revision => "9f24eb9771cdc2c2566718822704c3ee488d8345"

  resource "urwid" do
    url  "https://pypi.python.org/packages/source/u/urwid/urwid-1.2.1.tar.gz"
    sha1 "28bd77014cce92bcb09ccc11f93e558d02265082"
  end

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'

    resource("urwid").stage do
      system "python", "setup.py", "install", "--prefix=#{libexec}"
    end

    bin.install "choose"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    # There isn't really a better test than that the executable exists
    # and is executable because you can't run it without producing an
    # interactive selection ui.
    File.executable?("#{bin}/choose")
  end
end
