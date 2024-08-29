Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3CF964135
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6810E47F;
	Thu, 29 Aug 2024 10:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KW9tSQsm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FA510E47F
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:23 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7143ae1b48fso307146b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926763; x=1725531563; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=liJfUzuPiz+x1OeGHXt2r3UO2uLGH4OphxjUtIXOwkw=;
 b=KW9tSQsm5f3kpFxrVaBMltnzzmGkLG8DJ5UP9ocsd/ObmrHx+SI/pVWH39G7tkqmlD
 H47XaIuda0+2KD1/zLQYquAkbkSc7OAdxpnjToQvxrC+0lprMe0MjUug8xYfIQmp7k5f
 lL4t/KZUL2PYQGr773L3cF/PxeyrZW06b4dAHo8UfosGmepKrDr48pV1r9hYmisFZZ0s
 dqhC2hz8TcIIEJcyloB/quqGoqykIzXYV/CGanQLlLBwvHitHl4Dp9jsJp1d8H0ESXms
 HIpcCM82xhUcs7BmrXQmsuMLo2xE0p+SeZK4kqm7Mlaj7muAIm4JFYqT0BxPa9ZaS8NN
 4F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926763; x=1725531563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liJfUzuPiz+x1OeGHXt2r3UO2uLGH4OphxjUtIXOwkw=;
 b=MDMLm0SxiNoUVO6+FiQBKmDshVV6noAl9Q64TD+1O0pi3Hslj/jtAl5RqbR8pGp0Us
 ktenADN/eu67xfwMur6MFhWz1g7OgCcPaXpBPnBOW4xjaS/OEZ4TALFeeHb6U+mvFlhi
 Wb5r9aNL19xvwntO/mhSR/4ZeRmgpOiLzBpaIYTeEtYA8lH0bS0RkhCCfA0qn3YZH/5T
 bxH/8Wd/2H7zlDXSv8NFuK5w/jlwbzbyi+IDyMyRpNvg2qrKf//vxtET6fig1epq5u7G
 yt+Ouq8ogmEm9cowkv9/mmMT+hqQVml1gKYDg8U8ORUdAOR55t3+nAUt4r3O4LoidPJ9
 8fGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvshPfarw5ZMTJ2xla1EYhC8iXGsKZpuzta6OKLvcJXkQSBfsk4sSv4IvRWWLMl7NNAwNTsOduQrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDrmjDfUgW44wWJTVwzeOz2BCLpREuHAWtnkgyhqPo7P7qkYqn
 4KxF0RvCPRIDQ14gvY960KBIXraTwbQ9wuzGikPvlUzgvrBcRMwcn3nM3R+Z5MI=
X-Google-Smtp-Source: AGHT+IGke0/qnL9Q3/h01ae4g52cRUA7SASLy2QLx9D9YMJ6mIYmlVGHFgKC3BITCmVT1KlLNqVLHw==
X-Received: by 2002:a05:6a00:2353:b0:714:43d2:920f with SMTP id
 d2e1a72fcca58-715dfcaf7b0mr2933631b3a.25.1724926763274; 
 Thu, 29 Aug 2024 03:19:23 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:22 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:31 +0800
Subject: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2920;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=rMW8hgzOVthU1PJqs91Rp1PmU+xpXc/U2BYdfZKLbeM=;
 b=BVhNj9KJ9uzLPwA91fAXENVPKzJaDPbKBTjgRRjyoZ1PwZV7o4Nf9bk80gC9rOKGmI3lNBimQ
 VB5Hqs9eJSfA7rHTx5AIfPuju1inhjMkcjiejmjJ2LebFMUN7JbYjGH
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

For the bonded DSI case, DSC pic_width and timing calculations should use
the width of a single panel instead of the total combined width.

Bonded DSI can be used to drive a single panel having two input
channels, or to drive two panels with a input channel on every panel that
behave like single panel for display controller.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 6 +++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6c..35b90c462f637 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -79,7 +79,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode);
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6388bb12696ff..7a4d9c071be5a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2489,7 +2489,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 }
 
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode)
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_dsc_config *dsc = msm_host->dsc;
@@ -2499,6 +2500,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (is_bonded_dsi)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a210b7c9e5ca2..6e915b57e14bb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -420,7 +420,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_ERROR;
 	}
 
-	return msm_dsi_host_check_dsc(host, mode);
+	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
 }
 
 static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,

-- 
2.34.1

