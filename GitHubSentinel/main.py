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
