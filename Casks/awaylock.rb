cask "awaylock" do
  version "0.2.0"
  sha256 "e1bc71198eb1bde5e021586becaaf47243a63f5d47dae3980201ac5e482eeb4e"

  url "https://github.com/hoyangtsai/awaylock/releases/download/v#{version}/awaylock-#{version}-arm64.zip"
  name "awaylock"
  desc "Menu bar app that locks your Mac when your phone or watch walks away"
  homepage "https://github.com/hoyangtsai/awaylock"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "awaylock.app"

  # The app is not notarized by Apple; remove the quarantine flag so it opens directly
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/awaylock.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/app.awaylock.AwayLock",
    "~/Library/Application Support/app.awaylock.awaylock",
    "~/Library/Preferences/com.awaylock.app.plist",
  ]
end
