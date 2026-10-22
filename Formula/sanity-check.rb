class SanityCheck < Formula
  desc "Find API keys, passwords and tokens leaked into shell history"
  homepage "https://github.com/softway-solutions/sanity-check"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.2.0/sanity-check_0.2.0_darwin_arm64.tar.gz"
      sha256 "5b53f47519b2f6510e1ea029630efd95c26d0ebe74728fa7f5beb664acd01282"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.2.0/sanity-check_0.2.0_darwin_amd64.tar.gz"
      sha256 "922a66535427a0f6710e4a7250d87dbf18cb56ba9c0f00e1af2b0a16761921f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.2.0/sanity-check_0.2.0_linux_arm64.tar.gz"
      sha256 "efa938f9dfa4b0bca02a7e4847824e154787ac6ecfadecf89ca51a8d5032006c"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.2.0/sanity-check_0.2.0_linux_amd64.tar.gz"
      sha256 "f56af111a4bcdade7f6e4fbcea91fa1f2e3603ecf1385e61d688dddc22593287"
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
