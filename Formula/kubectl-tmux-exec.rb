class KubectlTmuxExec < Formula
  desc "Kubectl plugin that uses Tmux to multiplex commands to pods"
  homepage "https://github.com/predatorray/kubectl-tmux-exec"
  url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.3.0/kubectl-tmux-exec-0.3.0.tar.gz"
  sha256 "ed37019e56bac84362a255b7236d1d83e7b487a792f2689137ab5c75978f3009"

  depends_on "gnu-getopt"
  depends_on "tmux"

  def install
    prefix.install "LICENSE"
    prefix.install "VERSION"
    libexec.install "bin/kubectl-tmux_exec"
    (bin/"kubectl-tmux_exec").write_env_script "#{libexec}/kubectl-tmux_exec",
      GNU_GETOPT_PREFIX: Formula["gnu-getopt"].opt_prefix
  end

  test do
    system "#{bin}/kubectl-tmux_exec", "--version"
  end
end
