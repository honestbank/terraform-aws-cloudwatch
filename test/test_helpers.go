package test

import (
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
