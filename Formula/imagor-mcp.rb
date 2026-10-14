class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/cshum/imagor-mcp"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.1/imagor-mcp_v0.7.1_darwin_arm64"
      sha256 "82574d5f8dfbee8b12c0c36b7088094176d1d17d69f3f26c79bbdabcbc34dde2"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.1/imagor-mcp_v0.7.1_darwin_amd64"
      sha256 "b45adfd1297a9ac8009fd92d70b46ea72fe6b54ba4d9141bbb6f2f40727265c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.1/imagor-mcp_v0.7.1_linux_arm64"
      sha256 "5c82631abfcc986428ecd01406fedb53af2627eced639ecb95e4d7fc2c7ea87b"
    end
    on_intel do
      url "https://github.com/cshum/imagor-mcp/releases/download/v0.7.1/imagor-mcp_v0.7.1_linux_amd64"
      sha256 "a92510f44a8584f9321570485b2610db81ee7e93e35990d56a948b2514dc125a"
    end
  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imagor-mcp -version")
  end
end
