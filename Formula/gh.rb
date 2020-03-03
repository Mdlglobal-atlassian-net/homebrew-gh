# This file was generated by GoReleaser. DO NOT EDIT.
class Gh < Formula
  desc "GitHub CLI"
  homepage "https://github.com/cli/cli"
  version "0.6.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cli/cli/releases/download/v0.6.0/gh_0.6.0_macOS_amd64.tar.gz"
    sha256 "25d9f2730021f49c201a7dcf9a7bfc001113afc09e3b6401e5da1f9e19a67e29"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cli/cli/releases/download/v0.6.0/gh_0.6.0_linux_amd64.tar.gz"
      sha256 "325967816c0353289d124ef6e034b3fce7cefecac610ba4bed04654d3fb45203"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cli/cli/releases/download/v0.6.0/gh_0.6.0_linux_arm64.tar.gz"
        sha256 "b1d7a60d0bc717038bbb017ca26c1e48e11dd83984b196ffe08081ae42a5adcf"
      else
      end
    end
  end
  
  head do
    url "https://github.com/cli/cli.git"
    depends_on "go"
  end

  def install
    system "make" if build.head?
    bin.install "bin/gh"
    (bash_completion/"gh.sh").write `#{bin}/gh completion -s bash`
    (zsh_completion/"_gh").write `#{bin}/gh completion -s zsh`
    (fish_completion/"gh.fish").write `#{bin}/gh completion -s fish`
  end

  test do
    help_text = shell_output("#{bin}/gh --help")
    assert_includes help_text, "Usage:"
  end
end
