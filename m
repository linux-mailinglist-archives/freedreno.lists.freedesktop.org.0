Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B48CBF8D
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 12:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542C10F4C8;
	Wed, 22 May 2024 10:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nQM0qfIH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F9310F4B5
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 10:51:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so791764e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375062; x=1716979862; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tsC/gRsvFclAEANavYSBlEUjjyUnanQ9kBr3o4SWpJA=;
 b=nQM0qfIHpjPKRTH2B8XTDi+QwtbBKuDVtanzXsDWw8aDggYHkwrj5UrHQ2bRg8RBOh
 RGa8LQXYS8sUO+QWd0mk0owMGmqJMHZ1Q3t/QIcf4hfInTY21INgn/KseeSr9HDZAUE4
 /Uloyi0g41sIrVN3hFOlfQFSUGm61QXueLB5WtDKcYk/bBljMp7LqXPZKVzhOhzrddUn
 BuftT67rnhM1k+2372AXgrUGHOKUX5yXiMK1h1DQ6s4A8gKAOFcW/oQ+3n68oqHAbdaZ
 gyVBWU44k8BkT8gbJ+FH8LAHxwjrhCgkQzhZkco8P2ogrWkr11iMoAPNeH6MpABYdLgn
 xnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375062; x=1716979862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsC/gRsvFclAEANavYSBlEUjjyUnanQ9kBr3o4SWpJA=;
 b=sKPraTrPIqtF0S5vWJbwQiQ1xXqkW4AK/dWRf9TLHoI2fRTQDmgepCHJYqi6P2kuIH
 1uke5vVoPAMbRJkklYNECUVhcqPmsy/GKhdfNlknL8dDq92SmSwFpc30mxLrdyiMQrH6
 E1ush3PyTjQRgV6kB1hRT76U6JY8Wlk+0ERqdOnW22hHc+EYhGxf9xT3YJRZJTXEy9o1
 5FkxOrJ+gCp5KPVG1zF0c6Vhuqe1D1p1xMhj2Kaj2ei0R2YOI0b0zd4HdDAQ9pDlJ8Fb
 /O91ID2m5AKNG27yB6lG/yPH2CycUXPjjJrchDLPrKxOOF3CpQ9BfrcHegPOgpppN3CE
 xk+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjXvm65UzZNm6sVsow2JVv2M3+7J22CWJJ4xZBJaF8JBATYpbp1vP/BamDY+dRkJQQOMp3lrKxxvsYz1jXnnxXpxgu1evHt/uMtmCPXK83
X-Gm-Message-State: AOJu0Yy1obb3/IYzvd5yW1L4Awm9r44kXpjNetohnGZREi6OpQ6uUUGU
 T2C0vODOEI8T/2qfR+x8ShfkuGJRl3nQny/zkqX0rPuzYzFLvTgnbByyhvzjhPs=
X-Google-Smtp-Source: AGHT+IFKBWmoLwb0ELld20WRYh6MP860S9/NAr7J2q43NCXsCE00e4g0SyRTBt1FvFJipTvpKF/64A==
X-Received: by 2002:ac2:46ca:0:b0:51c:590f:4305 with SMTP id
 2adb3069b0e04-5269b2e6679mr529373e87.8.1716375062015; 
 Wed, 22 May 2024 03:51:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:51:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:57 +0300
Subject: [PATCH v2 05/14] drm/msm/hdmi: drop clock frequency assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-5-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=K1KI+nZVasxZlSMfFS8U9hLPw6QPc6PsVGWsUOlWg9o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PVwLPggWZS7nDhhkL19OkYk1UVB6HyzzLX
 mh6kxylRy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1T3zB/9Tc0eNy+q8LiRXQPBs5tBj5FD0fCU6cAnP2CgFPzBGWPNFSlTgvY0wUYAIhkX8udzpSbe
 mhSARwL1p/kUkAYWEVinpmOOjzyfowqVQqiXtzGJgeCpzcLxg9YgdAefRuO5X4FMjOQIydeexxK
 4rFnK1ZBFuYeflTip1RBDLYsJfVb+Mt1XfJbbu7SRpyLkI8jEcESSPvtimktULPTKI2EYn3yrFE
 2u3lrsW6FWkc2GGo3v+uhClA+Q9YScQllpF2B+Z5ASitZziAnHHhXXXGZEN49f/AwmKHdT31gRc
 qJdqXDzQTGkSf7y4B0qFRGA5bslOc2ncIzYVceNhmOuRAAG7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The only clock which has frequency being set through hpd_freqs is the
"core" aka MDSS_HDMI_CLK clock. It always has the specified frequency,
so we can drop corresponding clk_set_rate() call together with the
hpd_freq infrastructure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 2 --
 drivers/gpu/drm/msm/hdmi/hdmi.h     | 1 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 9 ---------
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 681265e29aa0..c14e009f38b1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -236,12 +236,10 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index abdbe4779cf9..c0d60ed23b75 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -96,7 +96,6 @@ struct hdmi_platform_config {
 
 	/* clks that need to be on for hpd: */
 	const char **hpd_clk_names;
-	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa35417..7ae69b14e953 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -68,15 +68,6 @@ static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
 
 	if (enable) {
 		for (i = 0; i < config->hpd_clk_cnt; i++) {
-			if (config->hpd_freq && config->hpd_freq[i]) {
-				ret = clk_set_rate(hdmi->hpd_clks[i],
-						   config->hpd_freq[i]);
-				if (ret)
-					dev_warn(dev,
-						 "failed to set clk %s (%d)\n",
-						 config->hpd_clk_names[i], ret);
-			}
-
 			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
 			if (ret) {
 				DRM_DEV_ERROR(dev,

-- 
2.39.2

