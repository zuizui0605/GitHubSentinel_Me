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
