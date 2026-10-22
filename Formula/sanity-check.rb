class SanityCheck < Formula
  desc "Find API keys, passwords and tokens leaked into shell history"
  homepage "https://github.com/softway-solutions/sanity-check"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.0/sanity-check_0.1.0_darwin_arm64.tar.gz"
      sha256 "06ee41785201b892b3da69988a2385972d5ccda407d3f01bbecab4c204fbf750"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.0/sanity-check_0.1.0_darwin_amd64.tar.gz"
      sha256 "2bfa272ffe78fe5b600f0833771a78358cd2c42b905aa6199e2ffd6abc0c70e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.0/sanity-check_0.1.0_linux_arm64.tar.gz"
      sha256 "8bddbbe32c359dcb6c46059aaa26e7303da8dfd960a3d869969decd2ec1660b3"
    end
    on_intel do
      url "https://github.com/softway-solutions/sanity-check/releases/download/v0.1.0/sanity-check_0.1.0_linux_amd64.tar.gz"
      sha256 "b2e54d9317c2119e45ee4da99786e0bf7ebaa1f0d64fe99a087cb5fc54640659"
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
