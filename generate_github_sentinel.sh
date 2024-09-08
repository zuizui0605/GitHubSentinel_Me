#!/bin/bash

# 创建主目录
mkdir -p GitHubSentinel/sentry_agent

# 生成配置文件和依赖文件
cat <<EOL > GitHubSentinel/config.yaml
# 配置文件示例
github_token: "your_github_token"
notification_type: "email"  # 支持 'email' 或 'slack'
report_interval: "daily"    # 支持 'daily' 或 'weekly'
EOL

cat <<EOL > GitHubSentinel/requirements.txt
requests
schedule
EOL

cat <<EOL > GitHubSentinel/README.md
# GitHub Sentinel

GitHub Sentinel 是一款开源工具类 AI Agent，专为开发者和项目管理人员设计，能够定期（每日/每周）自动获取并汇总订阅的 GitHub 仓库最新动态。
EOL

# 生成 Python 文件
cat <<EOL > GitHubSentinel/main.py
from sentry_agent.subscription import SubscriptionManager
from sentry_agent.data_fetcher import DataFetcher
from sentry_agent.storage import Storage
from sentry_agent.notifier import Notifier
from sentry_agent.report_generator import ReportGenerator
from sentry_agent.scheduler import Scheduler

def main():
    subscription_manager = SubscriptionManager()
    data_fetcher = DataFetcher(token="your_github_token")
    storage = Storage()
    notifier = Notifier()
    report_generator = ReportGenerator()
    scheduler = Scheduler()

    def fetch_and_notify():
        for repo in subscription_manager.list_subscriptions():
            data = data_fetcher.fetch_latest_commits(repo)
            if data:
                storage.save_data(repo, data)
                report = report_generator.generate_report(data)
                notifier.send_notification(report)

    scheduler.add_job(fetch_and_notify, interval="daily")
    scheduler.run_pending()

if __name__ == "__main__":
    main()
EOL

# 创建模块文件
cat <<EOL > GitHubSentinel/sentry_agent/__init__.py
# 初始化文件
EOL

cat <<EOL > GitHubSentinel/sentry_agent/subscription.py
class SubscriptionManager:
    def __init__(self):
        self.subscriptions = []

    def add_repository(self, repo_url):
        if repo_url not in self.subscriptions:
            self.subscriptions.append(repo_url)
            print(f"Repository {repo_url} added to subscriptions.")
        else:
            print(f"Repository {repo_url} is already subscribed.")
    
    def remove_repository(self, repo_url):
        if repo_url in self.subscriptions:
            self.subscriptions.remove(repo_url)
            print(f"Repository {repo_url} removed from subscriptions.")
        else:
            print(f"Repository {repo_url} not found in subscriptions.")

    def list_subscriptions(self):
        return self.subscriptions
EOL

cat <<EOL > GitHubSentinel/sentry_agent/data_fetcher.py
import requests

class DataFetcher:
    def __init__(self, token):
        self.token = token
        self.base_url = "https://api.github.com/repos/"

    def fetch_latest_commits(self, repo_url):
        headers = {'Authorization': f'token {self.token}'}
        response = requests.get(f"{self.base_url}{repo_url}/commits", headers=headers)
        
        if response.status_code == 200:
            return response.json()
        else:
            print(f"Failed to fetch data for {repo_url}")
            return None
EOL

cat <<EOL > GitHubSentinel/sentry_agent/storage.py
import json
import os

class Storage:
    def __init__(self, storage_dir="data"):
        self.storage_dir = storage_dir
        if not os.path.exists(storage_dir):
            os.makedirs(storage_dir)
    
    def save_data(self, repo_url, data):
        repo_name = repo_url.replace("/", "_")
        with open(f"{self.storage_dir}/{repo_name}_data.json", 'w') as f:
            json.dump(data, f)
    
    def load_data(self, repo_url):
        repo_name = repo_url.replace("/", "_")
        file_path = f"{self.storage_dir}/{repo_name}_data.json"
        if os.path.exists(file_path):
            with open(file_path, 'r') as f:
                return json.load(f)
        return None
EOL

cat <<EOL > GitHubSentinel/sentry_agent/notifier.py
class Notifier:
    def __init__(self, notification_type="email"):
        self.notification_type = notification_type

    def send_notification(self, message):
        if self.notification_type == "email":
            self.send_email(message)
        elif self.notification_type == "slack":
            self.send_slack_message(message)

    def send_email(self, message):
        print(f"Sending email with message: {message}")
    
    def send_slack_message(self, message):
        print(f"Sending Slack message: {message}")
EOL

cat <<EOL > GitHubSentinel/sentry_agent/report_generator.py
class ReportGenerator:
    def generate_report(self, repo_data):
        report = "Repository Update Report:\n"
        for commit in repo_data:
            report += f"Commit: {commit['commit']['message']}\n"
        return report
EOL

cat <<EOL > GitHubSentinel/sentry_agent/scheduler.py
import schedule
import time

class Scheduler:
    def __init__(self):
        self.jobs = []

    def add_job(self, func, interval="daily"):
        if interval == "daily":
            job = schedule.every().day.do(func)
        elif interval == "weekly":
            job = schedule.every().week.do(func)
        
        self.jobs.append(job)

    def run_pending(self):
        while True:
            schedule.run_pending()
            time.sleep(1)
EOL

# 提示脚本执行完成
echo "GitHub Sentinel 项目结构和文件已生成完毕！"

