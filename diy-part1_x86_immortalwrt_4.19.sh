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
svn co https://github.com/kissyouhunter/openwrt-packages/trunk/luci-app-adguardhome ./package/luci-app-adguardhome
svn co https://github.com/kissyouhunter/openwrt-packages/trunk/luci-app-bypass ./package/luci-app-bypass

# 替换index.htm文件 X86
wget -O ./package/emortal/autocore/files/generic/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_immortalwrt/main/diy/x86_immortalwrt/index_x86_immortalwrt.htm

# 替换banner
wget -O ./package/emortal/default-settings/files/openwrt_banner https://raw.githubusercontent.com/kissyouhunter/openwrt_immortalwrt/main/diy/x86_immortalwrt/openwrt_banner

# 内核替换成 kernel 4.19.235

sed -i 's/LINUX_KERNEL_HASH-4.19.246 = 00ad2f5a36c91221a2ade0078b93bf84b60d494bd1ef51eaccb5bdb6277dba3a/LINUX_KERNEL_HASH-4.19.269 = 6e0ba5d224ab216b7b938cc9ff2478be7882a884bbdf15374149bade4d58b20a/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-4.19 = .246/LINUX_VERSION-4.19 = .269/g' ./include/kernel-version.mk
