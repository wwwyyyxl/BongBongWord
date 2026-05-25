# Errors

---


## 2026-05-24 - 路径误读：真实工程在内层 BongBongWord

- Category: command_error
- Context: 实施 Tabs 首页静态落地时，第一次 apply_patch 使用了外层 `C:\Users\me\BongBongWord` 相对路径，真实 HarmonyOS 工程在 `C:\Users\me\BongBongWord\BongBongWord`。
- Impact: 补丁未应用，未改动源码；随后改用真实工程内路径继续。
- Fix: 后续 BongBongWord 代码修改必须以 `C:\Users\me\BongBongWord\BongBongWord` 为工作目录或使用绝对工程内路径。

## 2026-05-24 - 示例文件夹名误读：views 不是 view

- Category: command_error
- Context: 查询华为教育框架示例时读取了 `...\ets\view\HomeView.ets`，实际目录是 `views`。
- Impact: 只影响示例读取命令，不影响工程代码。
- Fix: 按 `Index.ets` 导出的真实路径追踪文件，避免猜目录名。

## 2026-05-25 - Figma MCP 可用性误判

- Category: integration_error
- Context: 当前 Codex 会话没有暴露 `mcp__figma-mcp-go__*` 工具时，误判为本机 Figma MCP 不可用；用户截图显示 Figma 插件已 Connected。进一步检查发现 Claude Code 已配置并连接 `figma-mcp-go`，Codex 仅缺少对应 MCP 配置。
- Impact: 首页 Figma 精确切片和布局优化被提前标记为阻塞。
- Fix: 判断 Figma MCP 时要同时检查 Figma 插件状态、`claude mcp list`、`codex mcp list` 和 MCP 包名；开源包名是 `@vkhanhqui/figma-mcp-go`，Codex 可用 `codex mcp add figma-mcp-go -- cmd /c npx -y @vkhanhqui/figma-mcp-go@latest` 配置。新增 MCP 后当前会话可能不能热加载，需要重开/刷新 Codex 会话。
