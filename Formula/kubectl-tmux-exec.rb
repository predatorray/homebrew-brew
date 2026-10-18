class KubectlTmuxExec < Formula
  desc "Kubectl plugin that uses Tmux to multiplex commands to pods"
  homepage "https://github.com/predatorray/kubectl-tmux-exec"
  url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.6.0/kubectl-tmux-exec-0.6.0.tar.gz"
  sha256 "388b62a69c89a9a58dceb4e66845e4ffeee6367ac6c8b8ad63876d56830541cd"
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
