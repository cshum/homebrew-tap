class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.8/imagor-mcp_v0.7.8_darwin_arm64"
      sha256 "64918bb2024f6952f8578174cb7b14070e02f522a3b4b5712b85c9df099043f6"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.8/imagor-mcp_v0.7.8_darwin_amd64"
      sha256 "2b22c4b172f45445d65c0589d1268d2ab1ff9e8cec0e663a3696dcc094098f17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.8/imagor-mcp_v0.7.8_linux_arm64"
      sha256 "a2bd614ae5baa2accbb37366e668f4e906d24fa8f4cb86e999b73cf1cad7534a"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.8/imagor-mcp_v0.7.8_linux_amd64"
      sha256 "c71c33d04c38bbea937f3ff3496401f272929d4edebcfdbec735760968a3dd08"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
