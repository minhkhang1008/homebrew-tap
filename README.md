# minhkhang1008/homebrew-tap

Homebrew tap for [Zalo-next](https://github.com/minhkhang1008/zalo-next) (formerly ctdozlite-next), a lightweight,
open-source Zalo desktop client written in Rust.

```bash
brew install --cask minhkhang1008/tap/zalo-next
```

> The project was renamed from ctdozlite-next to **Zalo-next**. Existing installs of `ctdozlite-next`
> are moved to `zalo-next` by `brew upgrade` (see `cask_renames.json`). Your login and history are kept:
> the data directory is still `~/Library/Application Support/ctdozlite`.

## What the cask does

- Downloads the official DMG from the project's
  [GitHub Releases](https://github.com/minhkhang1008/zalo-next/releases). Homebrew checks it
  against the SHA-256 pinned in [`Casks/zalo-next.rb`](Casks/zalo-next.rb).
- Installs `Zalo-next.app` into `/Applications`.
- Removes the "downloaded from the Internet" flag from that app only (`xattr -cr`). The app is
  ad-hoc signed by the project's public CI but not notarized by Apple (that needs a paid developer
  account), so without this step macOS would block the first launch.

Nothing else runs: no background services, no system settings are changed, Gatekeeper stays on.

You can check that a downloaded file was built by the project's public workflow:

```bash
gh attestation verify zalo-next-<version>-macos-arm64.dmg --repo minhkhang1008/ctdozlite-next
```

Uninstall: `brew uninstall --cask zalo-next` (add `--zap` to also delete local data).
