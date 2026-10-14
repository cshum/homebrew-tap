class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.0/imagor-mcp_v0.7.0_darwin_arm64"
      sha256 "4dce51569bec2766e540fdc0b29f06223e409e5ca7436ada3c3d643bfcddc7c0"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.0/imagor-mcp_v0.7.0_darwin_amd64"
      sha256 "cf06791bc7fa3f45bb2c1829e54d31127f7ca091cc3801bf098155af68cbf90c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.0/imagor-mcp_v0.7.0_linux_arm64"
      sha256 "919df58c55ba588b23bfafa4035a3511607c205a4ef4ce3dd5034430f20bb22f"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.0/imagor-mcp_v0.7.0_linux_amd64"
      sha256 "752571225e7b1c271aafddb7471345d2d80288e0dc428b136f1acd8eeec9d74b"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
