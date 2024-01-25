Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CE83D042
	for <lists+freedreno@lfdr.de>; Fri, 26 Jan 2024 00:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DB010E3BD;
	Thu, 25 Jan 2024 23:03:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9781610EBBE
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:40 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2cddb0ee311so80141701fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223759; x=1706828559; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
 b=w3cSJSJiMPEUq4aI/uYwVOJFMJQxow1YM5Y5X6M448SOfJITGpXMIr1TQylZ52wDjY
 1WIgvyX3oaM4ktULmf7E/utfSWnecWyDJwIfTPPAoftbgU+J/1zEgBb1IbVCWL7DH0+k
 8PNZlVAfrR+S3XvqoxWSdojgJYfJRdQP6ps8HUTCtnlZPUs7MMCKyoRxtzqPhvYlSsf9
 p7hxO8svfUeTfAbasUCgnDHvq3OJiJztWuQCrykc2MGzrlyJI/kSiAdGXF/rfZ/uZ9u1
 qX5nlXawaNUbvPU1ot5ck8vM8Q7nY926Z297wbUrw6C0D1jxVtBs3YdtC3QmQ8oD6CU+
 qHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223759; x=1706828559;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W/0vQlu3/zRSTNUc/QWsRNBkw7wsjD404h/u9X2qZl0=;
 b=aO+1XeqyBgJSz2Ql0qAXoSP5mFWDk2VEWhS1TBYYz1jCzeUrGaznP8lD2qgUypXM0S
 3eosseItq+pL/TM/GzkWA6qI7Qfd+PqEeJvoUHrA9RT979KT4o4rPVmymxX1ns9wsMyG
 cmFTzSSPCtGO4hiHTk5q+6h9KjwpRdW4cHUsNDP0waCp39UxrRoF/HYviSrRwU5Bndbi
 9E2hkqDiJAmbaEjN4Jt10AoCSE+iizT1d9zrF6zPl/AQAw3ypK1F1UzU08uK12T3WQvj
 xRpCv+YPWdM3kk7nIlCFLCdbiaynq71CIfGCCs8l4ZVszYC/Ei/451QLDJf5un4EjlvD
 p1jg==
X-Gm-Message-State: AOJu0YwiNHnYhyiqsimna2Qh6z/9Bl34F/WtHQTTRgk6zB+tGuZ3JMhi
 Sa9nK21zRWsNgeeQ5GDjcZiDsISkYN17DsJj+Icwh8DfVVocHXiebsWgp4OoLQIbXfczyUhK3rw
 4
X-Google-Smtp-Source: AGHT+IFmCQ6i0uDhhnc3xOqmapw5U3T/E35MDEyJJumvsB02zEf5PIaMLIeoJt6Zw/EgDqXrw1dDnQ==
X-Received: by 2002:a2e:b5a5:0:b0:2cf:1a77:5c35 with SMTP id
 f5-20020a2eb5a5000000b002cf1a775c35mr106688ljn.31.1706223758555; 
 Thu, 25 Jan 2024 15:02:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:33 +0200
Subject: [PATCH v3 04/15] drm/msm/dp: inline dp_power_(de)init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-4-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0tPYPq9OqCyaK2qdciiqePf9VS3u8McIRcRAIy4vqEY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiHWgQXViiZRP5edLDuCxm4LY7Y510OLaPpc
 IjoFJXqsyiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohwAKCRCLPIo+Aiko
 1Qb3B/wOvG7lg14CAtpdP5XCkVtmS67SC6E7qtPuE0617cLjLFsQ/HqieG41K/6zPumu8Tzo8u9
 ARLbFw8Iwhu/VgzKPlbwecrK5bXJimAqKtdDvsPU1tHP0moOSZGV6wRLd+MuFrQPrduloIvddX6
 purGO5/g1r0iHPUa6Jn6s/27Tj8i73cigP2xfpX7BAXQ5Wv6sVkqf7MpnAxko3pXDuR+/MadYOk
 EBqheMuv74hhrYNyCwNPn9zKKVjgsv6cF9kfaVBeHS1Js/RQDWP00r4kFGp638cUU5UEYkqyD/k
 v174iUYgnVAkTa3HPXiRRXTFDSsBgCgq6HU7JqjPfv7f32JL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation to cleanup of the dp_power module, inline dp_power_init()
and dp_power_deinit() functions, which are now just turning the clocks
on and off.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_power.c   | 10 ----------
 drivers/gpu/drm/msm/dp/dp_power.h   | 21 ---------------------
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 67b48f0a6c83..8cd18705740f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -434,7 +434,7 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_init(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, true);
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -448,7 +448,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 
 	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
+	dp_power_clk_enable(dp->power, DP_CORE_PM, false);
 	dp->core_initialized = false;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index b095a5b47c8b..f49e3aede308 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -152,16 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
 	return dp_power_clk_init(power);
 }
 
-int dp_power_init(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, true);
-}
-
-int dp_power_deinit(struct dp_power *dp_power)
-{
-	return dp_power_clk_enable(dp_power, DP_CORE_PM, false);
-}
-
 struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
 {
 	struct dp_power_private *power;
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 55ada51edb57..eb836b5aa24a 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -22,27 +22,6 @@ struct dp_power {
 	bool stream_clks_on;
 };
 
-/**
- * dp_power_init() - enable power supplies for display controller
- *
- * @power: instance of power module
- * return: 0 if success or error if failure.
- *
- * This API will turn on the regulators and configures gpio's
- * aux/hpd.
- */
-int dp_power_init(struct dp_power *power);
-
-/**
- * dp_power_deinit() - turn off regulators and gpios.
- *
- * @power: instance of power module
- * return: 0 for success
- *
- * This API turns off power and regulators.
- */
-int dp_power_deinit(struct dp_power *power);
-
 /**
  * dp_power_clk_status() - display controller clocks status
  *

-- 
2.39.2

