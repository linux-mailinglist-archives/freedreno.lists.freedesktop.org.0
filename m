Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1D7E0BC3
	for <lists+freedreno@lfdr.de>; Sat,  4 Nov 2023 00:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3F610EAF6;
	Fri,  3 Nov 2023 23:04:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BE510EAF5
 for <freedreno@lists.freedesktop.org>; Fri,  3 Nov 2023 23:04:16 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so36555731fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Nov 2023 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699052655; x=1699657455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
 b=Dksjh1N/WK/DOQkYvP0c3Owl8wpkccL+7BOCNxTcoXiPD5g0EvdzqKS5NYaXY0iVB3
 qn9nj0vAuJT9S45LbWjVJxfadJi4gp4JJq3hUi1zUpweTBZgFeb5or4mq0MAhsydGsR4
 JTLHVyKlbc9k8FjjlnZ/GCNfxtQZqfGRoCLtblGB1BytfaTAfVlNfLcogXtxGIJAa+XW
 thMSFKFvbE9UGzQJfBodwFNDt9pz5E4JIfhGUtQV/ixkKH7OvspExPy9lL/O8LJjGRXw
 52PMxa6P6OqHoSV4W7J20HKM6SdTaszKGs66SajymhzlQcABfyDl4CdLP7m5f08rKY8s
 ix5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699052655; x=1699657455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
 b=QraLK49T/Zco+Om6nXvvC6faS3GBwb5AcIBCA563nP5s/z0ATOGhm5XcdU2OiMkesM
 87tpnfRsTSxrQbLuaXIFlZxXaKRUlhiPMS+LCF5wD/9rZt1i08Rmzm3HQUrNJEnUcPu0
 J+CA2W+EYw96e2FIaCuAjENAd8whWR1DX7ZemSUk/ye82NNO+A/ikGguEopSaEuDXMSJ
 4COIFNiGlKp+NOMqAo1vCRnatszw4eH7X//bmQdqNO5b8OOIGRCSXB7YChiNO4V9PhKD
 9Oj+0fe/fF/g+lIg573l2Agdv/aXDDjGzsrT7Wzg/4nNXV/x0T7BN2iXWjnhp/xHHTzs
 bbhw==
X-Gm-Message-State: AOJu0YxiNDXK2s6I4KRrvOwKaha9GXgCROC8nV6RwXl4ss74D+ZkytkE
 2/HgoGxUkZ5g18n5zFdBtxQ0Jg==
X-Google-Smtp-Source: AGHT+IFoXzOXhXBxDzb1hTvIAcYEh+H5qZuHfzgUAzlorrDsdIJFHrrZhJIyqpoiknvP1IZYHUsBww==
X-Received: by 2002:a05:6512:688:b0:507:9a13:27bd with SMTP id
 t8-20020a056512068800b005079a1327bdmr22258057lfe.7.1699052655045; 
 Fri, 03 Nov 2023 16:04:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 16:04:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat,  4 Nov 2023 01:03:03 +0200
Message-ID: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 0/6] drm: simplify support for transparent
 DRM bridges
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
in a different way resulted either in series of hacks or in device tree
not reflecting the actual hardware design. This results in drivers
having similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device. Device links can not fully
solve this problem since there are mutual dependencies between adjancent
devices.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Changes since v5:
 - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.

Changes since v4:
 - Added documentation for new API (Sima)
 - Added generic code to handle "last mile" DP bridges implementing just
   the HPD functionality.
 - Rebased on top of linux-next to be able to drop #ifdef's around
   drm_bridge->of_node

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (6):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
  drm/bridge: implement generic DP HPD bridge
  soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
  usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE

 drivers/gpu/drm/bridge/Kconfig                |  17 ++
 drivers/gpu/drm/bridge/Makefile               |   2 +
 drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
 drivers/soc/qcom/Kconfig                      |   1 +
 drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
 drivers/usb/typec/mux/Kconfig                 |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
 drivers/usb/typec/tcpm/Kconfig                |   1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
 include/drm/bridge/aux-bridge.h               |  37 ++++
 13 files changed, 383 insertions(+), 145 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.42.0

