class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.4/imagor-mcp_v0.7.4_darwin_arm64"
      sha256 "0d312e4bfd87855e7bbb656edf8411eccfa39da6d5bc5cf1d01f1da5e9faac4c"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.4/imagor-mcp_v0.7.4_darwin_amd64"
      sha256 "a07e0e5f858934953bd370a0ff952573c43fe8ee1be4afd8e992963b9b5fc806"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.4/imagor-mcp_v0.7.4_linux_arm64"
      sha256 "7e40611fe3b3298286b2a78796699551c3e259773e87c4e464273d41dc243eba"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.4/imagor-mcp_v0.7.4_linux_amd64"
      sha256 "630cbdb4e886eac3f4a7a25b0576b629997a2e21eaa82e577919d3b46baf9aef"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
