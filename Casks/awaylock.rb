cask "awaylock" do
  version "0.1.0"
  sha256 "aff15d6a04de30495d4267a3296cc33a2e8664e0acedf5d4e72e9a531ba76bd9"

  url "https://github.com/hoyangtsai/AwayLock/releases/download/v#{version}/AwayLock-#{version}-arm64.zip"
  name "AwayLock"
  desc "Menu bar app that locks your Mac when your phone or watch walks away"
  homepage "https://github.com/hoyangtsai/AwayLock"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "AwayLock.app"

  # App 未經 Apple 公證，移除隔離標記才能直接開啟
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AwayLock.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.awaylock.app",
    "~/Library/Preferences/com.awaylock.app.plist",
  ]
end
