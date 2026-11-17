# Homebrew Cask for Zalo-next (for a personal tap, not homebrew/cask).
#
# Publish: create the GitHub repo `minhkhang1008/homebrew-tap`, copy this file to
# `Casks/zalo-next.rb` there, then users run:
#
#   brew install --cask minhkhang1008/tap/zalo-next
#
# Renamed from `ctdozlite-next` (see `cask_renames.json` at the tap root, so `brew upgrade` moves old
# installs here). `version` and both `sha256` values are updated by the project's release workflow
# (.github/workflows/ci-release.yml, "Update Homebrew tap") from the release's SHA256SUMS.txt.
# The app is ad-hoc signed (not notarized), so postflight clears the quarantine flag that
# Homebrew adds; otherwise Gatekeeper would block the first launch.
cask "zalo-next" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "ba3614250b406f67b4c020e7efc2772c197c83a5e2a25d7d424553e0bc393d60",
         intel: "463ca4a899c08d7ca6d6afe7e01d066c944ab3d13ff78dc947417f8126f6ab08"

  url "https://github.com/minhkhang1008/zalo-next/releases/download/v#{version}/zalo-next-#{version}-macos-#{arch}.dmg"
  name "Zalo-next"
  desc "Lightweight native Zalo desktop client written in Rust"
  homepage "https://github.com/minhkhang1008/zalo-next"

  depends_on macos: :big_sur

  # The app updates itself from GitHub Releases.
  auto_updates true

  app "Zalo-next.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Zalo-next.app"]
  end

  zap trash: "~/Library/Application Support/ctdozlite"
end
