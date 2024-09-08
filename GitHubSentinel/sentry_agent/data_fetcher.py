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
