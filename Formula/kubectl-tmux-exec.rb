class KubectlTmuxExec < Formula
    desc "A kubectl plugin that uses Tmux to multiplex commands to pods"
    homepage "https://github.com/predatorray/kubectl-tmux-exec"
    url "https://github.com/predatorray/kubectl-tmux-exec/releases/download/v0.0.1/kubectl-tmux-exec-0.0.1.tar.gz"
    version "0.0.1"
    sha256 "4d83ac007e543d8afe749aa2c6e37ed48c21a2679ca6d3d3ba89a28194ffe204"
    depends_on "gnu-getopt"
    depends_on "tmux"

    bottle :unneeded

    def install
        prefix.install "LICENSE"
        libexec.install Dir["*"]
        (bin/"kubectl-tmux-exec").write_env_script "#{libexec}/bin/kubectl-tmux-exec", :GNU_GETOPT_PREFIX => Formula["gnu-getopt"].opt_prefix
    end

    test do
    end
end