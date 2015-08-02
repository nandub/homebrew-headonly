require 'formula'

class Willgit < Formula
  desc "William's miscellaneous git tools"
  homepage 'http://git-wt-commit.rubyforge.org'
  head 'https://gitorious.org/willgit/mainline.git'

  def install
    prefix.install 'bin'
  end
end
