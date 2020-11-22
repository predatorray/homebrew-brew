class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.2.0/kubectl-tmux-exec-0.2.0.tar.gz"
    version "0.2.0"
    sha256 "309c0655cb0679384fa334f5e6b60107871720b6cca3a222aef62bcb5842c281"
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
