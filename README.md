# homebrew-tap

Personal Homebrew tap for casks/formulae that have no upstream package.

```sh
brew trust ericreeves/tap
brew install --cask ericreeves/tap/mantle
```

## Casks

- **mantle** — [Mantle](https://github.com/ghsteff/mantle), Mac keyboard remapper powered by Kanata. Repackages upstream's signed + notarized release DMGs; nothing is built here. A weekly GitHub Action ([bump-mantle.yml](.github/workflows/bump-mantle.yml)) checks for new upstream releases and bumps version/sha256 automatically.

(The AeroSpace nightly lives in its own tap: [ericreeves/homebrew-aerospace-edge](https://github.com/ericreeves/homebrew-aerospace-edge).)
