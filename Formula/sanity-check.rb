class SanityCheck < Formula
  desc "Find API keys, passwords and tokens leaked into shell history"
  homepage "https://github.com/softway-solutions/sanity-check"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.1/sanity-check_0.1.1_darwin_arm64.tar.gz"
      sha256 "dfe06a058e87597433b121b5852d3ad9b7849104f9cf412984e7f949afa41f4c"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.1/sanity-check_0.1.1_darwin_amd64.tar.gz"
      sha256 "1adee247ffde6ce683e19e9312d8cf199c4d9f78dfdcf64e190a4b9d7aa8f7de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.1/sanity-check_0.1.1_linux_arm64.tar.gz"
      sha256 "1d12deb34e9846f668e6b5d051c772e0434e97d06f57b6ff231feba5f6c45211"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.1/sanity-check_0.1.1_linux_amd64.tar.gz"
      sha256 "e01a37a64887f0d158b64c0b67cd079827a076ceb52047f08435f02e23a1539e"
    end
  end

  def install
    bin.install "sanity-check"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sanity-check --version")
    assert_equal "", pipe_output("#{bin}/sanity-check --no-color -", "ls -la\n", 0)
    output = pipe_output("#{bin}/sanity-check --no-color -", "export DB_PASSWORD=Zq8rLm2vKx9\n", 1)
    assert_match "secret-assignment", output
  end
end
