class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.7/imagor-mcp_v0.7.7_darwin_arm64"
      sha256 "fc0802605ecc052ebfcbac6df20c221e39c04a50f57b094cec7ebb6561f74468"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.7/imagor-mcp_v0.7.7_darwin_amd64"
      sha256 "1a53bc87d42b84deb0ad500d2b0688722857deda1490457d0b1065fd01002576"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.7/imagor-mcp_v0.7.7_linux_arm64"
      sha256 "cfd1b3647bca8374dab5c55be4efd206efe7c70f28abeb99fe239ef3bc49f515"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.7/imagor-mcp_v0.7.7_linux_amd64"
      sha256 "9c5648b5b7b62e08158e88b929a09a18e7f5929f9cafbc0c160d7458b7ce396b"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
