# minhkhang1008/homebrew-tap

Homebrew tap for [Zalo-next](https://github.com/minhkhang1008/zalo-next) (formerly ctdozlite-next), a lightweight,
open-source Zalo desktop client written in Rust.

```bash
brew install --cask minhkhang1008/tap/ctdozlite-next   # current releases
brew install --cask minhkhang1008/tap/zalo-next        # from the first Zalo-next release
```

> The project was renamed to **Zalo-next**. The `zalo-next` cask is a placeholder until the first release
> published under the new name; the release workflow then fills in its version and checksums, and
> `ctdozlite-next` becomes a deprecated alias.

## What the cask does

- Downloads the official DMG from the project's
  [GitHub Releases](https://github.com/minhkhang1008/zalo-next/releases). Homebrew checks it
  against the SHA-256 pinned in [`Casks/ctdozlite-next.rb`](Casks/ctdozlite-next.rb).
- Installs `ctdozlite.app` into `/Applications`.
- Removes the "downloaded from the Internet" flag from that app only (`xattr -cr`). The app is
  ad-hoc signed by the project's public CI but not notarized by Apple (that needs a paid developer
  account), so without this step macOS would block the first launch.

Nothing else runs: no background services, no system settings are changed, Gatekeeper stays on.

You can check that a downloaded file was built by the project's public workflow:

```bash
gh attestation verify ctdozlite-<version>-macos-arm64.dmg --repo minhkhang1008/ctdozlite-next
```

Uninstall: `brew uninstall --cask ctdozlite-next` (add `--zap` to also delete local data).
