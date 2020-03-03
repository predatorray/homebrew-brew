class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.0.2/kubectl-tmux-exec-0.0.2.tar.gz"
    version "0.0.2"
    sha256 "1699e634a19777ad8dc1e78e2f36893b11ca5c3cf0ac1f83f641af47d8060f81"
    depends_on "gnu-getopt"
    depends_on "tmux"

    bottle :unneeded

    def install
        prefix.install "LICENSE"
        libexec.install Dir["*"]
        (bin/"kubectl-tmux-exec").write_env_script "#{libexec}/bin/kubectl-tmux_exec", :GNU_GETOPT_PREFIX => Formula["gnu-getopt"].opt_prefix
    end

    test do
    end
end
