Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E87F3C2BD6
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 01:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A60B6EAA5;
	Fri,  9 Jul 2021 23:50:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AEE6EA99
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 23:50:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q14so556462lfp.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=PIUKaE5ue2Sn7b+1bTo40616rgAAHVpNo3GCi92/h57cImN34xz3/QdWsNYnVsBlql
 VVPQbezVXdsIioe5uUPYhmW9UTmQ+unmfXPxN+GQ+VaPJgrJydYj0GyM1Oq68EcSrpIs
 citjJBPuCUUytxCDHBVPAs1j1gz/aA6vZG//W7OUNMPZyVYqizhPHufUl7nGsGF6Zhfe
 2iGGFq3H8oX91kGDTNSO8xD6bzFHp6SjFwGAncUwGuBlpXhwMTCQL+bQ2WOjIG2pBEg3
 4QF8EA14l04luXwZ0xDvfHueAPdkGdhixL+l0hadkMVg5zb6iWLiZ5rrT8+Un1xX+Zqw
 Wm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=pjceLDNRZbcFxXKNGkx4xj9C2YqtUyIPINP0+g8D78A4L6Z07Wgc7WOQZbuX2EnjQ/
 UVbeMA/lHTVWcVn0mGyyquKANELG39SSTQYWz7FZYWW8XRgJTq+3/+nNRwfAjcvVrkEU
 86XLhb/2C48UigPbAEmVx4XLRTRwmojPnIJrHkKYsFcw1UksktTPEtuB1VoON7Yp2MLI
 MdIXT3aCTSZdSGfYEbqpbWsXfPzKKTDqLxaUHyXMV02x3EkATHu/KqdVYvQM7Cxb5jDy
 fo6xyR1v8buiVpbhWX5nc+LqVhoJQc1KWazQ10+dLtQzyEk22uRXf4M5f3IqHiQfkohw
 zA7A==
X-Gm-Message-State: AOAM531Kx6PmLvn97WPSVpHDnB03qCwpKOP+D9MretboB+/6YyJzyjTr
 xEFbo1w6WXzCu/dDK5cLnvWtsA==
X-Google-Smtp-Source: ABdhPJxMyoUwsBZ83rVWTMY8hgakNpqW7Cdx0IP8Zq5KW+sntfIMw8Y2r+2tN3dpnqR85DuTY5E3aA==
X-Received: by 2002:a05:6512:1511:: with SMTP id
 bq17mr31109194lfb.341.1625874630114; 
 Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:50:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 10 Jul 2021 02:50:22 +0300
Message-Id: <20210709235024.1077888-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 5/7] drm/msm/dp: stop calling
 set_encoder_mode callback
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
