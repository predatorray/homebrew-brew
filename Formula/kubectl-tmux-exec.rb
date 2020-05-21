class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.1.0/kubectl-tmux-exec-0.1.0.tar.gz"
    version "0.1.0"
    sha256 "7c7d18f497524dff098c737c0fe8e031347d0d201864c22c52984eab06ca33e4"
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
