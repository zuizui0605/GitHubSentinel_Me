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
