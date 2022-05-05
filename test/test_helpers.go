package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func getAwsRegion() string {
	return os.Getenv("AWS_REGION")
}

// finalizeTest is to be invoked when ending the test.
// Useful to stop here the debugger to inspect manually the created resources.
func finalizeTest(t *testing.T, tfOptions *terraform.Options) {
	terraform.Destroy(t, tfOptions)
}

func getPagerDutyToken() (string, error) {
	pagerDutyToken := os.Getenv("PAGERDUTY_TOKEN")
	if pagerDutyToken == "" {
		return "", fmt.Errorf("PAGERDUTY_TOKEN is empty")
	}
	return pagerDutyToken, nil
}

func getTestInputs() (map[string](interface{}), error) {
	awsRegion := getAwsRegion()

	pagerDutyToken, errGettingPagerDutyToken := getPagerDutyToken()
	if errGettingPagerDutyToken != nil {
		return nil, errGettingPagerDutyToken
	}
	testInputs := map[string](interface{}){
		"aws_region":      awsRegion,
		"pagerduty_token": pagerDutyToken,
	}
	return testInputs, nil
}
