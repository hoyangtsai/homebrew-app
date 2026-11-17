cask "awaylock" do
  version "0.1.5"
  sha256 "2f0bd935eafd8e94b10416efaf208b124a8ba5eb2397a494ff27ec3ab87f6b1c"

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
