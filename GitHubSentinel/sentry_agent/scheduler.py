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
