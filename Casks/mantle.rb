cask "mantle" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.6"
  sha256 arm:   "93672f8aaedbe4d5c5d4812f27177d30dad31e4217a8225189586342912e58ea",
         intel: "503fce393a3cd2fb54fe699221c46e8d2a027ea428335eede1968819415f09f1"

  # NOTE: upstream tags releases as "tauri-vX.Y.Z" but the DMG filename version
  # is frozen at 1.0.0 and does not track the tag. The bump workflow rewrites
  # the url line from the actual release asset names, so a future change to the
  # inner filename is handled automatically.
  url "https://github.com/ghsteff/mantle/releases/download/tauri-v#{version}/Mantle_1.0.0_#{arch}.dmg"
  name "Mantle"
  desc "Mac keyboard remapper powered by Kanata"
  homepage "https://github.com/ghsteff/mantle"

  # Mantle's kanata outputs through the Karabiner DriverKit VirtualHIDDevice
  # driver, which is installed by this cask (the Karabiner services themselves
  # must stay disabled — see dotfiles run_onchange_after_disable-karabiner-elements).
  depends_on cask: "karabiner-elements"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^tauri[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  app "Mantle.app"

  # No uninstall/zap for the LaunchDaemons (com.mantle.kanata,
  # com.mantle.vhid-daemon) or ~/Library/Application Support/com.mantle.app —
  # the kanata config there is chezmoi-managed and removing the daemons would
  # kill keyboard remapping out from under an active session.
end
