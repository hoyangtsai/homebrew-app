cask "awaylock" do
  version "0.1.9"
  sha256 "0c7728796eadf7877e9390f82c586bae94d80708535f2087ffd6eb7b6f355b8d"

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
