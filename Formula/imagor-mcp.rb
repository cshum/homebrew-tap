class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.6.1/imagor-mcp_v0.6.1_darwin_arm64"
      sha256 "4ec1b64fd0531789a3e910ce2b79e7aa66d095f859755e3e6dc08190046bf814"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.6.1/imagor-mcp_v0.6.1_darwin_amd64"
      sha256 "c61d04a9ce04e47c57fa3b14ac7bf855a75d4da735689ba6a5816fc1c9aaa24e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.6.1/imagor-mcp_v0.6.1_linux_arm64"
      sha256 "4a86e3bc3d94f04699f19c5b0778f67c59b1cde9dbbf6c9f7170250dac9dd43f"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.6.1/imagor-mcp_v0.6.1_linux_amd64"
      sha256 "c8e63b3b483843d959c3bfc75d5c2f6b173884ac6c68f65ef05e9716ccb0dddf"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
