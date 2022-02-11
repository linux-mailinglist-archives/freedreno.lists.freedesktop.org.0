Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD64B30D6
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 23:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F14610EBA9;
	Fri, 11 Feb 2022 22:40:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DD310EBA7
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 22:40:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k10so11383709ljq.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
 b=DHUDXkodYg67FoSIT/jyDwu8mai51ctlRRP+iWjmYaBMn7H74cJ0iXyxOMtA9CdYf2
 Dvo+Ly8DjcW/FBEf1N9HChiPIEVIoKSslEznKV/Mk1Fg8PkonubmzrZzhCc9I79/bpgl
 Thahc/0zhXOY9qlHD1SSp9lQOtG5HjWGL/7dqnlFjqL1/YsiHUYByNo+6mgNLkxV3p6U
 RfL6A2HepzBInkrjkCUSYRUE1Jv0UM72YLFjGpaj3xDKQEhwOvHam0Au3aOZ3vc1bkOv
 XHog+VMigQ4eCHAfiGf5YGfgTGPQEquGI3Kk+8/TwT0RVr7WfiAoF9+B88gM5J3hcV4L
 estg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wQf3XP4BZfuzc3ylEELAJ2OjaNg6jTxSBCBJwv6w5qM=;
 b=gMQXM8DZlkX1StwlUoLzKxbEYMWbXoE5dwrUnmEJrPap/otdkRnorGwLTILKl4UFPx
 lp0lAx+67SkI/qnRzyDk0usVUiOWz2JqaUqo78giZ83isY7eLFek5krh1g0TYHfxU0mf
 jhbgjVA3EeXNoqWei7kN5nxHR6d78c5CmUfh8hmNCvRb2C65Po0Il1LUd4lZrx8y1oPz
 PH1Pu6aA6gnk0Zl+zg3gTtvOBF/ejK6LexPAdXbbit5RvPP/6w6V/MBOekDDQZtQZdli
 uEyxmu/a9ZHj8CIOL6wAp7QppwvzZ2dvDk8yuZkx4D6YcpelErUEefC3bPQ0CwbGg4+H
 bUZg==
X-Gm-Message-State: AOAM533y5mOVEqLumfCeSwqNwGF8ZdsScH2vikN2EDDr58oUsdBRorxT
 Zbd8oyYCEe9OWFAS1EoRGXSP49yKGJ/Stg==
X-Google-Smtp-Source: ABdhPJyGY6YZViUMDnHZZ7OR3CbJA9wYqdkelPBYfJ3WWwaqTKia3n3PZZK3fvt6ud9y9cz/ZvidYA==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr2204599ljb.261.1644619208126; 
 Fri, 11 Feb 2022 14:40:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:40:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Sat, 12 Feb 2022 01:40:02 +0300
Message-Id: <20220211224006.1797846-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 1/5] drm/msm/dp: fix panel bridge
 attachment
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") the DP driver received a drm_bridge instance, which
is always attached to the encoder as a root bridge. However it conflicts
with the panel_bridge support for eDP panels. The panel bridge attaches
to the encoder before the "dp" bridge has a chace to do so. Change
panel_bridge attachment to come after dp_bridge attachment.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..26ef41a4c1b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
-	if (dp_display->panel_bridge) {
-		ret = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, NULL,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret < 0) {
-			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
-			return ERR_PTR(ret);
-		}
-	}
-
 	return connector;
 }
 
@@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
+	if (dp_display->panel_bridge) {
+		rc = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (rc < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_remove(bridge);
+			return ERR_PTR(rc);
+		}
+	}
+
 	return bridge;
 }
-- 
2.34.1

