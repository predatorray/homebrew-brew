class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.1.1/kubectl-tmux-exec-0.1.1.tar.gz"
    version "0.1.1"
    sha256 "de16c3c23082cca7749575ad472d6c597a84b9d2fd9015f1b7f9888557bc4c6d"
    depends_on "gnu-getopt"
    depends_on "tmux"

    bottle :unneeded

    def install
        prefix.install "LICENSE"
        prefix.install "VERSION"
        libexec.install "bin/kubectl-tmux_exec"
        (bin/"kubectl-tmux_exec").write_env_script "#{libexec}/kubectl-tmux_exec", :GNU_GETOPT_PREFIX => Formula["gnu-getopt"].opt_prefix
    end

    test do
    end
end
