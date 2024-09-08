
# GitHub Sentinel

GitHub Sentinel 是一款开源的 AI 驱动工具，专为开发者和项目管理人员设计，能够自动监控并汇总订阅的 GitHub 仓库更新。通过定期获取仓库动态并生成报告，GitHub Sentinel 大大提高了团队的协作效率，帮助用户时刻掌握项目变动并及时响应。

### 功能特色
- 自动获取仓库更新：支持每日或每周定时从 GitHub 仓库获取最新的提交信息。
- 订阅管理：轻松管理你订阅的 GitHub 仓库。
- 通知系统：支持通过电子邮件或 Slack 推送最新的仓库更新报告。
- 报告生成：自动生成详尽的更新报告，帮助团队掌握最新项目进展。
- 可扩展：支持未来更多的通知方式和报告格式。
### 环境安装
在安装此项目之前，请确保您的系统已安装以下组件：

- Python 3.7+
- pip 包管理器
- Git

### 步骤 1: 克隆仓库
```
bash
git clone https://github.com/yourusername/GitHubSentinel.git
cd GitHubSentinel
```

### 步骤 2: 安装依赖
使用 pip 来安装项目所需依赖：
```
bash
pip install -r requirements.txt
```
### 步骤 3: 配置 GitHub Token
为了从 GitHub API 获取仓库更新数据，你需要一个 GitHub 访问令牌。你可以按照以下步骤生成 GitHub 访问令牌：

1. 登录 GitHub
2. 前往 Developer settings
3. 生成一个新的 Personal Access Token，确保勾选 repo 权限。

将你的 GitHub Token 配置在 config.yaml 文件中：

### config.yaml
```
github_token: "your_github_token"  # 将 your_github_token 替换为你的个人访问令牌
notification_type: "email"  # 可以选择 'email' 或 'slack'
report_interval: "daily"    # 可以选择 'daily' 或 'weekly'
```

### 使用方法
#### 1. 添加订阅
你可以通过修改或扩展 SubscriptionManager 来添加和管理你订阅的 GitHub 仓库。

#### 2. 启动项目
在配置完成后，可以使用以下命令启动 GitHub Sentinel：

```
python main.py
```

系统将会根据配置文件中的间隔设置（每日或每周）自动从订阅的 GitHub 仓库获取最新的提交信息，并通过指定的通知方式（电子邮件或 Slack）推送更新报告。

### 3. 定制化通知和报告
GitHub Sentinel 默认支持电子邮件和 Slack 通知。你可以通过修改 notifier.py 文件来自定义通知方式，并根据项目需求调整报告格式。

#### 项目结构
```
github_sentinel/
│
├── sentry_agent/
│   ├── __init__.py         # 初始化模块
│   ├── subscription.py     # 订阅管理
│   ├── data_fetcher.py     # 数据获取
│   ├── storage.py          # 数据存储
│   ├── notifier.py         # 通知系统
│   ├── report_generator.py # 报告生成
│   ├── scheduler.py        # 调度管理
│   └── utils.py            # 工具函数
│
├── config.yaml             # 配置文件
├── main.py                 # 主程序入口
├── requirements.txt        # 项目依赖
└── README.md               # 项目介绍
```

### 贡献指南
我们欢迎来自开发者社区的贡献！如果你有任何想法、功能建议或 Bug 反馈，欢迎提交 Issue 或 Pull Request。

1. Fork 本项目
2. 创建功能分支 (git checkout -b feature/AmazingFeature)
3. 提交你的更改 (git commit -m 'Add some AmazingFeature')
4. 推送到分支 (git push origin feature/AmazingFeature)
5. 打开一个 Pull Request