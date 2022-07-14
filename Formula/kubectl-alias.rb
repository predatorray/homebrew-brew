class KubectlAlias < Formula
  desc "Missing alias command for kubectl"
  homepage "https://github.com/predatorray/kubectl-alias"
  url "https://github.com/predatorray/kubectl-alias/releases/download/v0.0.1/kubectl-alias-0.0.1.tar.gz"
  sha256 "2439ccff1ee6f3f869cc015686699362a271fd2dd237be8ab732411354ebedf7"
  license "MIT"

  depends_on "gnu-getopt"

  def install
    prefix.install "LICENSE"
    prefix.install "VERSION"
    libexec.install "bin/kubectl-alias"
    (bin/"kubectl-alias").write_env_script "#{libexec}/kubectl-alias",
      GNU_GETOPT_PREFIX: Formula["gnu-getopt"].opt_prefix
  end

  def caveats
    <<~EOS
      IMPORTANT! Please also add this line to your rc file.
      ```
      export PATH="$PATH:#{prefix}/alias"
      ```
    EOS
  end

  test do
    system "#{bin}/kubectl-alias", "--version"
  end
end
