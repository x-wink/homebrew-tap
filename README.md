# x-wink/homebrew-tap

x-wink 的 Homebrew 软件源。

| 名字 | 是什么 | 装法 |
| --- | --- | --- |
| `pet-hook` | Claude Code 的钩子写方:每个事件把「此刻在干嘛」写进 `~/.cchud/state/`,[cchud](https://github.com/x-wink/cchud) 状态栏与 oxforge-pet 都读它。开源(MIT) | `brew install x-wink/tap/pet-hook` |
| `oxforge-pet` | 常驻桌面的像素小兽,随 Claude Code 会话换姿势与颜色。免费、闭源,[下载页](https://oxforge.xwink.fun/pet/) | `brew install --cask x-wink/tap/oxforge-pet` |

两样一起装:

```sh
brew install x-wink/tap/pet-hook
pet-hook setup
brew install --cask x-wink/tap/oxforge-pet
```

## 维护

- pet-hook:cchud 推 `pet-hook-v*` tag 出 Release 后,改 `Formula/pet-hook.rb` 的 `version`、三个 `url` 与 `sha256`(取 Release 里的 `SHA256SUMS`)。
- oxforge-pet:oxforge 的 `deploy/publish.sh pet` 传完后,改 `Casks/oxforge-pet.rb` 的 `version` 与 `sha256`(取 `https://oxforge.xwink.fun/pet/latest.json`)。
- 改完 `brew audit --tap x-wink/tap`、`brew fetch` 两样都过再推。
