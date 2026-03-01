class KubectlTmuxExec < Formula
  desc "Kubectl plugin that uses Tmux to multiplex commands to pods"
  homepage "https://github.com/predatorray/kubectl-tmux-exec"
  url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.5.0/kubectl-tmux-exec-0.5.0.tar.gz"
  sha256 "6083d9724c028a0a70fa7266fc55518a105921e5204357c4b7e5616dbcf15739"
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
