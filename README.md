# x-wink/homebrew-tap

x-wink 的 Homebrew 软件源。

| 名字 | 是什么 | 装法 |
| --- | --- | --- |
| `pet-hook` | Claude Code / Codex 的钩子写方:每个事件把「此刻在干嘛」写进 `~/.cchud/state/`,[cchud](https://github.com/x-wink/cchud) 状态栏与 oxforge-pet 都读它。开源(MIT) | `brew install x-wink/tap/pet-hook` |
| `oxforge-pet` | 常驻桌面的像素小兽,随 Claude Code / Codex 会话换姿势与颜色。免费、闭源,[下载页](https://oxforge.xwink.fun/pet/) | `brew install --cask x-wink/tap/oxforge-pet` |

两样一起装:

```sh
brew install x-wink/tap/pet-hook
pet-hook setup
brew install --cask x-wink/tap/oxforge-pet
```

Codex 接入运行 `pet-hook setup --client codex`,再在 `/hooks` 审查并信任;两端同时配置用 `--client all`。

## 维护

- pet-hook:cchud 推 `pet-hook-v*` tag 出 Release 后,改 `Formula/pet-hook.rb` 的 `version`、三个 `url` 与 `sha256`(取 Release 里的 `SHA256SUMS`)。
- oxforge-pet:oxforge 的 `deploy/publish.sh pet` 传完后,改 `Casks/oxforge-pet.rb` 的 `version` 与 `sha256`(取 `https://oxforge.xwink.fun/pet/latest.json`)。
- 配方改完先过 Ruby 语法检查、核对 Release 的 SHA256；公开 Release 后用 `brew fetch` 验证下载。跨平台分别指定 `--os=macos --arch=arm`、`--os=macos --arch=intel`、`--os=linux --arch=intel`，避免 `--all-platforms` 尝试没有产物的 Linux ARM。
- 本机不跑 `brew audit` / `brew style` / `brew test`：这些开发命令会安装依赖，曾留下冲突的 Ruby 包并损坏 Homebrew；真实二进制的安装与事件执行由 cchud 的回归及发行冒烟验证。
