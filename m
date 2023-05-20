Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155970A408
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 02:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12210E629;
	Sat, 20 May 2023 00:28:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8410E623
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 00:28:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af2db78b38so534521fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684542529; x=1687134529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3k2sxRgDw6YNokiHR0unpL0UTuKTWTAICPApPLhhiX8=;
 b=g5C/6XabcX8Mk2zB8DYpJBWnKcftAKvF7omoRiIVyUNMGjw5vUfTtIV6YrdN/0cIjO
 +FDbh3Dy6RqaMBHprE6AncuLXqjnd2PDkdtpSWDjRP4THu4XPfd6UcsfT4bRM8A6r18Y
 4Smkkump/rVKJi67t21+TaxakzvphyPiezl6bS+srQoZsz1YQFj0BL2vcOvoYP73MQCF
 dcTwj1Jg7dSEVV6SlNq0wGLizAmn2ObdvFSPO0wY1l56c7CTPrgyRsKsdYYBSbZyrNvG
 6ASgyVe85iY7kj860zjrlEr5eDpQdd08Fv2YBi1EDcRvX0vO+cHKBjaKZgZCIvw3EuOc
 vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684542529; x=1687134529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3k2sxRgDw6YNokiHR0unpL0UTuKTWTAICPApPLhhiX8=;
 b=MvX3/o0sCgXUDiO7EXzpwfFwMqjWDafg0posaC3irjNmcFqePlli45M211XoG2Ia/L
 G8i69bKk1RT/Gh+CHyHKLz6KCMvRLfzhPTSoEkB7rh69vdG93vtWHDm9XK2psQDBkuyD
 pyQAnpCA+NgVZhd0xxib9HbLe4VQnrBMiWHka/UJbWz1+lC3y5A6pNiRUmWPdnzmgAnP
 PGcv5ogzSVeY9Z8Qm3/d26eRN7fqEqvM8Di3xSQPhvnzWPwF0NdZ3qxSIlNBAfXQ8xUL
 NtSOxklfbKFNerti8ZyP1QG6hs2U7FMWRmedOVXkfCTtRPSIRqakU4Lffh05ZvnXEUAh
 gAhA==
X-Gm-Message-State: AC+VfDySecUPYCBt791lHylO1EMa54l0GYfyAI/xzYhNYZd9dtY0GUXv
 dBaKKeI5bQWgnmItL61poNAOPA==
X-Google-Smtp-Source: ACHHUZ5geOEPDHUZ6mMol1fFMxG2q7UMTTV1QjKIoaWItykgGPFlY56gEk5GQGAuqn3KUvXON3tl7A==
X-Received: by 2002:a2e:808e:0:b0:2ac:8bc1:9cb1 with SMTP id
 i14-20020a2e808e000000b002ac8bc19cb1mr1283925ljg.42.1684542529011; 
 Fri, 19 May 2023 17:28:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a2e99ce000000b0029c96178425sm60950ljj.19.2023.05.19.17.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 17:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 20 May 2023 03:28:46 +0300
Message-Id: <20230520002846.2870546-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
References: <20230520002846.2870546-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dsi: use mult_frac for pclk_bpp
 calculation
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Simplify calculatoins around pixel_clk_rate division. Replace common
pattern of doing 64-bit multiplication and then a do_div() call with
simpler mult_frac call.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2b257b459974..744f2398a6d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -585,7 +585,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
 	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
-	u64 pclk_bpp = (u64)pclk_rate * bpp;
+	unsigned long pclk_bpp;
 
 	if (lanes == 0) {
 		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
@@ -594,9 +594,9 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 
 	/* CPHY "byte_clk" is in units of 16 bits */
 	if (msm_host->cphy_mode)
-		do_div(pclk_bpp, (16 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 16 * lanes);
 	else
-		do_div(pclk_bpp, (8 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 8 * lanes);
 
 	return pclk_bpp;
 }
@@ -627,15 +627,12 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	u64 pclk_bpp;
 	unsigned int esc_mhz, esc_div;
 	unsigned long byte_mhz;
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
-	do_div(pclk_bpp, 8);
-	msm_host->src_clk_rate = pclk_bpp;
+	msm_host->src_clk_rate = mult_frac(msm_host->pixel_clk_rate, bpp, 8);
 
 	/*
 	 * esc clock is byte clock followed by a 4 bit divider,
-- 
2.39.2

