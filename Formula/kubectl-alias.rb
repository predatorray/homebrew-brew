class KubectlAlias < Formula
  desc "Missing alias command for kubectl"
  homepage "https://github.com/predatorray/kubectl-alias"
  url "https://github.com/predatorray/kubectl-alias/releases/download/v0.0.2/kubectl-alias-0.0.2.tar.gz"
  sha256 "662bee04bbdb5cbfb9c1a5494f6ccbbc4b0e9c81b8f304d7a8f787c03ade5ad3"
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
      IMPORTANT! Please add this line to your rc (~/.zsh or ~/.bashrc) file.

        export PATH="$PATH:#{prefix}/alias"
    EOS
  end

  test do
    system "#{bin}/kubectl-alias", "--version"
  end
end
