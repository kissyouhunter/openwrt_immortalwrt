#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 下载插件
svn co https://github.com/kissyouhunter/openwrt-packages/trunk/luci-app-poweroff ./package/luci-app-poweroff

# 替换index.htm文件 X86
#wget -O ./package/emortal/autocore/files/generic/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_immortalwrt/index_x86_immortalwrt.htm

# 替换banner
wget -O ./package/emortal/default-settings/files/openwrt_banner https://raw.githubusercontent.com/kissyouhunter/openwrt_immortalwrt/main/diy/x86_immortalwrt/openwrt_banner_21.02

# kernel 5.4.175

sed -i 's/LINUX_KERNEL_HASH-5.4.179 = 2c9bdec0922a95aff34e8d53d2e0ecf7e842033cd908d2959a43d34afb5d897d/LINUX_KERNEL_HASH-5.4.180 = 1639b5d8a60038f3b81f549f194642778035b758c06c74ef5f69e48bd9ab931d/g' ./include/kernel-version.mk

#sed -i 's/LINUX_VERSION-5.4 = .179/LINUX_VERSION-5.4 = .180/g' ./include/kernel-version.mk

