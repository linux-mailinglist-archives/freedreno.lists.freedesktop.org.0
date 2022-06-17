Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB154FDD7
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 21:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9D110F6B0;
	Fri, 17 Jun 2022 19:49:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF1F10F8B2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 19:49:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h23so5777641ljl.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 12:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2YHUE6KuhI9LWjnIF/QY6BfPuU7y9Rs0VTr/7OX/gE=;
 b=M5ocfEAJPC8KqXFjO7CwiIVWxyw5VoVoNRrykAqwrd4PAhe+C8w/u/laJ0vYKT6OOI
 KafqzStiYgogQ/tXx2b8hEz6FAHpMJK8NqpjvfO3wn+xwaMKWyeDXjNkiuFiv8Pg+YOY
 RoJml8o5ep8AP7qaURp6YJrB+jMlpRoBLScBxIC+oj1F+jwqzUd5wIt1TsT4QiCKAlRF
 LdOcSuVQOw2tMUpSVcCxpulcycsUmhBQEGjV+s1nlgw+0yseh2iA8YUQreH0NLvTdP4m
 3g74ofAQPSHDmFTp/6MBTFGMzFyoYgHjdFg5peyZ+tMv6iXK4tZoml8Ye7cTzu5Kuqjn
 D2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2YHUE6KuhI9LWjnIF/QY6BfPuU7y9Rs0VTr/7OX/gE=;
 b=BnlXeS5OKOrcLp451tBznxT3YYmGNJhaQnljqdqcKzkm8+Oa0EIjsMtBydtWKt9BeL
 SHaJFkaz3iF/CNccyF52ZRHG6/BkADe6LfyJtf+p2zaWPmGv6Y2kLXYHfBhghH1eKOTH
 TQ/EFbAjLm4E3r3Yd2Ua7SqMjQyBvMELE5IA2aodhW92LSB391FRbnabh1/pegqs30Oc
 O6iBkGzvhbbp+WHxVFP8wXXJ1jtoNvyN96OSSC1fMDpDr4VjKPYSYWKR7eMg+SiSnnMw
 ENGJH23MhmiVmJ29QuK6iL2/mtoqc+vx08AUqXGFuzNQlq/FymYqTpK8Xf1+G2m9anOV
 t/Ig==
X-Gm-Message-State: AJIora8RwD3kEbpnipkplsaAWr1cTshGzLF97docxXvN1/tNHOmfhgw/
 BK4/3xCoRdIh+7wWcfqZzd6Cxw==
X-Google-Smtp-Source: AGRyM1uacJdHbxQIgdQiPwrEQC3qC9H//+2sgXUHvAV9/U3JBDdto1Ga4DM97s13a0kyflHyxEAyuQ==
X-Received: by 2002:a2e:b0c6:0:b0:255:7c46:16b7 with SMTP id
 g6-20020a2eb0c6000000b002557c4616b7mr5868686ljl.383.1655495363163; 
 Fri, 17 Jun 2022 12:49:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.60])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a056512328c00b0047255d211bbsm738987lfe.234.2022.06.17.12.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:49:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 17 Jun 2022 22:49:20 +0300
Message-Id: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dp: remove unused stubs
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce77935394f..1e34ac2126f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -856,11 +856,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
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
@@ -937,11 +932,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
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
@@ -1457,21 +1447,9 @@ static int dp_pm_suspend(struct device *dev)
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
@@ -1684,13 +1662,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
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
@@ -1702,7 +1673,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* manual kick off plug event to train link */
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

