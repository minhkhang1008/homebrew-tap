# Homebrew Cask for ctdozlite-next (for a personal tap, not homebrew/cask).
#
# Publish: create the GitHub repo `minhkhang1008/homebrew-tap`, copy this file to
# `Casks/ctdozlite-next.rb` there, then users run:
#
#   brew install --cask minhkhang1008/tap/ctdozlite-next
#
# On each release update `version` and both `sha256` values from the release's SHA256SUMS.txt.
# The app is ad-hoc signed (not notarized), so postflight clears the quarantine flag that
# Homebrew adds; otherwise Gatekeeper would block the first launch.
cask "ctdozlite-next" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.2"
  sha256 arm:   "e06beed4948933c33438ed97aa21dc1d876d068f7f945bf7c7a6d246abc3a742",
         intel: "81d39c4fd8f59bf4b79f45d8c270052da594f9611372b43195e44e5e347576fa"

  url "https://github.com/minhkhang1008/ctdozlite-next/releases/download/v#{version}/ctdozlite-#{version}-macos-#{arch}.dmg"
  name "ctdozlite-next"
  desc "Lightweight native Zalo desktop client written in Rust"
  homepage "https://github.com/minhkhang1008/ctdozlite-next"

  depends_on macos: :big_sur

  # The app updates itself from GitHub Releases.
  auto_updates true

  app "ctdozlite.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/ctdozlite.app"]
  end

  zap trash: "~/Library/Application Support/ctdozlite"
end
