require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.117.tgz"
  sha256 "ad14b4c430beaef0a0e19f3e6f0067a543c17503f916b2f4ae54f4237fca8f5a"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "fc56c0eff025f0d371492c9f4a222ddcb01a6d4656f4fbdf19149b7137fc3ab8"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
