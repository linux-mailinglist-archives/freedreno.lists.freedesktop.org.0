Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C40CC9E0B
	for <lists+freedreno@lfdr.de>; Thu, 18 Dec 2025 01:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AA810E02E;
	Thu, 18 Dec 2025 00:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbz9+bjr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D993910E02E
 for <freedreno@lists.freedesktop.org>; Thu, 18 Dec 2025 00:19:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so23071f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 16:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766017181; x=1766621981; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3kUVQaLKncxiRp/vqoDgQl5p2NRR1lum8QhNB8KPTe8=;
 b=lbz9+bjrv84iopo0ulJBVc0N5MOkkHnkViTZ7nG4alzGYLdbEs7Ds01ljo6rDdUqRT
 18FZz8EFgRF9kZm3DnW7MO86Wn2zEFoAxSGkSTQdgKU5D80rkbYKSUptHAzpyta5hEzm
 EtNAinVsD5jNvVwtDadT8mEyvfIYweTy+zAJ+UJbJNMPIkEaUSr6BQzn9fZp+yxpqFG6
 EwhD+oZDfJukcKYRbokJ9tkt0AIbn4aQpZ7A/VIcLYQhiRWRJSJYDc9KhowNiMmVV3YB
 58Z67zbFn+6+wdl2M2BbjDf13auTcgjKGd5XOQUWTbQgVv9IWR85i2KPa7mHzsEslm3N
 B19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766017181; x=1766621981;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kUVQaLKncxiRp/vqoDgQl5p2NRR1lum8QhNB8KPTe8=;
 b=X9u6yJN5wURWtUUD2E57F1XnOOHGp0T2QYhrl7OSJFWs1HceM1fz9RqsGuLv2Pmd4B
 99AKUuz62lcpVZYm+eKqs6qwtNNcTpCtX4VV8Y2Jlh61waRAVucIXgPINs4jVXa3iN0e
 6igKRYpzCY6scN6hIPXYjDxv1kG4cNiEfxh97E5coYolN5h+qFFIhFqN/IqfrL8rme2+
 Uk9tA+X4tqZ4fJhL+PoOMAfhjKoK/NOM+WaYQdzHDHLkzg3V3CsqgxNXdtoRiAjHookr
 dvpE/X6cfXgXDp/xLaPulMqLZtG/j12v85+holGAycfk7KTjuhq7I3cQxfDXzD4FRmuN
 KgNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy+l7MpdnXB6romTtlOleoV9skyNmt0Zn7METHgkzHJRExrT4D5h50xTASYe2Bv4pr3eblF85qJQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtQkgXCFf/Rdr9Lx4z0if9KkiOUDrQ+c6RWtxzGJmX/SVv5VRM
 I0f0OXByiLS4/db5SzAVKUBzCRHZXei5wIr2LnAFQdZqaY6sXR0Y0viW
X-Gm-Gg: AY/fxX5TQ5OiKp+4KYpndYob5j6B9jvxHUakgT0KMHaZShwkWEROb+tdvf6XSsO9UHt
 MQCUg4xd+0D2iE0+uck+FGLy9MOGX9VzNXUREGu2eOuJ1cr08EnMvYiu4D+u8T00isHJBix5iM1
 Nfm1/LU5XPcGStj/YgJWq28GOduKWNrkOm3n/r8Ro9EBepFTsO3kqCfSE7l8bVgykutcHgL2GWU
 1NK7jx+27eeaU0N4WhQC9hDUYvDBmEIHJ8JYHn/2pDQKHFoKB7qISofAd/NbcT3jc4p2ZUaPIEd
 MKvtqacbMuYbeaQrOUc7klSKpZMCrSfvpduA7ji2sZH62jgH+Zs4ONaHKGSpAcTfi3IIgiEkyEv
 11QUbaJFEz4xK2NXQWlAT69C/+xgWCTlkifRmjSxv86EEmRaf297aC+uQ56maf6X0nJaSmmY4wj
 H3MrkeN9633Xg+Wl2VgO5Wb5g/U41y6KuFK/WBphCel2PU9zRxfJxiKKMvUqxzznDAMsWweA==
X-Google-Smtp-Source: AGHT+IHpXOK6G9ypAXb1YFAcTnbHKHq1QrwSCQMOelXbJG6LwWV50H/93CE5g/zG6iKkk+5NqSaRVQ==
X-Received: by 2002:a05:6000:144e:b0:431:66a:cbc3 with SMTP id
 ffacd0b85a97d-431066acfc6mr6234585f8f.6.1766017181032; 
 Wed, 17 Dec 2025 16:19:41 -0800 (PST)
