# Creates top levels workspaces in Terraform Cloud


Terraform Cloud project and workspace structure followed as per below:

### Confluence documentation:
https://confluence.standards.org.au/pages/viewpage.action?spaceKey=IT&title=Terraform+Cloud+Architecture

Steps:
1. In ./terraform.tfvars file add the name of the project and any desirable tag for that project and save the file. <span style="color:red"> DO NOT DELETE any of the exisitng projects from this file. </span>
2. Export the following environment variable
    export TF_CLOUD_ORGANIZATION="xxx"
    export TF_WORKSPACE="xxx"
    export TF_VAR_organization="xxx"
3. Run Terraform plan, observe the plan output, if looks ok rprocced to apply plan.
4. Run Terraform appply