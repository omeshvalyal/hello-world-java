#!/bin/bash
repo_url="git@github.com:omeshvalyal/hello-world-java.git"
local_clone_path="/var/lib/jenkins/my_newdir3"
source_branch_name="master"
# Define the folder path and folder name
path="/var/lib/jenkins"
folder_name="my_newdir3"

#Check if the folder exists
if [ ! -d "$path/$folder_name" ]; then
    echo "Folder does not exist. Creating..."
    mkdir -p "$path/$folder_name"
    echo "Folder created successfully."
else
    echo "Folder already exists."
fi

git clone --branch "$source_branch_name" --single-branch https://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@github.com:omeshvalyal/hello-world-java.git" "/var/lib/jenkins/my_newdir3"
