#!/bin/bash -ex
# https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners
# https://github.com/actions/runner/blob/main/docs/start/envlinux.md#install-net-core-3x-linux-dependencies
apt-get update -y
apt-get install -y curl mysql-server liblttng-ust0 libkrb5-3 zlib1g libssl1.1 libicu60
mysqldump --version

# install actions runner and connect to github
export RUNNER_ALLOW_RUNASROOT="1"
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux.tar.gz -L ${actions_runner_linux_download_url}
tar xzf ./actions-runner-linux.tar.gz

./config.sh --url ${github_repo_url} --token ${github_runner_token} --unattended

nohup ./run.sh &