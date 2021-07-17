Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C23CC369
	for <lists+freedreno@lfdr.de>; Sat, 17 Jul 2021 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEFF6EA7C;
	Sat, 17 Jul 2021 12:40:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00E26EA75
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jul 2021 12:40:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s17so7282120ljo.12
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=Th4ffsnHt9IjURUA+uuC3RwdJGkgKZaPLdGejWNpQAj+cfH3gJa1OMugKmcM2LctC+
 Km66oxxeq11JiRTjurNc6Zr0M+fEmixbNqXCGcvflQD4ZTmYXXRfNXsrdSLuOQkMl0/b
 GaS7cB9xlHJaukbHNuXM0N69E4rj9kDczZ7ygEGYXMJ1HtVsswFJBTB5MOX/0n51e5zN
 q0Ylr66lP7xwSyVPsk+talf24dz6bQegDlnhkb2BwB/XzbtJOt6tUXIg6smzzWp4fa9O
 N7hKjLxXMP/yOWojDCIg5xSoMX6c3Wl1uMb72WbpoCQKGrJt58I8u+O60BI34gKxBTcT
 r0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=YcJUSPvPQRfLEy/6InPW35o4c22agrwbRKKphPflRdnAz1ijLhlU4ghV+njYJvrXuF
 BBEGhgG175xipmvDsA5SvU0CvR5H874hZYFZ/NkaxQked9bW6zCPsTOgummgEUxnADvU
 P/s/5xHjex2oOthqW/tWBctEgVWkzerBJ1bQEvXQpkh19u1p3+IUBggs/5OgV6FsID5e
 0Sa1+s4NPTt877Y+QAkZgkYJdxPyH+e1cuGAFDvMPDpAFfmNxhxafXi23BuEuL4dYLcF
 d5H8NMtvFbaglZ3fl1HUORYs0ZsyKucaUuFgPl1Ccz3i2JvQnBHm5DCwf2VSGbTP2fEn
 gYhQ==
X-Gm-Message-State: AOAM532vI5E3SYleD/ChnriuRMZS1e9/fHeDoF/VMZy2keQjVwQVRXEf
 RlYpjMGhcncjCkUpCE2zvw6XGQ==
X-Google-Smtp-Source: ABdhPJyCGRFdKGW7hVOWYqixrZ/N2UXw0JTNWpkLFdE6MsfOK+5iTiSkNL8O0BE1dgpyCaBf6u4yew==
X-Received: by 2002:a05:651c:160e:: with SMTP id
 f14mr4677849ljq.273.1626525625205; 
 Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 17 Jul 2021 15:40:14 +0300
Message-Id: <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 5/7] drm/msm/dp: stop calling
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
