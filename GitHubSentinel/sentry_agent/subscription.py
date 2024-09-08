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
