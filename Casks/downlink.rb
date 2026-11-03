cask "downlink" do
  # Upstream publishes no releases, so this tap builds the app itself: the
  # build-downlink workflow compiles upstream main on a macOS arm64 runner and
  # attaches the zip to a release in this repo. version = "<Cargo version>,<short commit>";
  # the workflow rewrites version/sha256 on each build.
  version "0.1.0,7100d29"
  sha256 "b17d3d506be9daa716000f3b0a7c61323a023208ef9073e4dcc529b8b162a25a"

  url "https://github.com/ericreeves/homebrew-tap/releases/download/downlink-v#{version.csv.first}-#{version.csv.second}/Downlink-#{version.csv.first}-#{version.csv.second}.zip"
  name "Downlink"
  desc "Menu-bar live layout view and per-layer input switching for the ZSA Voyager"
  homepage "https://github.com/zayatura/downlink"

  livecheck do
    skip "Built from upstream main by the tap's build-downlink workflow"
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Downlink.app"

  # The build is ad-hoc signed (not notarized), so Gatekeeper rejects it while
  # quarantined. Strip recursively; the nested Contents/MacOS binary carries the
  # attribute too.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Downlink.app"]
  end

  uninstall quit:      "com.zayatura.downlink",
            launchctl: "com.zayatura.downlink",
            delete:    "~/Library/LaunchAgents/com.zayatura.downlink.plist"

  zap trash: [
    "~/Library/Application Support/Downlink",
    "~/Library/Caches/Downlink",
    "~/Library/Logs/Downlink",
  ]
end