Received: from [192.168.1.5] (92.40.201.212.threembb.co.uk. [92.40.201.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324498f8fcsm1736920f8f.24.2025.12.17.16.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 16:19:40 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Thu, 18 Dec 2025 00:19:32 +0000
Subject: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJNIQ2kC/3XMQQrCMBCF4auUWRtxYlKCK+8hXYTJtB0wbUkkK
 CV3N3bv8nvw/h0yJ+EMt26HxEWyrEuDPnVAs18mVhKaQV+0RY1GhRRVzFFx2JrcaAL1NtDVeGi
 fLfEo76P3GJpnya81fY58wd/6r1RQoTI2sCPsHTHdp+jleaY1wlBr/QIThsWHqgAAAA==
X-Change-ID: 20251214-drm-msm-edp14-8f4dc65dc34a
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dale Whinham <daleyo@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Steev Klimaszewski <threeway@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766017179; l=8706;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=MWwdmCJQUimtCRSKhTPNjOdSH8ty9Q7hQ/j7WkOhuO0=;
 b=f0edPEKpkgbHI5mZQN3mY3VQIh3N25NN+HNlwzJPp1EwfvqNNICpubZI6gIYXI0B4H6wcA3qU
 PWh8iNH82egB+ECHp4FI7Ui56p7Cu9wvDUkHJlex/eoWq8ag3L9+Yye
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The MSM DRM driver currently does not support panels which report their
supported link rates via the SUPPORTED_LINK_RATES table.

For panels which do not offer the optional eDP v1.3 fallback via
MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
ATNA30DW01-1 as found in Microsoft Surface Pro 11).

Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
present.

Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
but only if LINK_BW_SET hasn't already been written to.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com>
---
Changes in v2:
- Re-ordered writing of LANE_COUNT_SET/LINK_BW_SET registers to match i915 [Dmitry]
- Fix detection of eDP by reading EDP_CONFIGURATION_CAP and EDP_REV (in v1 we were mistakenly checking DPCD_REV) [Dmitry]
- Link to v1: https://lore.kernel.org/r/20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 56 ++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 93 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 120 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cbcc7c2f0ffc..aa2303d0e148 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -175,20 +175,28 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
-	u8 values[2];
+	u8 lane_count, bw_code;
 	int err;
 
-	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
-	values[1] = link->num_lanes;
+	lane_count = link->num_lanes;
 
 	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
-		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 
-	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
+	err = drm_dp_dpcd_writeb(aux, DP_LANE_COUNT_SET, lane_count);
 	if (err < 0)
 		return err;
 
-	return 0;
+	if (link->use_rate_set) {
+		DRM_DEBUG_DP("using LINK_RATE_SET: 0x%02x", link->rate_set);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_RATE_SET, link->rate_set);
+	} else {
+		bw_code = drm_dp_link_rate_to_bw_code(link->rate);
+		DRM_DEBUG_DP("using LINK_BW_SET: 0x%02x", bw_code);
+		err = drm_dp_dpcd_writeb(aux, DP_LINK_BW_SET, bw_code);
+	}
+
+	return err;
 }
 
 /*
@@ -1474,26 +1482,32 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret = 0;
+	struct msm_dp_link_info *link_params = &ctrl->link->link_params;
 
-	switch (ctrl->link->link_params.rate) {
-	case 810000:
-		ctrl->link->link_params.rate = 540000;
-		break;
-	case 540000:
-		ctrl->link->link_params.rate = 270000;
-		break;
-	case 270000:
-		ctrl->link->link_params.rate = 162000;
-		break;
-	case 162000:
-	default:
-		ret = -EINVAL;
-		break;
+	if (link_params->rate_set) {
+		--link_params->rate_set;
+		link_params->rate = link_params->supported_rates[link_params->rate_set];
+	} else {
+		switch (link_params->rate) {
+		case 810000:
+			link_params->rate = 540000;
+			break;
+		case 540000:
+			link_params->rate = 270000;
+			break;
+		case 270000:
+			link_params->rate = 162000;
+			break;
+		case 162000:
+		default:
+			ret = -EINVAL;
+			break;
+		}
 	}
 
 	if (!ret) {
 		drm_dbg_dp(ctrl->drm_dev, "new rate=0x%x\n",
-				ctrl->link->link_params.rate);
+				link_params->rate);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index b1eb2de6d2a7..725e08f75574 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -17,6 +17,9 @@
 struct msm_dp_link_info {
 	unsigned char revision;
 	unsigned int rate;
+	unsigned int supported_rates[DP_MAX_SUPPORTED_RATES];
+	unsigned int rate_set;
+	bool use_rate_set;
 	unsigned int num_lanes;
 	unsigned long capabilities;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index ad5d55bf009d..891211b23202 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -13,6 +13,8 @@
 #include <drm/drm_print.h>
 
 #include <linux/io.h>
+#include <linux/types.h>
+#include <asm/byteorder.h>
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
@@ -107,29 +109,98 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
-	link_info->rate = drm_dp_max_link_rate(dpcd);
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(link->lttpr_common_caps);
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(link->lttpr_common_caps);
+
+	/* eDP sink */
+	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
+		u8 edp_rev;
+
+		rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
+		if (rc)
+			return rc;
+
+		drm_dbg_dp(panel->drm_dev, "edp_rev=0x%x\n", edp_rev);
+
+		/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
+		if (edp_rev >= DP_EDP_14) {
+			__le16 rates[DP_MAX_SUPPORTED_RATES];
+			u8 bw_set;
+			int i;
+
+			rc = drm_dp_dpcd_read_data(panel->aux, DP_SUPPORTED_LINK_RATES,
+						   rates, sizeof(rates));
+			if (rc)
+				return rc;
+
+			rc = drm_dp_dpcd_read_byte(panel->aux, DP_LINK_BW_SET, &bw_set);
+			if (rc)
+				return rc;
+
+			/* Find index of max supported link rate that does not exceed dtsi limits */
+			for (i = 0; i < ARRAY_SIZE(rates); i++) {
+				/*
+				 * The value from the DPCD multiplied by 200 gives
+				 * the link rate in kHz. Divide by 10 to convert to
+				 * symbol rate, accounting for 8b/10b encoding.
+				 */
+				u32 rate = (le16_to_cpu(rates[i]) * 200) / 10;
+
+				if (!rate)
+					break;
+
+				drm_dbg_dp(panel->drm_dev,
+					   "SUPPORTED_LINK_RATES[%d]: %d\n", i, rate);
+
+				/*
+				 * Limit link rate from link-frequencies of endpoint
+				 * property of dtsi
+				 */
+				if (rate > link->max_dp_link_rate)
+					break;
+
+				/* Limit link rate from LTTPR capabilities, if any */
+				if (max_lttpr_rate && rate > max_lttpr_rate)
+					break;
+
+				link_info->rate = rate;
+				link_info->supported_rates[i] = rate;
+				link_info->rate_set = i;
+			}
+
+			/* Only use LINK_RATE_SET if LINK_BW_SET hasn't already been written to */
+			if (!bw_set && link_info->rate)
+				link_info->use_rate_set = true;
+		}
+	}
+
+	/* Fall back on MAX_LINK_RATE/LINK_BW_SET (DP, eDP <= v1.3) */
+	if (!link_info->rate) {
+		link_info->rate = drm_dp_max_link_rate(dpcd);
+
+		/* Limit link rate from link-frequencies of endpoint property of dtsi */
+		if (link_info->rate > link->max_dp_link_rate)
+			link_info->rate = link->max_dp_link_rate;
+
+		/* Limit link rate from LTTPR capabilities, if any */
+		if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
+			link_info->rate = max_lttpr_rate;
+	}
+
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
 	if (link_info->num_lanes > link->max_dp_lanes)
 		link_info->num_lanes = link->max_dp_lanes;
 
-	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > link->max_dp_link_rate)
-		link_info->rate = link->max_dp_link_rate;
-
 	/* Limit data lanes from LTTPR capabilities, if any */
-	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
 	if (max_lttpr_lanes && max_lttpr_lanes < link_info->num_lanes)
 		link_info->num_lanes = max_lttpr_lanes;
 
-	/* Limit link rate from LTTPR capabilities, if any */
-	max_lttpr_rate = drm_dp_lttpr_max_link_rate(panel->link->lttpr_common_caps);
-	if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
-		link_info->rate = max_lttpr_rate;
-
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
+	drm_dbg_dp(panel->drm_dev, "link_rate_set=%d\n", link_info->rate_set);
+	drm_dbg_dp(panel->drm_dev, "use_rate_set=%d\n", link_info->use_rate_set);
 	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
 
 	if (drm_dp_enhanced_frame_cap(dpcd))

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251214-drm-msm-edp14-8f4dc65dc34a

Best regards,
-- 
Dale Whinham <daleyo@gmail.com>

