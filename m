Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3059556F66
	for <lists+freedreno@lfdr.de>; Thu, 23 Jun 2022 02:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5CC11360C;
	Thu, 23 Jun 2022 00:25:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AF71135EF
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 00:25:46 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k7so16769473plg.7
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 17:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SygWKchO0k+y7yXsZh0lg7LZ0sosds739AKDKHLdzm8=;
 b=b3st9LQI8EUcf4vRZkN9FuY8JTgqSsuawrFH9hFAlJZTkVCtFxFALeeL3f82fotnXr
 6LDOe5qKxy8Vz+vQ0mmD1l7s+y6QJmxrb/atmlIsrpBBGx6kLWqfcw1LvOF5iyJO1MCP
 c2DKMugV/35nUO1ROV12YG7FUQWLGIYSHRSiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SygWKchO0k+y7yXsZh0lg7LZ0sosds739AKDKHLdzm8=;
 b=jOWdkSSjogRjXjsQ65gujiwSivycSLtR2j+RyjcDMjx6iRcIPvwhZet3i2gqPCnvSG
 cgYlgRq323nUZwNXeCkczcB9A3xyP4yQXzy1ELy+mpn8r3+6Pjjl9QIAy/Gbr2oom6Yp
 rQobTkk/OjW1DUMI3IWC24md330sHoDoQSdwj+r0EoN4AG+dzILxiBtG0jc95Y18yaPi
 gD7qtpkK/re2pEIc9Viw1KcmSFylFFZdCsjgmyEblbmjrcXbLZnPqjlfzMnSF7YaGber
 P50coLmcC6D8FrlPXs34WRkAu3q+6pStHdObSGQkxHXunznkXw0ZBF9xomjQS3/W5Vqj
 Z01g==
X-Gm-Message-State: AJIora/agT9/cwuJ9FXx4kJ4/SznXe1UGQc1QDyQREPEakhfKXogfkQ1
 iduSZ3Hs8TJCZagMejswgNkXSw==
X-Google-Smtp-Source: AGRyM1vljkq/ZMbBKLNrU/5jd/GiIb1Avw040L4R6xvEuHNHC8lbPLZXn68o6WxIfLbKiAsrJ+bvnw==
X-Received: by 2002:a17:902:b216:b0:16a:854:e641 with SMTP id
 t22-20020a170902b21600b0016a0854e641mr29379561plr.154.1655943946136; 
 Wed, 22 Jun 2022 17:25:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f28c:6f86:743c:1c04])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903024100b00163fbb1eec5sm13332705plh.229.2022.06.22.17.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 17:25:45 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Jun 2022 17:25:40 -0700
Message-Id: <20220623002540.871994-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220623002540.871994-1-swboyd@chromium.org>
References: <20220623002540.871994-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/dp: Get rid of
 dp_ctrl_on_stream_phy_test_report()
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This API isn't really more than a couple lines now that we don't store
the pixel_rate to the struct member. Inline it into the caller.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 44 ++++++++++++--------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index feb26d4d6e97..e475f4ca078a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1564,36 +1564,15 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
+static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 {
 	int ret;
-	struct dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-
-	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
-	if (ret) {
-		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
-		return ret;
-	}
-
-	dp_ctrl_send_phy_test_pattern(ctrl);
-
-	return 0;
-}
-
-static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
-{
-	int ret = 0;
-
 	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
 		drm_dbg_dp(ctrl->drm_dev,
 			"no test pattern selected by sink\n");
-		return ret;
+		return 0;
 	}
 
 	/*
@@ -1608,12 +1587,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	}
 
 	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
-	if (!ret)
-		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
-	else
+	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
+		return ret;
+	}
 
-	return ret;
+	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_ctrl_send_phy_test_pattern(ctrl);
+
+	return 0;
 }
 
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
-- 
https://chromeos.dev

