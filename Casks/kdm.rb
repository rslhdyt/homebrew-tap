cask "kdm" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "31ad39a2a6c5e10826f8826cf7681591af297c2073a934f1cdfaf894fe701c00",
         intel: "65f42f550ba6cf1acd1bccb5e5e4bfe821628cc1bca1291c31e1616bfb8354f4"

  url "https://github.com/rslhdyt/kamal-desktop-manager/releases/download/v#{version}/Kamal.Desktop.Manager_#{version}_#{arch}.dmg"
  name "Kamal Desktop Manager"
  desc "Desktop manager for Kamal deployments"
  homepage "https://github.com/rslhdyt/kamal-desktop-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Kamal Desktop Manager.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kamal Desktop Manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.kdm.desktop",
    "~/Library/Caches/dev.kdm.desktop",
    "~/Library/Preferences/dev.kdm.desktop.plist",
    "~/Library/WebKit/dev.kdm.desktop",
  ]
end
