class KubectlTmuxExec < Formula
  desc "Kubectl plugin that uses Tmux to multiplex commands to pods"
  homepage "https://github.com/predatorray/kubectl-tmux-exec"
  url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.4.0/kubectl-tmux-exec-0.4.0.tar.gz"
  sha256 "f82c498432f02a7ff619546733011360426a16190a122f849a9a8a82e795ee1e"

  depends_on "gnu-getopt"
  depends_on "tmux"

  def install
    prefix.install "LICENSE"
    prefix.install "VERSION"
    libexec.install "bin/kubectl-tmux_exec"
    (bin/"kubectl-tmux_exec").write_env_script "#{libexec}/kubectl-tmux_exec",
      GNU_GETOPT_PREFIX: Formula["gnu-getopt"].opt_prefix
    bin.install "bin/kubectl_complete-tmux_exec"
  end

  test do
    system "#{bin}/kubectl-tmux_exec", "--version"
  end
end
