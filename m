Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4D4ECFA5
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 00:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0110EB1F;
	Wed, 30 Mar 2022 22:30:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D50910EB32
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 5so38290646lfp.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2hk/9qDM82KvHuI4eFXE9v1so9dGAMWYy4S2wfnB8k=;
 b=kQIlmYwddD3WvCElql9vEZxabKNyckDBrjeAN9R5X5t37qlbMwCPf1tE1W8qm8JOOn
 CEU3b7dVPB2lVgEz3h3yAXeEUjNEI8HqsbSjXNEVr8qIOvxFmbTZIHa+Hc9dZi5Xq30k
 FYLP/PPH92c6K+uCApPWZuIpVvQr+o0FR/S7JmJm/6AKA6C83HdqejxJpW0NWl1PFx47
 Q3OVNU5RzsL0Rn8TXu+efgGGGSM25OWcdrOYeix/Jf0fs1zfncGb3YKGJesMTDBU1QEG
 oThsUmGv41Pobi+Zr5R7gtcf5tdGdMhyTHzsOzm+cuuJhspW0g8RoCmDBrvX0IyKlBP9
 jckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2hk/9qDM82KvHuI4eFXE9v1so9dGAMWYy4S2wfnB8k=;
 b=SFhGejfAzX9ZlQgbCo+/fvciromy8UQldUWfbOuWyQQFy6WDp3ScT758rH8m0G6/NC
 ReENHqZJWr2drjzF0UHapB5dLxvsxquB3RdyY9CQY0iz+0zEWO5RIugOMqu1f1ZqnFAN
 e2qvqG1/lUVIXNr4vbXiR2/wZXcYZ1xf4VqR+haNkySBZeLINPg9BFbzcwiw94vGFlwW
 M4XT44hro/bnN4pDjfx57xffK+q7IGsbWo6qDqFR/l82CaZbOz7k3AXRwquuKidmdith
 XrSH21eqIcjIcsRl5tr03L/amBnEHSC8gXFf/RwSACOMSoMvsXEOlLPoQ/XWEjXem4er
 PclQ==
X-Gm-Message-State: AOAM530H0WDHJhx+gxKT5DS51DGbwGNTBFQzN5G3XEggT41JHDFxBq7l
 tl0Yhg1NYtUIc4AQ4RuyZF0/zw==
X-Google-Smtp-Source: ABdhPJwUK0xnWY1kVVPKAkgbzvh7LLrv7chF8tKzWPeso0tHOSwbWmh4aPqlTjx0QAfojLjHP7VkfA==
X-Received: by 2002:a19:4f1a:0:b0:44a:22fa:704 with SMTP id
 d26-20020a194f1a000000b0044a22fa0704mr8712252lfb.59.1648679412352; 
 Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Thu, 31 Mar 2022 01:30:07 +0300
Message-Id: <20220330223008.649274-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/4] drm/msm/dp: remove max_pclk_khz field
 from dp_panel/dp_display
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the last commit, the max_pclk_khz became constant, it's set to
DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
and use DP_MAX_PIXEL_CLK_KHZ directly.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 1 -
 drivers/gpu/drm/msm/dp/dp_display.h | 2 --
 drivers/gpu/drm/msm/dp/dp_drm.c     | 4 +---
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 -
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f9c943f12d5..5e35033ba3e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -44,8 +44,6 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 	drm_mode = &debug->panel->dp_mode.drm_mode;
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
-	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
-			debug->panel->max_pclk_khz);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
 			debug->panel->link_info.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 93cdc4ebcf43..72deef8f1ecb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -370,7 +370,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
-	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
 	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6efb5c853c89..f3a9d7449a1c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,8 +24,6 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
-	u32 max_pclk_khz;
-
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index af5f1b001192..a94c9b34f397 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 
 	dp_disp = to_dp_connector(connector)->dp_display;
 
-	if ((dp_disp->max_pclk_khz <= 0) ||
-			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
-			(mode->clock > dp_disp->max_pclk_khz))
+	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_BAD;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9fa6e524832c..d861197ac1c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -49,7 +49,6 @@ struct dp_panel {
 	bool video_test;
 
 	u32 vic;
-	u32 max_pclk_khz;
 	u32 max_dp_lanes;
 
 	u32 max_bw_code;
-- 
2.35.1

