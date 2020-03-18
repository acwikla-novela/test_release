
#Download current release of project from github
curl -s https://api.github.com/repos/acwikla-novela/release_test/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'


##Navigate to location of the project
#
#
## Building conda package (it may take few minutes)
#conda build <project_name> --output-folder <destination_folder>
#
##Convert the package to work on other platforms
#conda convert <package> -o <destination_folder> --platform all
#
## Login into anaconda cloud
#
## Upload all packages (one for each platform)