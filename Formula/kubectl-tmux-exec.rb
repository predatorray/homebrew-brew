class KubectlTmuxExec < Formula
  desc "Kubectl plugin that uses Tmux to multiplex commands to pods"
  homepage "https://github.com/predatorray/kubectl-tmux-exec"
  url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.5.1/kubectl-tmux-exec-0.5.1.tar.gz"
  sha256 "d8bf263b1305d1df3a5aa1e133ac27967418aff589099d862cd8aa65673c60bb"
  license "MIT"

  depends_on "tmux"

  def install
    prefix.install "LICENSE"
    prefix.install "VERSION"
    libexec.install "bin/kubectl-tmux_exec"
    bin.install_symlink libexec/"kubectl-tmux_exec"
    bin.install "bin/kubectl_complete-tmux_exec"
  end

  test do
    system bin/"kubectl-tmux_exec", "--version"
  end
end
