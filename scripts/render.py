#!/usr/bin/env python3
"""Render Formula/imagor-mcp.rb from the latest imagor-mcp release.

Lives here rather than in the server repo because the tap owns its own formula:
updating it needs write access to this repository, and a token scoped to the
server repo cannot push here. Polling keeps the credential problem inside one
repository instead of spreading a PAT across two.
"""
import hashlib, json, os, pathlib, urllib.request

REPO = "cshum/imagor-mcp"
PLATFORMS = [("macos", "arm", "darwin_arm64"), ("macos", "intel", "darwin_amd64"),
             ("linux", "arm", "linux_arm64"),  ("linux", "intel", "linux_amd64")]

def get(url, token=None):
    r = urllib.request.Request(url, headers={
        "Accept": "application/vnd.github+json", "User-Agent": "homebrew-tap"})
    if token:
        r.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(r, timeout=180) as resp:
        return resp.read()

token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
rel = json.loads(get(f"https://api.github.com/repos/{REPO}/releases/latest", token))
tag = rel["tag_name"]
version = tag.lstrip("v")
assets = {a["name"]: a["browser_download_url"] for a in rel["assets"]}

blocks = {}
for osname, arch, suffix in PLATFORMS:
    name = f"imagor-mcp_{tag}_{suffix}"
    if name not in assets:
        raise SystemExit(f"release {tag} has no {name}")
    digest = hashlib.sha256(get(assets[name], token)).hexdigest()
    blocks[(osname, arch)] = (assets[name], digest)

def section(osname, indent="    "):
    out = ""
    for arch in ("arm", "intel"):
        url, digest = blocks[(osname, arch)]
        out += f"{indent}on_{arch} do\n{indent}  url \"{url}\"\n{indent}  sha256 \"{digest}\"\n{indent}end\n"
    return out

formula = f'''class ImagorMcp < Formula
  desc "Compose imagor image URLs from a JSON layout, as an MCP server"
  homepage "https://github.com/{REPO}"
  version "{version}"
  license "MIT"

  on_macos do
{section("macos")}  end

  on_linux do
{section("linux")}  end

  def install
    bin.install Dir["imagor-mcp*"].first => "imagor-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/imagor-mcp -version")
  end
end
'''

target = pathlib.Path(__file__).resolve().parent.parent / "Formula" / "imagor-mcp.rb"
target.write_text(formula)
print(f"rendered {target} for {tag} ({version})")
