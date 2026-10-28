cask "oxforge-pet" do
  version "0.1.0"
  # Apple Silicon 的包还没出,同一份 Intel 包经 Rosetta 跑
  sha256 "b9a1b74769d67a7f070cf493ddb5136ed75510cda35529f86cba40e247ae91e3"

  url "https://oxforge.xwink.fun/pet/oxforge-pet-macos-x64.dmg"
  name "oxforge-pet"
  desc "Desktop pet that changes pose with your Claude Code sessions"
  homepage "https://oxforge.xwink.fun/pet/"

  livecheck do
    url "https://oxforge.xwink.fun/pet/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  app "oxforge-pet.app"

  # ~/.cchud 与 cchud 状态栏共用,只收小兽自己的两个文件
  zap trash: [
    "~/.cchud/pet-window.json",
    "~/.cchud/pet.lock",
  ]

  caveats <<~EOS
    小兽只读状态,写方是 pet-hook,先装它并注册钩子:
      brew install x-wink/tap/pet-hook && pet-hook setup

    oxforge-pet 未经 Apple 公证。第一次打开被拦时,在「应用程序」里右键它选「打开」,
    或者:
      xattr -dr com.apple.quarantine "#{appdir}/oxforge-pet.app"
  EOS
end
