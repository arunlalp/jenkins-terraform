from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories

class SecurityGroupTagsCheck(BaseResourceCheck):
    def __init__(self) -> None:
        name = "Ensure AWS security groups have tags"
        id = "CUSTOM_AWS_005"
        supported_resources = ("aws_security_group",)
        categories = (CheckCategories.NETWORKING,)
        guideline = "Security groups should have tags."
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources, guideline=guideline)

    def scan_resource_conf(self, conf) -> CheckResult:
      
        tags = conf.get("tags")
        if not tags:
            return CheckResult.FAILED
        return CheckResult.PASSED

check = SecurityGroupTagsCheck()
