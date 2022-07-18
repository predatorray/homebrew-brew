class KubectlAlias < Formula
  desc "Missing alias command for kubectl"
  homepage "https://github.com/predatorray/kubectl-alias"
  url "https://github.com/predatorray/kubectl-alias/releases/download/v0.0.3/kubectl-alias-0.0.3.tar.gz"
  sha256 "b56756a0ea409147d689339ef2951c105f0a7a17bcfd6c8bcb3fe41f53efe33c"
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
