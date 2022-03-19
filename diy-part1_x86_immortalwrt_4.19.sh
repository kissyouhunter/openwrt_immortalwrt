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

# 内核替换成 kernel 4.19.235

sed -i 's/LINUX_KERNEL_HASH-4.19.231 = 673123b3b3b05e2d8586c82a342ff2556e0b1f2caaadd643fefb9d91d58d8131/LINUX_KERNEL_HASH-4.19.235 = 530c5ac848111bbf7d1ad407a4ce8173ef8f9a4554477a32c695c5a4eaf02598/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-4.19 = .231/LINUX_VERSION-4.19 = .235/g' ./include/kernel-version.mk
