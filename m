Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214AD4B9889
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 06:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4186F10E883;
	Thu, 17 Feb 2022 05:55:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CFC10E85B
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 05:55:36 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id c10so6643429ljr.9
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 21:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELWJzwknTbo8V/NBjl+dsOP5IJD11EhzymdHIJHz4Lo=;
 b=yCDDfsBMHBjAf/YtdEVTAviPOlHteynapJRfsV8un6d4eyfRZPbUdrr7H1jHc9RLu7
 S2ubQ2F5ghpCmdgyuZpO5QWmETu1rJ4LarnZNlV5q2XktSQ2PGHjj7H4UrzBSbdKMm5u
 maMBoW4nCw929vnJF7aaakSeiXCyiZDFNDq4M42XorEDHXMauy53AXFcYXBZbo+y8Wdg
 BYt4uSDCWkGGG8vpS0cztMbzcwOKsnGLXml/ywMlVx0g4lh/qdyIOeqReO0KGIPn1SRm
 THkzjnZioicHP5gFvfWIciN5HlnF7WXpII1wPZ4kqKTFzJq5HItSqnU9dQFnbIJL3lqb
 p6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ELWJzwknTbo8V/NBjl+dsOP5IJD11EhzymdHIJHz4Lo=;
 b=ii0BHLH30Kg7I263nlIVzRZiH3QXulnj0GxlZfl/VJE5zsPCZa06hEXzhrjxFXnBBm
 XGz404cMO14pvQkREhlSRDp7gC8go2EOyxO3F6MDVGWHbdHby0G1jfZ9uiTp1LpuLxHa
 NsEIWDpnc9AnLPyFuUvyEdJkU2yZMFLRwXtWDgf67L6m5ma+ebJVoTpyfPT5s/89/2MP
 qah77NX83HfEAUOp9ghKONfQlIv4+bDp4hclJd0uRIewAWgZAi2+8nfyfIDZGND8S+Zh
 2kr2Cnk6IEDwT783xtubx/5ocECTl2sO9K0Dv4JOsoaTNJPaxj0DFa6oku4khYKfNsLz
 QC5g==
X-Gm-Message-State: AOAM531VoPzWxGK7gLZr9x8drmMPdMx02E+N8dZ2k0DkeiS7OEARwfWf
 5y9LeplXki01XT6eUcEhSJh3wg==
X-Google-Smtp-Source: ABdhPJzngQA4L1vwgFLgntsnVIWJbqn4fDzzi6VUYuu+l9gCYUae0lRxUr3ldrb12+sLgzMWyG48IA==
X-Received: by 2002:a05:651c:160a:b0:23d:1418:8db2 with SMTP id
 f10-20020a05651c160a00b0023d14188db2mr1069229ljq.361.1645077334537; 
 Wed, 16 Feb 2022 21:55:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 21:55:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 08:55:28 +0300
Message-Id: <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 4/5] drm/msm/dp: inline
 dp_power_clk_set_rate()
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

Inline the dp_power_clk_set_rate() function, replacing it with the call
to msm_dss_enable_clk().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 6920d787e7aa..8d63a51cce7d 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -150,21 +150,6 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
 	return 0;
 }
 
-static int dp_power_clk_set_rate(struct dp_power_private *power,
-		enum dp_pm_type module, bool enable)
-{
-	int rc = 0;
-	struct dss_module_power *mp = &power->parser->mp[module];
-
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
-	if (rc) {
-		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
-		return rc;
-	}
-
-	return 0;
-}
-
 int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
 {
 	DRM_DEBUG_DP("core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -187,6 +172,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 {
 	int rc = 0;
 	struct dp_power_private *power;
+	struct dss_module_power *mp;
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
@@ -214,9 +200,11 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		}
 
 		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
+			mp = &power->parser->mp[DP_CORE_PM];
+
 			DRM_DEBUG_DP("Enable core clks before link clks\n");
 
-			rc = dp_power_clk_set_rate(power, DP_CORE_PM, enable);
+			rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
 			if (rc) {
 				DRM_ERROR("fail to enable clks: %s. err=%d\n",
 					dp_parser_pm_name(DP_CORE_PM), rc);
@@ -226,7 +214,8 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		}
 	}
 
-	rc = dp_power_clk_set_rate(power, pm_type, enable);
+	mp = &power->parser->mp[pm_type];
+	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
 	if (rc) {
 		DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
 			enable ? "enable" : "disable",
-- 
2.34.1

