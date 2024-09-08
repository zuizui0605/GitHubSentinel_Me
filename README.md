# GitHub Sentinel v0.0.1 - Initial Release
## 🎉 新功能
- 订阅管理：允许用户管理所订阅的 GitHub 仓库。
- 数据获取：自动从订阅的仓库中获取最新的提交信息。
- 通知系统：支持通过电子邮件和 Slack 通知最新的仓库更新。
- 报告生成：自动生成详细的项目进度报告。
- 调度管理：支持每日或每周定时任务，自动获取更新信息并发送通知。
## 🛠️ 安装与配置
1.克隆仓库并使用 pip 安装依赖：

```
git clone https://github.com/yourusername/GitHubSentinel.git
cd GitHubSentinel
pip install -r requirements.txt
```
2.在 config.yaml 中配置你的 GitHub Token 以及通知方式：

```
github_token: "your_github_token"  # 将 your_github_token 替换为你的 GitHub 访问令牌
notification_type: "email"  # 可以选择 'email' 或 'slack'
report_interval: "daily"    # 可以选择 'daily' 或 'weekly'
```
3.运行主程序：

```
python main.py
```

## 📘 文档
请参阅项目中的 README.md 文件，了解详细的安装、配置和使用说明。

4.在 GitHub 上创建 Release
- 前往你的 GitHub 仓库。
- 点击 Releases -> Draft a new release。
- 在 Tag version 中选择 v0.0.1。
- 填写 Release 标题为 GitHub Sentinel v0.0.1 - Initial Release。
- 将上面的 Release Note 复制到 Describe this release 区域。

5.点击 Publish release。
通过这些步骤，你将成功为 GitHub Sentinel 项目创建 v0.0.1 版本，并生成相应的 Release Note。
