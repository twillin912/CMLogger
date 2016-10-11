Deploy Module {

    By PlatyPS {
        FromSource "$env:BHProjectPath\docs\functions"
        To "$env:BHProjectPath\$env:BHProjectName\en-US"
        Tagged Help
        WithOptions @{
            Force = $true
        }
    }

    By FileSystem {
        FromSource $env:BHProjectName
        To "$home\Documents\WindowsPowerShell\Modules\$env:BHProjectName"
        Tagged Prod, Module, Local
        WithOptions @{
            Mirror = $true
        }
        WithPostScript {
            Import-Module -Name $env:BHProjectName -Force
        }
    }

    By PSGalleryModule {
        FromSource $env:BHProjectName
        To PSGallery
        Tagged PSGallery
        WithOptions @{
            ApiKey = $env:NugetApiKey
        }
    }
}