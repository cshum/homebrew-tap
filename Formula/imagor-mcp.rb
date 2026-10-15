class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.6/imagor-mcp_v0.7.6_darwin_arm64"
      sha256 "44c00a5a70d526384067d6d6150803d281098a8dd4dcbb37571144a77f890323"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.6/imagor-mcp_v0.7.6_darwin_amd64"
      sha256 "9f91e514687611a1d8605eea5fb025a89ee43feb41cdd9ee4c12023056fd8613"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.6/imagor-mcp_v0.7.6_linux_arm64"
      sha256 "61c875716af7285be5617e51488770df244a31bbcc0c55c5c06760b01b036083"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.6/imagor-mcp_v0.7.6_linux_amd64"
      sha256 "6b3a8b09044b0e6219e9d6fbecd1e6e58bde62605aac7ae771eb184ff2870ce7"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
