cask "mantle" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.5"
  sha256 arm:   "bf5b78a10dd7c988d8ae38436317936e50311d5642f55c96c199ed9162563759",
         intel: "d24f91b80622a041099f967b7f2b8de3bc3ae1d03d5e7cf2dc21c5d6e9eda939"

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
