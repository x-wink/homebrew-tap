class PetHook < Formula
  desc "Claude Code / Codex 会话状态钩子，供 cchud 与桌宠读取"
  homepage "https://github.com/x-wink/cchud"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.2.0/pet-hook-macos-arm64"
      sha256 "05e0c9662af8c50bd9096a3983b0ee2a128aa8443e06ba1ef2b2cd337234e9f3"
    end
    on_intel do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.2.0/pet-hook-macos-x86_64"
      sha256 "462f9302fcab785c36035c419bbd78ad0e1727908c8e77399fb510b5b930444a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.2.0/pet-hook-linux-x86_64"
      sha256 "fe7946a9b00621bb455d8c3f5d08f577f6af78384785ec24fd23dbdefd20c2c3"
    end
  end

  livecheck do
    url :stable
    regex(/^pet-hook-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  def install
    bin.install Dir["pet-hook-*"].first => "pet-hook"
  end

  def caveats
    <<~EOS
      把九个事件的钩子写进 Claude Code 的 settings.json(写前备份 .bak):
        pet-hook setup
      Codex 接入:pet-hook setup --client codex;两端同时:pet-hook setup --client all
      Codex 新增钩子需在 /hooks 审查并信任。
      预览加 --dry-run;卸载加 --uninstall(与 --client 一起使用)。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pet-hook --version")
    (testpath/"settings.json").write("{}")
    system bin/"pet-hook", "setup", "--settings", testpath/"settings.json"
    assert_match "pet-hook", (testpath/"settings.json").read
    system bin/"pet-hook", "setup", "--client", "codex", "--settings", testpath/"hooks.json"
    assert_match "PermissionRequest", (testpath/"hooks.json").read
    assert_match "--client codex", (testpath/"hooks.json").read
  end
end
