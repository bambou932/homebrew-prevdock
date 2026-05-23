cask "prevdock" do
  version "0.1.0"
  sha256 "7e145480ee6a32c8fea0d56467848ee98d1c256cef68ff0eada6410bb82032fa"

  url "https://github.com/bambou932/prevDock/releases/download/v#{version}/prevDock-#{version}-arm64.zip",
      verified: "github.com/bambou932/prevDock/"
  name "prevDock"
  desc "Dock hover window previews for macOS"
  homepage "https://github.com/bambou932/prevDock"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "prevDock.app"

  uninstall quit: "io.github.bambou932.prevDock"

  zap trash: [
    "~/Library/Preferences/io.github.bambou932.prevDock.plist",
  ]

  caveats <<~EOS
    prevDock preview builds are not Apple-notarized yet.

    If macOS blocks the first launch:
      1. Open /Applications in Finder.
      2. Control-click prevDock.app and choose Open.
      3. Choose Open again.

    You can also allow it from System Settings > Privacy & Security > Open Anyway.
  EOS
end
