class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.5/imagor-mcp_v0.7.5_darwin_arm64"
      sha256 "cb84dfe7c366c509d03b31e4e9ecf122a17174ccc4dbd7e41e138e0327cf0ae0"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.5/imagor-mcp_v0.7.5_darwin_amd64"
      sha256 "49359a0c1c5ed6543ff9a4d58d96ed15b3f81705ac9efb7820de9b04eb3b16fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.5/imagor-mcp_v0.7.5_linux_arm64"
      sha256 "fc3e42c1f9291181a6f95b681ec1856a7106d936073e0ef94e06281ab973b9d5"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.5/imagor-mcp_v0.7.5_linux_amd64"
      sha256 "c1d91a6761cf72ba1ea6c45a9380359664c3694027fbba54c8b361ff61db6422"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
