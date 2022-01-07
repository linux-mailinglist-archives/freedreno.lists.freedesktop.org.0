Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F5487010
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 03:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC6310EDB5;
	Fri,  7 Jan 2022 02:01:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A29D10EDB5
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp20so10262715lfb.6
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8SfnRamYFGQOJ4PWO6EKe5+yLLAmHFD9wjpR/2Zexc=;
 b=AowHc8AE/XeQA4r/BEYswX3hjpxJFdtwVGGIyoIzVVsiaFUmboGVrfax5nWi6ww8yY
 w9WExs9JYuJdXJtohETe4rfrEWnZI/AL+w6UNNCVMxnZtHzQEZaGRJiLbQX7tKq1tqCq
 ssk2wPAnCqbRraniOL07B2u3a+o/j1AW5/RgVGS8vrcrwJUhNKQBTZEkg1Rx/WSesVUZ
 C5CsLLk8cdfqL548AJ6d9Op8ahDQYPU4BOQf3TPNJu2e65+UQZ7N2q74JGbZZyMy8KmE
 pFTQQmYCmWPmP61Tdwh/Qkhf8rn6fKNXN70Lm697D5iuhETA164I4VdR8WWVvMgg/lMa
 pC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8SfnRamYFGQOJ4PWO6EKe5+yLLAmHFD9wjpR/2Zexc=;
 b=atOv9TS7ZqVGpgUoSeT7y49yWe7GW+xDWeKGdiw63q6ld6mWWC/vn8j73254SlCpmW
 d5/zlA1CeW8eHMZADMQas3uAQUcj+JCbY3hIRFuTV/nb2ek0DvBE0O4ZKTjVLVeWQZTp
 xvNNdikn69Xqf5RUUftT6Y+VWsqr5rZreWzYMz+zA9BiYUSnGcKC+LmyCcy5j4YhPHdD
 yULbWwHqREigXQsPww8MSbpNxWWLnZUZD2ciLjxU1/Cha0pvUaJQdvexJqrd3yi+SuFb
 eYE0uMQHV4IyK6d1m8dVc9Z6MIi2ANh5+PXyjd0fkiu/Rg8zjrlBlzdaxJpEoXtiDNen
 rbbg==
X-Gm-Message-State: AOAM530T+LT4KxdMHAhT9wo0a32KTjq0jSBRtMDSI9UCVkk44uqqtoL3
 xy5RjMdbaVy1J+3HP2z0nnA1rQ==
X-Google-Smtp-Source: ABdhPJx3V2EtzcEePJMmIb8a+f6fSN6pVliCC5d+q8YJ/egr4Ol06V0QGj+JcGqUXdCQfktH4QbrXw==
X-Received: by 2002:ac2:5f55:: with SMTP id 21mr53262771lfz.283.1641520899811; 
 Thu, 06 Jan 2022 18:01:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Fri,  7 Jan 2022 05:01:30 +0300
Message-Id: <20220107020132.587811-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 5/7] drm/msm/dp: remove unused stubs
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

Refactoring DP code transformed several functions into empty stubs.
Remove them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7b4f40cb9a58..e63d6056e39d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -841,11 +841,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
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
@@ -915,11 +910,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
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
@@ -1400,21 +1390,9 @@ static int dp_pm_suspend(struct device *dev)
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
@@ -1565,13 +1543,6 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
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
 
 	if (state == ST_DISPLAY_OFF)
@@ -1583,7 +1554,6 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1611,7 +1581,6 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
-	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
 
@@ -1624,10 +1593,6 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display_disable(dp_display, 0);
 
-	rc = dp_display_unprepare(dp);
-	if (rc)
-		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
-
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-- 
2.34.1

