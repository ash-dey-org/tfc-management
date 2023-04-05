# TFC exisitng Teams


# update the content of this file to suit tags and permissions needed for various groups for
# dev/tst/uat/prd workspaces that will be created for the app

execution = "remote"

tags = ["tfe","vendor","test"]

teams_ops = ["Terraform-cloud-SSO-OpsUsers"]

# permission for dev workspace
dev_workspace_access = [
  {
    name = "Terraform-cloud-SSO-MobileApp_MiddlewareLayer"
    access = "write"
  },
  {
    name = "Terraform-cloud-SSO-BaseUsers"
    access = "read"
  }
]

# permission for tst workspace
tst_workspace_access = [
  {
    name = "Terraform-cloud-SSO-MobileApp_MiddlewareLayer"
    access = "write"
  },
  {
    name = "Terraform-cloud-SSO-BaseUsers"
    access = "read"
  }
]

# permission for uat workspace
uat_workspace_access = [
  {
    name = "Terraform-cloud-SSO-MobileApp_MiddlewareLayer"
    access = "write"
  },
  {
    name = "Terraform-cloud-SSO-BaseUsers"
    access = "read"
  }
]

# permission for prd workspace
prd_workspace_access = [
  {
    name = "Terraform-cloud-SSO-MobileApp_MiddlewareLayer"
    access = "read"
  },
  {
    name = "Terraform-cloud-SSO-BaseUsers"
    access = "read"
  }
]

