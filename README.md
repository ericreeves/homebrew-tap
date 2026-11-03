# homebrew-tap

Personal Homebrew tap for casks/formulae that have no upstream package.

```sh
brew trust ericreeves/tap
brew install --cask ericreeves/tap/mantle
```

## Casks

- **mantle** — [Mantle](https://github.com/ghsteff/mantle), Mac keyboard remapper powered by Kanata. Repackages upstream's signed + notarized release DMGs; nothing is built here. A weekly GitHub Action ([bump-mantle.yml](.github/workflows/bump-mantle.yml)) checks for new upstream releases and bumps version/sha256 automatically.
- **downlink** — [Downlink](https://github.com/zayatura/downlink), menu-bar layout view and per-layer input-source switching for the ZSA Voyager. Upstream has no releases, so this tap **builds it**: a weekly GitHub Action ([build-downlink.yml](.github/workflows/build-downlink.yml)) compiles upstream `main` on a macOS arm64 runner when it moves, publishes the ad-hoc signed app as a release here, and bumps the cask (`version "<cargo version>,<short commit>"`). Force a rebuild with `gh workflow run build-downlink.yml -R ericreeves/homebrew-tap -f force=true`.

(The AeroSpace nightly lives in its own tap: [ericreeves/homebrew-aerospace-edge](https://github.com/ericreeves/homebrew-aerospace-edge).)
