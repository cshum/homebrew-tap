class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.2/imagor-mcp_v0.7.2_darwin_arm64"
      sha256 "b76e5896217a1a04ce34d0a3ef88e7135ce04704f051b52ad96690868e90bb8e"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.2/imagor-mcp_v0.7.2_darwin_amd64"
      sha256 "45bc8b0e66abee43af40918cb0842b3b32870cb1f0b964db3d18f8490cbe655a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.2/imagor-mcp_v0.7.2_linux_arm64"
      sha256 "3b891bbabfaee907adfc53f5c2d7c53b16ae2b9f702b778292e1330b4408a271"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.2/imagor-mcp_v0.7.2_linux_amd64"
      sha256 "1a3a8a821f1cbfed5b15b723114282deaf796250fab06700e9890964a660ec2f"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
