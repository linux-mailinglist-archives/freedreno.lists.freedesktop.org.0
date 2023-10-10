Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B331D7C4540
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 01:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB5C10E08C;
	Tue, 10 Oct 2023 23:10:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923510E3F9
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 23:10:21 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c00e1d4c08so80047971fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696979419; x=1697584219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
 b=OMuncPx0LKlKV6U+ZlNrwhr3wd7xUwVayKBHc/TuWw+uNW9tSlmiCiyOBkf3s4RyhL
 ZeHLSEx9nFtQmZanDJv0kljCytyd3ogumLi/sXPPVWiTk4d7JDjf7XLoqdWx2UhkZVJX
 FsLSo3SVVlnV2JGNdV2aa0Hc5ZoVEaRuDQEFq9tcMSqo7k9ZnCrnwFO+qogUejFQGZ46
 pBFj/3D9MGs+Rt/lpgIfqMDrbhJPuov8DSS9H/jWjhfm51zb3vAJ2XaQw7Lxsjrd40v2
 oXeCO0oCjDzfojckfdgWT2HOO/1OSAQK8qA9kYrArKk7YiMhiEm0scmCITAMauyj7s18
 9rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696979419; x=1697584219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
 b=N5YMrtR7sqGhSgM0R9/aZaDSbuyYxXS1pQDNiiT0Fa/maSx9O6J8c582VzoOjSHHFO
 0JQGI6JEOJNAPfthh7RGZPt+6iUb4mVG8DpdMQcvJrhj4iQAfTPDurkviG9bqkzqxncu
 iaWemdckSEptIjJogqExGzzNF3qKl9yd3EijQZECT/Dcwehf3y2KinfQFtndF13MZVYz
 CZhMvbJm7/N+EALssPj9BgKop3Fdqs5+iVg6vwdzHtop34wnfGXitpZeMk8sCUPbXdAu
 hYyXh5KW81Q6KWEmbDEThhMHA6hqI+OCo309DvqxiC/3XEDp2NPhhZZalnLyEeJIzm7o
 dtJg==
X-Gm-Message-State: AOJu0YxOcDdnJ0tkB3Vr5Um1OfA3D+DuhY4DcoDck7W0fNa56UplX5br
 0lUMdlLcmIkC8gJnbKQ4sfABzw==
X-Google-Smtp-Source: AGHT+IHzC7VAJwHBIwZnsBz9+yJMjFzhwQb9W4iUEnN/3lFIYSrR0mUHG3GMEpkhU798pd11+uJUDw==
X-Received: by 2002:a2e:8816:0:b0:2bc:db99:1775 with SMTP id
 x22-20020a2e8816000000b002bcdb991775mr16410708ljh.26.1696979419245; 
 Tue, 10 Oct 2023 16:10:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 16:10:18 -0700 (PDT)
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
Date: Wed, 11 Oct 2023 02:10:15 +0300
Message-Id: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/3 RESEND] drm: simplify support for
 transparent DRM bridges
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

[Resending since the discussion with Laurent has died with no response
received for more than three weeks]

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

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE

 drivers/gpu/drm/bridge/Kconfig            |   9 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig              |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
 drivers/usb/typec/mux/Kconfig             |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
 include/drm/bridge/aux-bridge.h           |  19 ++++
 8 files changed, 167 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.39.2

