Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCB1E19DA
	for <lists+freedreno@lfdr.de>; Tue, 26 May 2020 05:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A9589BF8;
	Tue, 26 May 2020 03:23:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9644689C17
 for <freedreno@lists.freedesktop.org>; Tue, 26 May 2020 03:23:05 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id v15so8854579qvr.8
 for <freedreno@lists.freedesktop.org>; Mon, 25 May 2020 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=iAcLYGImXt7qU+Oj1+OrSH57RdqT0EzL8qM0lMEU0Fw9Z2OuBXZsRENIkFPa7zKuqd
 dhDJFAVOXSO/u5g85UjqfVfA38EJhysYo/k2Jr5sCg8MhlaWXp/jT9hvrWbxNg+Khr9f
 ZbuugSxq4Z+4ysN6DfC4lnb1zQw+Xy3nHU23FKOHHJCxGI/yDixXer5//HYetBpzSuta
 gRmqtXHWrkK5sPPWQyRLYjgTRomva9uRYh392t/3EjtehTLwNzgmLnymLpbUlYAYrhhi
 0I/egqEEolBC8qVZcKTW8GZqcSVbLwwvrJDN7/kBlW4R8tPYALp3l7vrcmzI+PyvDhWx
 A10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=Mv06X7ybwkoa04Wu6oGRnOXhr1O/knp3W4VRr1qRoZNvOnPUSBvj0gUHxeA6ZI9/tH
 ZJAHmBPU842VHuFxI42x0bCMB95BQZYGAlNVVb4IBoBRhwM5fj2RCr9actefOOWoitcc
 YHSnq+YVHh1UxFCrnXX8BIj4nM6arSrkib5BcnniOzIJ1NJHfXnYDGBF3YwQbJpWnPzx
 qf9YP20qeOJ10amuZMORmlq3p0h9HYEUXs8ZRDJ5uCsJ1R5e/1V+WDiNufxe4REM9M6E
 3WAxdbLynTtc7kSX1u+tgnvZpaHctkmX6D7uWkypKIJEvhEBDmucWmiZe/K9yWJegmkL
 ptAg==
X-Gm-Message-State: AOAM530E355cmDiKzJrYFUj6SNxai4nqP0YWZbiXTFal48DW5jU4so5N
 aClS8zSemzlhz2Qg6Op3iQcAkdurPMb1Ew==
X-Google-Smtp-Source: ABdhPJzRkywAd6OOmXgCnPe/1+ksB8fOOWAWM2ed8Hl4/LLIF4lXfUb2uE2H7ftcxkzujzi2+9sbxg==
X-Received: by 2002:a0c:fe88:: with SMTP id d8mr17702304qvs.208.1590463384541; 
 Mon, 25 May 2020 20:23:04 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:23:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 25 May 2020 23:22:13 -0400
Message-Id: <20200526032235.21930-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 6/8] drm/msm/dpu: intf timing path for
 displayport
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Calculate the correct timings for displayport, from downstream driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 64f556d693dd..6f0f54588124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -107,11 +107,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
 	p->hsync_skew - 1;
 
-	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
-		display_v_start += p->hsync_pulse_width + p->h_back_porch;
-		display_v_end -= p->h_front_porch;
-	}
-
 	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
 	hsync_end_x = hsync_period - p->h_front_porch - 1;
 
@@ -144,10 +139,25 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
+	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
+		active_h_start = hsync_start_x;
+		active_h_end = active_h_start + p->xres - 1;
+		active_v_start = display_v_start;
+		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
+
+		display_v_start += p->hsync_pulse_width + p->h_back_porch;
+
+		active_hctl = (active_h_end << 16) | active_h_start;
+		display_hctl = active_hctl;
+	}
+
 	den_polarity = 0;
 	if (ctx->cap->type == INTF_HDMI) {
 		hsync_polarity = p->yres >= 720 ? 0 : 1;
 		vsync_polarity = p->yres >= 720 ? 0 : 1;
+	} else if (ctx->cap->type == INTF_DP) {
+		hsync_polarity = p->hsync_polarity;
+		vsync_polarity = p->vsync_polarity;
 	} else {
 		hsync_polarity = 0;
 		vsync_polarity = 0;
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
