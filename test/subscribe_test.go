package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"

	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestCanSubscribe(t *testing.T) {
	testDir := test_structure.CopyTerraformFolderToTemp(t, "..", ".")

	testInputs, errorGettingTestInputs := getTestInputs()
	if errorGettingTestInputs != nil {
		t.Errorf("%s", errorGettingTestInputs.Error())
	}
	environmentVariables := map[string]string{}
	initOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: testDir,
		Vars:         testInputs,
		EnvVars:      environmentVariables,
		Reconfigure:  true,
		Upgrade:      true,
	})

	terraform.Init(t, initOptions)

	defer finalizeTest(t, initOptions)
	terraform.ApplyAndIdempotent(t, initOptions)

	alarmsArns := terraform.OutputMap(t, initOptions, "alarm_arns")
	snsSubscritionsArns := terraform.OutputList(t, initOptions, "sns_subscription_arns")

	assert.Len(t, alarmsArns, 1)
	assert.Len(t, snsSubscritionsArns, 1)
}
