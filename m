Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19354DD82
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663FC113B16;
	Thu, 16 Jun 2022 08:51:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4EA113B09
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:50:59 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y32so1185439lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CtFmr9YnFXBNjwW1QqgTVpLtMjRSqbtnLnF5ahH9/9g=;
 b=pPPobIRP9kSIAIwFkE1PFoYJ9JAQlIrrZtZLq/UCm+y08DsoOCMBMPmfUJIO2Ureja
 jhOpQo0aJddInFsiZh4apdmYL/r3H9uwTwxV8m9A+0oHPHMHtzDajH/ahvEaL2t7uQES
 xDjXTNURa8l8uBtU1WF6W40cON6eHIlck2KOp38+tzuHyw5q2hN/kIjYpucSjfcC5zJX
 yNPPGhFOVkqroHMptIEujLGzSNgNIR018+A5ntGVbrWXghJjSOmJWZvkXJRLaZTlzsgn
 30ZefOFbFPoGuRsPAuJPhLe8yJBafhuHSplZGOfyub1B5tR54x1e8dEk8YcQwNSwHAyK
 YV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CtFmr9YnFXBNjwW1QqgTVpLtMjRSqbtnLnF5ahH9/9g=;
 b=ffu3wbGCdnBPi4a76rF7OmIVQz0TzaGAuJ5wmTWM/TknJ2VisE4YnwKxaiKtz4+lsz
 wnlQH6I7XmyffNw2zyXK+v7Yv10SpSsX5dgai0t9zoY2GGKm4avQtFEf9RViehlXePt/
 7UuLMv9CKaNHq8QRZYN4zx7A78+8uCbTGEZhAKO722MiivviijHgZxnhWa2dnWeMEnm4
 juj3O+tg0o3F9+3OkpvR4PmX0JSfKfvCsCGSMdizSnLtfzCvCNSquOZDQ2AGZhPe2WBK
 HNU6uBpz4/YVjFp01DZFxtdYsEZqaJC/wr8MsUrgnPVZcVIVawab5B+0AARrmobNXsa7
 axsg==
X-Gm-Message-State: AJIora8drGzNk4FJHhhcoX9NpmNLhEkCsUc0gxk4BLiyXJJdFDjs1kFW
 83zRK0YBvaoxY8PgXMuYG+P3IA==
X-Google-Smtp-Source: AGRyM1shxA9KdPhKLQQ5X/7BmpScUk3xhKPH5MFw8Wl9/GP2gf3ehMgtoiOssA+WoklvhVCJe3/dBw==
X-Received: by 2002:a05:6512:3b99:b0:47d:c408:555f with SMTP id
 g25-20020a0565123b9900b0047dc408555fmr2083991lfv.168.1655369458000; 
 Thu, 16 Jun 2022 01:50:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v18-20020ac25b12000000b0047255d21202sm149136lfn.305.2022.06.16.01.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:50:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 11:50:57 +0300
Message-Id: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/hdmi: support attaching the "next"
 bridge
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There might be a chain of bridges attached to the HDMI node
(including but not limited to the display-connector bridge). Add support
for attaching them right to the HDMI bridge chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..9fdb17317589 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -9,6 +9,7 @@
 #include <linux/of_gpio.h>
 
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_of.h>
 
 #include <sound/hdmi-codec.h>
 #include "hdmi.h"
@@ -133,6 +134,10 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
 
+	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
+	if (ret && ret != -ENODEV)
+		goto fail;
+
 	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
@@ -291,6 +296,15 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
+	if (hdmi->next_bridge) {
+		ret = drm_bridge_attach(hdmi->encoder, hdmi->next_bridge, hdmi->bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach next HDMI bridge: %d\n", ret);
+			goto fail;
+		}
+	}
+
 	hdmi->connector = drm_bridge_connector_init(hdmi->dev, encoder);
 	if (IS_ERR(hdmi->connector)) {
 		ret = PTR_ERR(hdmi->connector);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 736f348befb3..5241735438ac 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -68,6 +68,8 @@ struct hdmi {
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 
+	struct drm_bridge *next_bridge;
+
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-- 
2.35.1

