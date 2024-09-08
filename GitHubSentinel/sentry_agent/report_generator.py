class ReportGenerator:
    def generate_report(self, repo_data):
        report = "Repository Update Report:\n"
        for commit in repo_data:
            report += f"Commit: {commit['commit']['message']}\n"
        return report
