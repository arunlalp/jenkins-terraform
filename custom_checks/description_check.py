from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories

class SecurityGroupDescriptionCheck(BaseResourceCheck):
    def __init__(self) -> None:
        name = "Ensure AWS security groups have descriptions"
        id = "CUSTOM_AWS_001"
        supported_resources = ("aws_security_group",)
        categories = (CheckCategories.NETWORKING,)
        guideline = "Security groups should have meaningful descriptions for better understanding."
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources, guideline=guideline)

    def scan_resource_conf(self, conf) -> CheckResult:
        """
        Checks if the aws_security_group resource has a description.
        :param conf: aws_security_group configuration
        :return: <CheckResult>
        """
        description = conf.get("description")
        if not description:
            return CheckResult.FAILED
        return CheckResult.PASSED

check = SecurityGroupDescriptionCheck()
