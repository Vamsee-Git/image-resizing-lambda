resource "aws_sns_topic" "image_notifications" {
  name = "image_notifications"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.image_notifications.arn
  protocol = "email"
  endpoint = var.email
}

output "sns_topic_arn" {
  value = aws_sns_topic.image_notifications.arn
}
