class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.0.4/kubectl-tmux-exec-0.0.4.tar.gz"
    version "0.0.4"
    sha256 "cd5f475653031b1e408dd0d893c3c22592e89ac981142c41e62007bca56716bd"
    depends_on "gnu-getopt"
    depends_on "tmux"

    bottle :unneeded

    def install
        prefix.install "LICENSE"
        libexec.install Dir["*"]
        (bin/"kubectl-tmux_exec").write_env_script "#{libexec}/bin/kubectl-tmux_exec", :GNU_GETOPT_PREFIX => Formula["gnu-getopt"].opt_prefix
    end

    test do
    end
end
