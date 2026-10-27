#!/bin/bash
set -e
curl -fsSL https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo -o /etc/yum.repos.d/terra.repo
dnf install -y terra-release
