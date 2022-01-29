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
wget -O ./package/emortal/autocore/files/generic/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_immortalwrt/main/diy/x86_immortalwrt/index_x86_immortalwrt.htm

# 替换banner
wget -O ./package/emortal/default-settings/files/openwrt_banner https://raw.githubusercontent.com/kissyouhunter/openwrt_immortalwrt/main/diy/x86_immortalwrt/openwrt_banner

# 替换内核
sed -i 's/KERNEL_PATCHVER:=4.19/KERNEL_PATCHVER:=4.9/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 4.9.298

sed -i 's/LINUX_KERNEL_HASH-4.9.297 = e43ba8cde809b3126a5192f5a8a83f47134a138955ce6811672f5f704db6d89f/LINUX_KERNEL_HASH-4.9.299 = 810e8d8b2f56bcef09a43b35b4b0af577180a1be0be2b84796494b7a22441ed8/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-4.9 = .297/LINUX_VERSION-4.9 = .299/g' ./include/kernel-version.mk

