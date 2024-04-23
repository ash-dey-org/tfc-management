tfc-management = "tfc-management"
variable_set = "tfc-management-token"

# add the name of the new project in the list at BOTTOM of the list, separated by commas
#
# THE NEW PROJECT MSUT BE ADDED AT THE END
#
# name  - should be the same as the git repo name e.g. store-infra as per below
# tags - as appropriate for the project

projects = [
    {name = "tf-azure-sandbox",
    tags = ["tfe", "test", "sandbox"]
    },

    {name = "tf-azure-networking",
    tags = ["tfe", "network", "core-infrastructure"]
    },
    {name = "tf-azure-shared-core",
    tags = ["tfe", "network", "core-infrastructure"]
    },
    {name = "tf-defender-report",
    tags = ["tfe", "defender", "report", "azure"]
    }
]