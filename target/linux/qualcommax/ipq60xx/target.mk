SUBTARGET:=ipq60xx
BOARDNAME:=Qualcomm Atheros IPQ60xx
DEFAULT_PACKAGES += \
	nss-firmware-ipq6018 kmod-qca-nss-dp

define Target/Description
	Build firmware images for Qualcomm Atheros IPQ60xx based boards.
endef
