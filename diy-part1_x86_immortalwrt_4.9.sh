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

# 下载官方18.06 mac80211

rm -rf ./package/kernel/mac80211/

svn co https://github.com/openwrt/openwrt/branches/openwrt-18.06/package/kernel/mac80211 ./package/kernel/mac80211/

# 替换内核
sed -i 's/KERNEL_PATCHVER:=4.19/KERNEL_PATCHVER:=4.9/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 4.9.299

#sed -i 's/LINUX_KERNEL_HASH-4.9.297 = e43ba8cde809b3126a5192f5a8a83f47134a138955ce6811672f5f704db6d89f/LINUX_KERNEL_HASH-4.9.302 = d5456f05050e323d996721975bfe2b8bb1143ce68a4e5ae84e1f922f37b02e36/g' ./include/kernel-version.mk

#sed -i 's/LINUX_VERSION-4.9 = .297/LINUX_VERSION-4.9 = .302/g' ./include/kernel-version.mk
