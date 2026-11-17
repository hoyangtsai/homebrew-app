cask "awaylock" do
  version "0.1.5"
  sha256 "2f0bd935eafd8e94b10416efaf208b124a8ba5eb2397a494ff27ec3ab87f6b1c"

  url "https://github.com/hoyangtsai/awaylock/releases/download/v#{version}/awaylock-#{version}-arm64.zip"
  name "awaylock"
  desc "Menu bar app that locks your Mac when your phone or watch walks away"
  homepage "https://github.com/hoyangtsai/awaylock"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "awaylock.app"

  # App 未經 Apple 公證，移除隔離標記才能直接開啟
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/awaylock.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.awaylock.app",
    "~/Library/Preferences/com.awaylock.app.plist",
  ]
end
