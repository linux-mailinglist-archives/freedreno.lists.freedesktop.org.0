Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB95500AD
	for <lists+freedreno@lfdr.de>; Sat, 18 Jun 2022 01:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9110E062;
	Fri, 17 Jun 2022 23:24:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982F310E062
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 23:24:37 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id d19so6168499lji.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
 b=Z+mW8n/vzz2WwQ8BmJtwxjGoBuU8ju8kzUyG9femrn7n6qDgnDFA3Z+bHo++Qi9POf
 QRc8LwhGzFscD8ICBYEvF7Ny85JNxxMsdz5/JkWnKRtRq2x3ceFvVvyifySutuNuru7J
 7HBho3f8PuULqNWNDdrTg1PAPpChWW2NVVwqvrO8MPCXTEl36y0eUDKNBUL5ar5w6S82
 u1pWLrh/2fOPhGd2BsL85yzo5WCJl4xTZvKrpO2jeRtJucFFfe+R/+86NF1/VGUVH6dj
 /h0JW1tsZk7DgT10xNcwktf8Kes5jdTMvqaGe8mYybdcD9laT4q+MkD5kyILOuV9j3Qa
 msKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
 b=29BXKs+d+8QBCDbGYvOvZ6dXNxBwRscuPMRZhKnDkkDhQTdcgTesiGwy32oXFo+Qt2
 wKI3xJJqdPes0CuJCbJx/DiUSYdDkLMHLZ+bjAaxCwBudm77p51dPAl5fJ7A7LxiKIfn
 f3eMJ22qOJyBrpfQYNHQQ1y/8NNV3uucMK2pug/sP5eb6vTdoWdbzWGImgF1/79KPgVl
 T2c5I1ggy1Nq7ZK1L5t7MrFMR5IhtetvvhqiKm0RdWw+1CatD3uT5jH97xrlUcNPw8br
 OeKH3eFt7gYhqIqKKq46GVNgpBtrt34yLXH1mxP1ftVog3hEUjva1rQleAOqFgreKN+N
 T73w==
X-Gm-Message-State: AJIora8bgE7P1l1FlWwiX3lRbTkhFVTiA+IYStu2YJ8gb8jZkq6Kz84o
 ne3z2uh1oNIK5KiLKiQJj9aL2g==
X-Google-Smtp-Source: AGRyM1v4Kt1s+lv2jMlNJEh5BGzkXvB/hPQ0IvYIrRfGYdlkZA6sSojphvexXEm4aRL63Bp96r/3MA==
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id
 z27-20020a05651c023b00b002590feecc2amr6118733ljn.400.1655508275957; 
 Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Jun 2022 02:24:32 +0300
Message-Id: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dp: remove unused stubs
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

Refactoring DP code transformed several functions into empty stubs.
Remove them.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 08e3f0b1b395..fea610793dc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -857,11 +857,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_prepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -938,11 +933,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_display_unprepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev)
 {
@@ -1458,21 +1448,9 @@ static int dp_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_prepare(struct device *dev)
-{
-	return 0;
-}
-
-static void dp_pm_complete(struct device *dev)
-{
-
-}
-
 static const struct dev_pm_ops dp_pm_ops = {
 	.suspend = dp_pm_suspend,
 	.resume =  dp_pm_resume,
-	.prepare = dp_pm_prepare,
-	.complete = dp_pm_complete,
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1686,13 +1664,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	rc = dp_display_prepare(dp);
-	if (rc) {
-		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		mutex_unlock(&dp_display->event_mutex);
-		return;
-	}
-
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF) {
@@ -1706,7 +1677,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* completed connection */
@@ -1731,7 +1701,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
-	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
 
@@ -1750,10 +1719,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display_disable(dp_display, 0);
 
-	rc = dp_display_unprepare(dp);
-	if (rc)
-		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
-
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-- 
2.35.1

