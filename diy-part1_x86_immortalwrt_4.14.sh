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
sed -i 's/PATCHVER:=4.19/PATCHVER:=4.14/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 4.14.264

#sed -i 's/LINUX_KERNEL_HASH-4.14.262 = 4cfd785381edbfcd86dfb1cd8d264d872643d71afd2b832fa2090f5b7228d417/LINUX_KERNEL_HASH-4.14.267 = 8c343f885cfe25a51a8d40595afe5268ce09eaf8f531f9546ecf20831924188e/g' ./include/kernel-version.mk

#sed -i 's/LINUX_VERSION-4.14 = .262/LINUX_VERSION-4.14 = .267/g' ./include/kernel-version.mk
