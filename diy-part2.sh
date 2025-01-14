#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-filebrowser
rm -rf feeds/luci/applications/luci-app-kodexplorer
rm -rf feeds/luci/applications/luci-app-diskman




# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/luci2/bin/config_generate

# 修改字符编码
sed -i 's/CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"/CONFIG_FAT_DEFAULT_IOCHARSET="utf8"/g' target/linux/generic/config-6.6
# sed -i 's/+firewall/+uci-firewall/g' feeds/luci/applications/luci-app-firewall/Makefile

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
# sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-123'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
# sed -i "s/OpenWrt /281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
# sed -i 's/luci-theme-opentomcat/luci-theme-atmaterial/g' feeds/luci/collections/luci/Makefile

# sed -i 's/	config PACKAGE_dnsmasq_full_nftset
# 		bool "Build with Nftset support."
# 		default n/	config PACKAGE_dnsmasq_full_nftset
# 		bool "Build with Nftset support."
# 		default n/g' package/network/services/dnsmasq/Makefile

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
# sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

#sirpdboy
# git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
# git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest

# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
# rm -rf feeds/luci/applications/luci-app-netdata && git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
# git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset

# themes添加（svn co 命令意思：指定版本如https://github）
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial

# git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter

# git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass

# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

# git clone https://github.com/gdy666/luci-app-lucky.git package/lucky
git clone https://github.com/sirpdboy/luci-app-lucky.git package/luci-app-lucky
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/luci-app-ddns-go
git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman
git clone https://github.com/chenmozhijin/luci-app-socat package/luci-app-socat
git clone https://github.com/lisaac/luci-app-diskman package/luci-app-diskman
git clone https://github.com/tty228/luci-app-wechatpush.git package/deng/luci-app-wechatpush
# git clone https://github.com/y12800/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset

# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
# git clone https://github.com/ZeaKyX/luci-app-speedtest-web.git package/luci-app-speedtest-web
# git clone https://github.com/ZeaKyX/speedtest-web.git package/speedtest-web

# git clone https://github.com/y12800/luci-app-filebrowser package/filebrowser
# git clone https://github.com/xiaozhuai/luci-app-filebrowser package/luci-app-filebrowser
git clone https://github.com/wangqn/luci-app-filebrowser package/luci-app-filebrowser

git clone https://github.com/danchexiaoyang/luci-app-kodexplorer package/luci-app-kodexplorer
# git clone https://github.com/sirpdboy/luci-app-cupsd.git package/deng/luci-app-cupsd
git clone https://github.com/sirpdboy/luci-app-parentcontrol package/deng/luci-app-parentcontrol

#添加额外非必须软件包
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
# git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
# git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
# git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
git clone https://github.com/zijieKwok/luci-app-nginx-manager package/luci-app-nginx-manager
git clone https://github.com/arenekosreal/luci-app-nginx package/luci-app-nginx


#添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

git clone https://github.com/jerrykuku/luci-theme-argon.git package/deng/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/deng/luci-app-argon-config

git clone https://github.com/derisamedia/luci-theme-alpha package/deng/luci-theme-alpha
git clone https://github.com/derisamedia/luci-app-alpha-config package/deng/luci-app-alpha-config

git clone https://github.com/openwrt/luci deng-tmp1 && mv deng-tmp1/applications/luci-app-cloudflared package/deng/luci-app-cloudflared
git clone https://github.com/openwrt/packages deng-tmp2 && mv deng-tmp2/net/cloudflared package/deng/cloudflared

sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-cloudflared/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/deng/cloudflared/Makefile

git clone https://github.com/kenzok8/small-package deng-tmp3 && mv deng-tmp3/luci-app-speedtest-web package/deng/luci-app-speedtest-web && mv deng-tmp3/speedtest-web package/deng/speedtest-web && mv deng-tmp3/luci-app-cupsd package/deng/luci-app-cupsd && mv deng-tmp3/cups package/deng/cups
sed -i 's#../../#$(TOPDIR)/feeds/luci/#g' package/deng/luci-app-cupsd/Makefile
sed -i 's#../../#$(TOPDIR)/feeds/packages/#g' package/deng/cups/Makefile



