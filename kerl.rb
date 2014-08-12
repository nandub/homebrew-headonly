require "formula"

class Kerl < Formula
  homepage "https://github.com/spawngrid/kerl"
  head "https://github.com/spawngrid/kerl.git"

  def install
    bin.install "kerl"
    bash_completion.install "bash_completion/kerl"
  end
end
