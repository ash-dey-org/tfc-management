variable_set = "tfc-management-token"

# add the name of the new project in the list at bottom of the list, separated by commas
# name  - should be the same as the git repo name e.g. store-infra as per below
# tags - as appropriate for the project

projects = [
    {name = "app1",
    tags = ["tfe", "itops", "sample"]
    },
    {name = "app2",
    tags = ["tfe", "store", "sa"]
    },

    {name = "app3",
    tags = ["tfe", "mobileapp", "vendor", "zemind"]
    }
]