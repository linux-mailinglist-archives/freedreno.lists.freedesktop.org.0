Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E918487A00B
	for <lists+freedreno@lfdr.de>; Wed, 13 Mar 2024 01:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041E010F3E3;
	Wed, 13 Mar 2024 00:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cugvaTIN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F6610F3FE
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 00:14:01 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1dd84ecfc47so23212495ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710288841; x=1710893641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
 b=cugvaTINPGIwBJhDe28xZ/SB1K2MmdUQMYAjoGg6Hkm4aNndR01AN2hpQTtPaTOlc9
 Oab5Io6nx1ErTP20oNUS3IxuVng7ftm6bYtJoHe+/mVGLzx5r0kVq28XIdL3jISFkRXR
 RWXx1+ubbFbfJt1pCVDclz04FhtgmE/XtbO2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710288841; x=1710893641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zguE7sLhSNq0icr0rFs1uvOVo5Tuv7IbCk7xIUt0MUw=;
 b=lX4A9Y+oC0H++U3n0du0RIal8jBmu0R48uho7b0cxL6zEUUjdI24bt5tohkwItOqP9
 K7Ypl3Ga45eeD6SqIdnovYCtnxpTETL/zMUJQFcT9LTlV3GEYPPwDIEBP3PCbRXbt7vP
 /jww15q9yIHkdG3s5OSb81ifwbLluoUvmP9vKGcaBE16oijbL3Ix31KjJs61luvVLqOv
 UP8upqr4uYqTA89Rt4zZFoNXtYTtLk7zXCJxhyTF4p9hGIV48g6PCRP5KI00HjZg3aJz
 AyJImSBwu4wblt44JfDIQizzieGAW3gH2waidbeSt9ac8JNhwPgZOGCQb/HjLwMaCbJu
 wWZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUHaxb+UfqUTXa1QHmXmsO6Ji1dxcOp+06l3AsVQihAV3ijMDr9A81NXE8I0KE3ySNUhW8ps+Oyx+aDpBzbL0DUCuVyTnq1T27gyphH7Lq
X-Gm-Message-State: AOJu0Yyq7iCBVn2xdznu+VqfeuRubZZGiO4Y/j6xY9cWsalLxz9VsqkU
 RqtQsnt92OI+qrtnfF7J4dJWc8Cpyu9K3aZmf68GsWiVn0H+k69SXBgSUON1Eg==
X-Google-Smtp-Source: AGHT+IHleWIOjQ8m91s+SNRjR+JOLwIAr+kNSjLzS6dHYmUmGlbhttPA/0GuKKQLT1S7h93MHLmwng==
X-Received: by 2002:a17:903:258b:b0:1dc:728d:b1de with SMTP id
 jb11-20020a170903258b00b001dc728db1demr2427447plb.56.1710288841166; 
 Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f8dd:895c:e876:6edb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sean Paul <sean@poorly.run>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dp: Account for the timeout in
 wait_hpd_asserted() callback
Date: Tue, 12 Mar 2024 17:13:17 -0700
Message-ID: <20240312171305.2.I7758d18a1773821fa39c034b16a12ef3f18a51ee@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DP wait_hpd_asserted() callback is passed a timeout which
indicates how long we should wait for HPD. This timeout was being
ignored in the MSM DP implementation and instead a hardcoded 500 ms
timeout was used. Fix it to use the proper timeout.

As part of this we move the hardcoded 500 ms number into the AUX
transfer function, which isn't given a timeout. The wait in the AUX
transfer function will be removed in a future commit.

Fixes: e2969ee30252 ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c     | 5 +++--
 drivers/gpu/drm/msm/dp/dp_catalog.c | 7 ++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h | 3 ++-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index de0b0eabced9..fc398e8a69a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -311,7 +311,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	 * directly.
 	 */
 	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
+								500000);
 		if (ret) {
 			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
 			goto exit;
@@ -516,7 +517,7 @@ static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
 
 	pm_runtime_get_sync(aux->dev);
-	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 93e2d413a1e7..b45cf3174aa0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -253,17 +253,18 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
 	phy_calibrate(phy);
 }
 
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us)
 {
 	u32 state;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
 	return readl_poll_timeout(catalog->io->dp_controller.aux.base +
 				REG_DP_DP_HPD_INT_STATUS,
 				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				2000, 500000);
+				min(wait_us, 2000), wait_us);
 }
 
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1694040c530f..4248c8de5cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -85,7 +85,8 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
-int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog,
+					      unsigned long wait_us);
 bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
-- 
2.44.0.278.ge034bb2e1d-goog

