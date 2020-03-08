class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.0.3/kubectl-tmux-exec-0.0.3.tar.gz"
    version "0.0.3"
    sha256 "a373f96a5e57bba9545e824ed15a8cd9c9ddf00fdcc5357d3f69255d071f02ab"
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
