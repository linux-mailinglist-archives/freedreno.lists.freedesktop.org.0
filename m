Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826082025B
	for <lists+freedreno@lfdr.de>; Fri, 29 Dec 2023 23:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EB610E2F4;
	Fri, 29 Dec 2023 22:57:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BB510E2EA
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 22:57:02 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e7dd8bce8so4331120e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 14:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890621; x=1704495421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN+QhfjzW6P1W7O8ikSW8Wdk6+ITJyhlX+DJs6XFBy4=;
 b=ltgxipInh4N+867US3jHyYZISRIC39rKo8ymHNb0ocGY/+BD43TS4m6h3Rpo84Y0MC
 w1PjqLidZwlHRQR+kNO1A4G+N2oEkU9XjA4S+/S1eox1CRU9bjbiAZLaKLhKRMrVjAzX
 2WngtwumEBGTJq4Ef8ncuWK2JgfEoR/aeayo3ycihwIyA7jzzbKlCZTLH8ouXyaj+Ysi
 Wos8Ob0MwuRh6WyDmHIJ8TGqi9z6uPrsH7FyOz5zfQM+uyKzy+OmieHyWwLayTKFjT8N
 LqBq28SGOMiGgRhzlfPxmr86VE0i6juU/0c+tMMLu+WhUAa/04Sla9sqaDMVihvQ20eX
 3W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890621; x=1704495421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN+QhfjzW6P1W7O8ikSW8Wdk6+ITJyhlX+DJs6XFBy4=;
 b=aFS9Qnj768nJXV9kjAoYtYZIAL0gcu31u/e5LYFfiV61VZdxFp8+fWydaP44Nq7EtK
 ZkNcOkjzIKKLhblsMhSVWMuLZOBwEqPi0QVFRl7hhULBAn4AGrEAI0HqL0LncAqfZVrI
 y1+YbV9uo4JLltHMPegbsclfpOlJWCCpZOouQR3HQFV6VGbSV+z/z66JYbTrL1XXpuGy
 ZdmuSEnKAMeZDRteFqFSno2Bp30KtuTJGWU29g0QUmEfbUBkBrYSShZkfWTPW0f2msRq
 RQ0iQl9z7ohhOjMdIDcQmCDwqmPvO+oJGMHAeYjT51WaVlOXgLHmk6S/gdEouFkVH33f
 R5TQ==
X-Gm-Message-State: AOJu0Yy/zvt58be+tUyWoPGj5fh3U4zasMODJMci76efQRI0n8Kncvie
 NWqSdFPDJl/I+e0z5PQjJPNdBj0n/E5Q6Q==
X-Google-Smtp-Source: AGHT+IGFvnyGaUZgzOXysYSJJFs72wqZ9ABaDZ+u9s2biWLoEy3FICm1Llc5zAhNYHFhQvSNOjKqvA==
X-Received: by 2002:ac2:51a7:0:b0:50e:4bf6:8848 with SMTP id
 f7-20020ac251a7000000b0050e4bf68848mr5097967lfk.38.1703890621344; 
 Fri, 29 Dec 2023 14:57:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:57:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
Date: Sat, 30 Dec 2023 00:56:49 +0200
Message-Id: <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Remove two levels of indirection and fetch next bridge directly in
dp_display_probe_tail().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
 3 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4de0857c31ce..923df47efcc9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1195,16 +1195,24 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp);
-
 static int dp_display_probe_tail(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dp_display_get_next_bridge(dp);
-	if (ret)
-		return ret;
+	/*
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
+	 *
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
+	 */
+	dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->dev.of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		if (dp->is_edp || ret != -ENODEV)
+			return ret;
+	}
 
 	ret = component_add(dev, &dp_display_comp_ops);
 	if (ret)
@@ -1397,30 +1405,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
 	}
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp)
-{
-	int rc;
-	struct dp_display_private *dp_priv;
-
-	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-
-	/*
-	 * External bridges are mandatory for eDP interfaces: one has to
-	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
-	 *
-	 * For DisplayPort interfaces external bridges are optional, so
-	 * silently ignore an error if one is not present (-ENODEV).
-	 */
-	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
-	if (!dp->is_edp && rc == -ENODEV)
-		return 0;
-
-	if (!rc)
-		dp->next_bridge = dp_priv->parser->next_bridge;
-
-	return rc;
-}
-
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index aa135d5cedbd..f95ab3c5c72c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,20 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
-{
-	struct platform_device *pdev = parser->pdev;
-	struct drm_bridge *bridge;
-
-	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
-	if (IS_ERR(bridge))
-		return PTR_ERR(bridge);
-
-	parser->next_bridge = bridge;
-
-	return 0;
-}
-
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index bc56e0e8c446..2b39b1c394ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -22,7 +22,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	struct drm_bridge *next_bridge;
 };
 
 /**
@@ -38,17 +37,4 @@ struct dp_parser {
  */
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
-/**
- * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
- *
- * @dev: device to tie bridge lifetime to
- * @parser: dp_parser data from client
- *
- * This function is used to find any additional bridge attached to
- * the DP controller. The eDP interface requires a panel bridge.
- *
- * Return: 0 if able to get the bridge, otherwise negative errno for failure.
- */
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
-
 #endif
-- 
2.39.2

