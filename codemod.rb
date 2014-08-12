require 'formula'

class Codemod < Formula
  homepage 'https://github.com/facebook/codemod'
  head 'https://github.com/facebook/codemod.git'

  depends_on :python

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    (libexec+'lib/python2.7/site-packages').mkpath
    system "python", 'setup.py', 'install', "--prefix=#{libexec}"
    bin.install libexec+'bin/codemod.py' => 'codemod'
    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "#{bin}/codemod", '--test'
  end
end
