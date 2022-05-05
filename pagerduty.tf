resource "pagerduty_service" "test_service" {
  name                    = "terratest-${random_string.test_instance.result}"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.test_escalation_policy.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_escalation_policy" "test_escalation_policy" {
  name      = "Engineering Escalation Policy"
  num_loops = 2

  rule {
    escalation_delay_in_minutes = 10

    target {
      type = "user_reference"
      id   = pagerduty_user.test_user.id
    }
  }
}

resource "pagerduty_user" "test_user" {
  name  = "Terratest User ${random_string.test_instance.result}"
  email = "terratest-${random_string.test_instance.result}@honestbank.com"
}

data "pagerduty_vendor" "cloudwatch" {
  name = "Cloudwatch"
}

resource "pagerduty_service_integration" "cloudwatch" {
  name    = data.pagerduty_vendor.cloudwatch.name
  service = pagerduty_service.test_service.id
  vendor  = data.pagerduty_vendor.cloudwatch.id
}
