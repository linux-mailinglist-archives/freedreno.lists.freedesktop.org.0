Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88893C3718
	for <lists+freedreno@lfdr.de>; Sun, 11 Jul 2021 00:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840B06EB73;
	Sat, 10 Jul 2021 22:20:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1036EB71
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:13 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u25so15206756ljj.11
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=fENDnaOf/UP/RMKJFYxauZAcyuS6+LC9ElBy6sBFJckE4FkoINX7w/pLhlpwRb4LoH
 XS7790rHbisHZYZ4cPkK628jgpa/blwWMmDhdysWbQfPlHl7/YMP+ESJAtaCLENjNwrJ
 Dr9YIrK5QvICN/LOqmnkhbxvYiTdRGirUbBsAtjJvY3QnQ+cGowPilRnDUQjtOma3it/
 JTeE/JLC0WsvYAgyAe44aYh7uWetQxjpzHRwxW4ig7m6/cP900djixGACrWpPId/5jys
 V3fMnGQ7vF5nmdiYsH/IVynAN8DRFh7VEAB+ZzoSWpLuCmPIgimJ0IEJaKfZ1ESTTQA/
 rV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
 b=hm5xvwHosTOYvYjuZMXF83ukVCI3MwDz5klDbqFycSjl/hN4legnRAz4UwVQK++EE0
 hP1LBWIgiTGYWCNU1RL1mQojaL+MZrmJ9lmeeNOxVV/TxWqZjI4mM0HfNkZn/aww9tFz
 4TuY5IDpKif6jQ2tJSvskyPcQRTzdybf8JvGgriZqfd+xUgVh+BgQjpzUKuupCJvyzhB
 W4SwERU/UgGym9sihAqsbJ1HoNy1I/u6NKHMG1iKGd1kI8JQq1n+xQJ9IF2wmNuqQlSr
 dwv42e86ropjoFztJVMve5KX5erliaMn2XhDNMP698CSAjjYIVzHoepSxDdhmUcc5JyY
 3iSg==
X-Gm-Message-State: AOAM533fOshU4oIA9wRG7H861+EfzpueeO7NdQexPNxmgmFyOKXZEwXg
 izM/VW0w0XpctFeSTZKvmI+B7w==
X-Google-Smtp-Source: ABdhPJz0KbTfdTPuQA7RGX6XRfCQOgs7wgEMdI9iLQdfZVyS+bMtCRlrYXKmytfRxjRqvDUwt3V3YQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr36997908ljk.58.1625955612418; 
 Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 11 Jul 2021 01:20:03 +0300
Message-Id: <20210710222005.1334734-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 5/7] drm/msm/dp: stop calling
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
