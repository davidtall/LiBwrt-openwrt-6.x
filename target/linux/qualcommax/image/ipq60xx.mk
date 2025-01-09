define Device/8devices_mango-dvk
	$(call Device/FitImageLzma)
	DEVICE_VENDOR := 8devices
	DEVICE_MODEL := Mango-DVK
	IMAGE_SIZE := 27776k
	BLOCKSIZE := 64k
	SOC := ipq6010
	SUPPORTED_DEVICES += 8devices,mango
	IMAGE/sysupgrade.bin := append-kernel | pad-to 64k | append-rootfs | pad-rootfs | check-size | append-metadata
	DEVICE_PACKAGES := ipq-wifi-8devices_mango
endef
TARGET_DEVICES += 8devices_mango-dvk

define Device/EmmcImage
	IMAGES += factory.bin sysupgrade.bin
	IMAGE/factory.bin := append-rootfs | pad-rootfs | pad-to 64k
	IMAGE/sysupgrade.bin/squashfs := append-rootfs | pad-to 64k | sysupgrade-tar rootfs=$$$$@ | append-metadata
endef

define Device/glinet_gl-ax1800
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := GL-iNet
	DEVICE_MODEL := GL-AX1800
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-glinet_gl-ax1800 e2fsprogs dosfstools kmod-fs-ext4 kmod-fs-vfat \
		kmod-fs-exfat block-mount kmod-usb-storage kmod-usb2 fdisk
endef
TARGET_DEVICES += glinet_gl-ax1800

define Device/glinet_gl-axt1800
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := GL-iNet
	DEVICE_MODEL := GL-AXT1800
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-glinet_gl-axt1800 kmod-hwmon-core e2fsprogs dosfstools kmod-fs-ext4 kmod-fs-vfat \
		kmod-fs-exfat kmod-hwmon-pwmfan block-mount kmod-usb-storage kmod-usb2 fdisk
endef
TARGET_DEVICES += glinet_gl-axt1800

define Device/jdcloud_re-ss-01
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := JDCloud
	DEVICE_MODEL := RE-SS-01
	DEVICE_DTS_CONFIG := config@cp03-c2
	DEVICE_DTS := ipq6000-re-ss-01
	SOC := ipq6000
	DEVICE_PACKAGES := ipq-wifi-jdcloud_re-ss-01 kmod-fs-ext4 mkf2fs f2fsck kmod-fs-f2fs
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	IMAGE/factory.bin := append-kernel | pad-to $${KERNEL_SIZE}  |  append-rootfs | append-metadata
endef
TARGET_DEVICES += jdcloud_re-ss-01

define Device/jdcloud_re-cs-02
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := JDCloud
	DEVICE_MODEL := RE-CS-02
	DEVICE_DTS_CONFIG := config@cp03-c3
	DEVICE_DTS := ipq6010-re-cs-02
	SOC := ipq6010
	DEVICE_PACKAGES := ipq-wifi-jdcloud_re-cs-02 kmod-fs-ext4 mkf2fs f2fsck kmod-fs-f2fs
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	IMAGE/factory.bin := append-kernel | pad-to $${KERNEL_SIZE}  |  append-rootfs | append-metadata
endef
TARGET_DEVICES += jdcloud_re-cs-02

define Device/jdcloud_re-cs-07
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := JDCloud
	DEVICE_MODEL := ER1
	DEVICE_DTS_CONFIG := config@cp03-c4
	DEVICE_DTS := ipq6010-re-cs-07
	SOC := ipq6018
	DEVICE_PACKAGES := kmod-fs-ext4 mkf2fs f2fsck kmod-fs-f2fs
	BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	IMAGE/factory.bin := append-kernel | pad-to $${KERNEL_SIZE}  |  append-rootfs | append-metadata
endef
TARGET_DEVICES += jdcloud_re-cs-07

define Device/cambiumnetworks_xe3-4
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Cambium Networks
	DEVICE_MODEL := XE3-4
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp01-c3-xv3-4
	SOC := ipq6010
	DEVICE_PACKAGES := ipq-wifi-cambiumnetworks_xe34
endef
TARGET_DEVICES += cambiumnetworks_xe3-4

define Device/linksys_mr7350
	$(call Device/FitImage)
	DEVICE_VENDOR := Linksys
	DEVICE_MODEL := MR7350
	SOC := ipq6000
	NAND_SIZE := 256m
	KERNEL_SIZE := 8192k
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	IMAGE_SIZE := 75776k
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | \
		append-ubi | linksys-image type=MR7350
	DEVICE_PACKAGES := ipq-wifi-linksys_mr7350 \
		kmod-leds-pca963x kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += linksys_mr7350

define Device/netgear_wax214
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Netgear
	DEVICE_MODEL := WAX214
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6010
	DEVICE_PACKAGES := ipq-wifi-netgear_wax214
endef
TARGET_DEVICES += netgear_wax214

define Device/redmi_ax5
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Redmi
	DEVICE_MODEL := AX5
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-redmi_ax5
endef
TARGET_DEVICES += redmi_ax5

define Device/redmi_ax5-jdcloud
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := Redmi
	DEVICE_MODEL := AX5 JDCloud
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-redmi_ax5-jdcloud
	#BLOCKSIZE := 64k
	KERNEL_SIZE := 6144k
	IMAGE/factory.bin := append-kernel | pad-to $$(KERNEL_SIZE) | append-rootfs | append-metadata
endef
TARGET_DEVICES += redmi_ax5-jdcloud

define Device/xiaomi_ax1800
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Xiaomi
	DEVICE_MODEL := AX1800
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-xiaomi_ax1800
endef
TARGET_DEVICES += xiaomi_ax1800

define Device/qihoo_v6
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Qihoo
	DEVICE_MODEL := V6
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-qihoo_v6
endef
TARGET_DEVICES += qihoo_v6

define Device/cmiot_ax18
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := CMIOT
	DEVICE_MODEL := AX18
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-cmiot_ax18 kmod-fs-ext4 mkf2fs f2fsck kmod-fs-f2fs
endef
TARGET_DEVICES += cmiot_ax18

define Device/zn_m2
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := ZN
	DEVICE_MODEL := M2
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-zn_m2
endef
TARGET_DEVICES += zn_m2

define Device/yuncore_fap650
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Yuncore
	DEVICE_MODEL := FAP650
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-yuncore_fap650
	IMAGES := factory.ubi factory.ubin sysupgrade.bin
	IMAGE/factory.ubin := append-ubi | qsdk-ipq-factory-nand
endef
TARGET_DEVICES += yuncore_fap650

define Device/linksys_mr7350
	$(call Device/FitImage)
	DEVICE_VENDOR := Linksys
	DEVICE_MODEL := MR7350
	SOC := ipq6000
	KERNEL_SIZE := 8192k
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	UBINIZE_OPTS := -E 5
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | \
		append-ubi | linksys-image type=MR7350
	DEVICE_PACKAGES := ipq-wifi-linksys_mr7350 \
		kmod-leds-pca963x kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += linksys_mr7350
