include $(TOPDIR)/rules.mk

PKG_NAME:=ChinaDNS
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/qiuyi21/ChinaDNS.git
PKG_SOURCE_DATE:=2017-03-06
PKG_SOURCE_VERSION:=216302153e4ea4e99e690b85698fa5823f7de8cc

PKG_MAINTAINER:=clowwindy <clowwindy42@gmail.com>

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ChinaDNS/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ChinaDNS
  URL:=https://github.com/clowwindy/ChinaDNS
endef

define Package/ChinaDNS
  $(call Package/ChinaDNS/Default)
endef

define Package/ChinaDNS/description
A DNS forwarder that ignores incorrect(you knew it) responses.
endef

define Package/ChinaDNS/conffiles
/etc/chinadns_iplist.txt
endef

define Build/Prepare
	$(Build/Prepare/Default)
	./files/prepare.sh "$(PKG_BUILD_DIR)"
endef

define Package/ChinaDNS/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/iplist.txt $(1)/etc/chinadns_iplist.txt
	$(INSTALL_DIR) $(1)/usr/share/chinadns
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/chnroute.gz $(1)/usr/share/chinadns/
	$(INSTALL_BIN) ./files/chinadns.init $(1)/etc/init.d/chinadns
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/chinadns $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ChinaDNS))
