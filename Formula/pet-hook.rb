class PetHook < Formula
  desc "Claude Code hook writer for the cchud status line and the oxforge-pet desktop pet"
  homepage "https://github.com/x-wink/cchud"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.1.0/pet-hook-macos-arm64"
      sha256 "b51b000b701ca33f8e9714f98784f317e08078e3ed15fa9d77aceebac402d21e"
    end
    on_intel do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.1.0/pet-hook-macos-x86_64"
      sha256 "a9cdbc0a211d61cc51d488c3ae887bc6d97df6109aab296882044d212bcbd2ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/x-wink/cchud/releases/download/pet-hook-v0.1.0/pet-hook-linux-x86_64"
      sha256 "28be0edd5e1a23341ecd41005fdc154eb9b7ccbdca81017facd7efd53342b4aa"
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
      只看会改什么:pet-hook setup --dry-run;卸载钩子:pet-hook setup --uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pet-hook --version")
    (testpath/"settings.json").write("{}")
    system bin/"pet-hook", "setup", "--settings", testpath/"settings.json"
    assert_match "pet-hook", (testpath/"settings.json").read
  end
end
