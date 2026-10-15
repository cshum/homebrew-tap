class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.9/imagor-mcp_v0.7.9_darwin_arm64"
      sha256 "42168bcf25030c00a1236e470450973023a8e56c36cbc9d0e3035475b3faa58d"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.9/imagor-mcp_v0.7.9_darwin_amd64"
      sha256 "addb826deb979bc9bdba6763e54224d000cae8e8347613a6e0d23e8c5aeaf03b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.9/imagor-mcp_v0.7.9_linux_arm64"
      sha256 "1fea3811e7fd36a9779494e007cca8fae0964070529722248a66622f25ac9ec8"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.9/imagor-mcp_v0.7.9_linux_amd64"
      sha256 "4d74d66b6ee81f455568f96af255327f39921381c2427af32c7e6eb3f7318c5c"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
