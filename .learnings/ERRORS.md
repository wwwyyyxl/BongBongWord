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
