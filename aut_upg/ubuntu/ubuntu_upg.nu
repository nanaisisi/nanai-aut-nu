#!/usr/bin/env -S nu --stdin
#UbuntuのOSアップグレード処理とdebian共通処理

# 一応Debian系なので
source ../common/debians_upg.nu

# Ubuntu特有なOSアップグレード処理
sudo do-release-upgrade
