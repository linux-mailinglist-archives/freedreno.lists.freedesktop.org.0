Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC84B987E
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 06:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5D610E870;
	Thu, 17 Feb 2022 05:55:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4C210E85B
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 05:55:35 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id o2so7990427lfd.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0DZbp8PZA2Hm9ArvzoKEBKLEPaOFDN+9+4a3cjKKI8=;
 b=udkrGNDPEl8IW134f7dAxnb/fPWZDeweL4lMY17BiDsVpNj7UUHs6NGHABkZsRHFXf
 aPaaPrYD9rhSEhDq1ZIw95qGvQkZsf1Utm9mY7rlYk399hMGkqYHUqiGCCBevsP7ck1V
 JtVjsYa7faXIZwYNEXw3/sMmXt8DbaLOxo/m0cm7Vx8L245jtp3XhFa6TRPFHgsi/C5z
 BUfwyQNP/gpzu/tZoJO2LKF7pKZGFKtYjcqMJor6B+QuJWhh9I/6JRE53ZDcDnuxeUlQ
 J3LHX4Ko6gVIcNW6lmLApnh4eZ9Vyd/vL3ZmE+ir2lC0WTIDO71KCXzEWO9w8J9DREGj
 0dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0DZbp8PZA2Hm9ArvzoKEBKLEPaOFDN+9+4a3cjKKI8=;
 b=boN7GSqYev3EGbIJvE2laTjxOrS/LJbOnrKEuiuFy8Y122HqQpFTNLy0bzySggejKF
 iagQMO17pJXlvabOHyYu2hYH2waR4XB3E6e0z3/f3aKcdJHikkrcrUYs5uRNmBfg4A2H
 OrkJIGHyb0cEYS86z7ioz68p2MUvmHZhUkFQFMEK6qZwT6SBwXCpnXa+L+TXwA3dH/As
 m1m8IeYBgrDcAU9BodJw8UhmZo2oDkRtuF7ztnri/SHpEztStPIfC8G6WzoFz02c1HT8
 e7ZSq0bvcyNSoZTIBQXaJPBryUrYVZAgr/sXVAu422oqNookjc9jmOc5R8jx3ALQILzZ
 qzww==
X-Gm-Message-State: AOAM533TXIAjl9ddb2wMUKvWqsVqwT4Mu/q4KFgKLNpXW9qib5px9tYS
 wEXRDAkVI+1VKTPmISOKRQkwmQ==
X-Google-Smtp-Source: ABdhPJzcBWgmm2v8ZNAuqPxFZ+pAtkxid8beS6A4xbuAGU1Ar8ec3TNJnZBun5FHOvoXpLoZr3nliQ==
X-Received: by 2002:ac2:43cb:0:b0:443:3c50:eca0 with SMTP id
 u11-20020ac243cb000000b004433c50eca0mr1024363lfl.655.1645077333686; 
 Wed, 16 Feb 2022 21:55:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 21:55:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 08:55:27 +0300
Message-Id: <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate
 directly
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

The only clock for which we set the rate is the "stream_pixel". Rather
than storing the rate and then setting it by looping over all the
clocks, set the clock rate directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_clk_util.c | 33 ----------------------------
 drivers/gpu/drm/msm/dp/dp_clk_util.h |  9 --------
 drivers/gpu/drm/msm/dp/dp_ctrl.c     |  2 +-
 drivers/gpu/drm/msm/dp/dp_parser.c   |  7 ------
 drivers/gpu/drm/msm/dp/dp_power.c    | 10 ---------
 5 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
index 44a4fc59ff31..85abed31c68b 100644
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.c
+++ b/drivers/gpu/drm/msm/dp/dp_clk_util.c
@@ -51,39 +51,6 @@ int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk)
 	return rc;
 }
 
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk)
-{
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
-			if (clk_arry[i].type != DSS_CLK_AHB) {
-				DEV_DBG("%pS->%s: '%s' rate %ld\n",
-					__builtin_return_address(0), __func__,
-					clk_arry[i].clk_name,
-					clk_arry[i].rate);
-				rc = clk_set_rate(clk_arry[i].clk,
-					clk_arry[i].rate);
-				if (rc) {
-					DEV_ERR("%pS->%s: %s failed. rc=%d\n",
-						__builtin_return_address(0),
-						__func__,
-						clk_arry[i].clk_name, rc);
-					break;
-				}
-			}
-		} else {
-			DEV_ERR("%pS->%s: '%s' is not available\n",
-				__builtin_return_address(0), __func__,
-				clk_arry[i].clk_name);
-			rc = -EPERM;
-			break;
-		}
-	}
-
-	return rc;
-}
-
 int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
 {
 	int i, rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
index 067bf87f3d97..c3d59b5017a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_clk_util.h
+++ b/drivers/gpu/drm/msm/dp/dp_clk_util.h
@@ -13,17 +13,9 @@
 #define DEV_WARN(fmt, args...)  pr_warn(fmt, ##args)
 #define DEV_ERR(fmt, args...)   pr_err(fmt, ##args)
 
-enum dss_clk_type {
-	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
-	DSS_CLK_PCLK,
-};
-
 struct dss_clk {
 	struct clk *clk; /* clk handle */
 	char clk_name[32];
-	enum dss_clk_type type;
-	unsigned long rate;
-	unsigned long max_rate;
 };
 
 struct dss_module_power {
@@ -33,6 +25,5 @@ struct dss_module_power {
 
 int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
 void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
-int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
 int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
 #endif /* __DP_CLK_UTIL_H__ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 07f6bf7e1acb..8e6361dedd77 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
 	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
 
 	if (num)
-		cfg->rate = rate;
+		clk_set_rate(cfg->clk, rate);
 	else
 		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
 				name, rate);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index a7acc23f742b..4f2d80bc0671 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -237,14 +237,12 @@ static int dp_parser_clock(struct dp_parser *parser)
 			struct dss_clk *clk =
 				&core_power->clk_config[core_clk_index];
 			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
-			clk->type = DSS_CLK_AHB;
 			core_clk_index++;
 		} else if (dp_parser_check_prefix("stream", clk_name) &&
 				stream_clk_index < stream_clk_count) {
 			struct dss_clk *clk =
 				&stream_power->clk_config[stream_clk_index];
 			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
-			clk->type = DSS_CLK_PCLK;
 			stream_clk_index++;
 		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
 			   ctrl_clk_index < ctrl_clk_count) {
@@ -252,11 +250,6 @@ static int dp_parser_clock(struct dp_parser *parser)
 				&ctrl_power->clk_config[ctrl_clk_index];
 			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
 			ctrl_clk_index++;
-			if (dp_parser_check_prefix("ctrl_link", clk_name) ||
-			    dp_parser_check_prefix("stream_pixel", clk_name))
-				clk->type = DSS_CLK_PCLK;
-			else
-				clk->type = DSS_CLK_AHB;
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 893a57dd97d9..6920d787e7aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -156,16 +156,6 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
 	int rc = 0;
 	struct dss_module_power *mp = &power->parser->mp[module];
 
-	if (module != DP_CTRL_PM) {
-		if (enable) {
-			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
-			if (rc) {
-				DRM_ERROR("failed to set clks rate\n");
-				return rc;
-			}
-		}
-	}
-
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
 	if (rc) {
 		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
-- 
2.34.1

