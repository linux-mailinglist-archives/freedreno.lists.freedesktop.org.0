Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58365A2DAF1
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F9F10E479;
	Sun,  9 Feb 2025 05:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vXmAC31S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED710E481
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:06 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-540215984f0so3541720e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077625; x=1739682425; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
 b=vXmAC31SL+C0PpRceIjFBlKOR6NC2UR/3K14AQQr20MyUH5PA+5iAqRqm6bDHjXwww
 oz4h0jBJH9IMJyE/0+TWnnhB+J+oO546S6R1XeaFCpfqOfvgCoo1CEvuwTepNQTwbGKo
 +Gt7LQR/6SzZOgKu7cKEx4PIhb7UjJMoER/3taQFK/8Dat8Iog4jRo42heUh9Si3dOfI
 PEGiGhoaNXbamU6BlcYs67duUHF9PI3qjxqxvf+MdV7n2b3LDWPL1QyYH4McRqrS3Ssc
 D4uWMkSpuHm5EA5JSr8Qjelz+tDgMHNzY4ViQC3U05gRxrChm/WedQ0WJ0BxIQ4mgRLo
 wGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077625; x=1739682425;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0fvdO4R1nURbqAvtpU5cS7Y2T0kdgB8Gv4vtNNxca0=;
 b=gZH1FjvLQUL00SZCoxJyqxvYlJmVAZ1P74W5L+qKQ+/hMoroJGVVtsKCNYoMRLlhTh
 zjgkFfkeIpIFbD2w+30zE/doO64AG9W9az7jZqy2hWxPQTrzAbMBR+YO1RLswk+x6rq0
 Vhnb6uA3aozyVQxpVUCIBuKk8RJDJn6XTvHNH1jo3mgccAjBQrsWLvjQAlCTAxCnt6uo
 NSuDoLlXai6q2UH2b40wxIRBJHgtIqGz542JOlps4Ldt1usF1RiK4Lnql/E4EVgcKZz2
 IYONKVEFox1xPr7uk20A8jD/jUQ+R3PSuHx7jC9y3wChsyAyqxprrCucbp4YIINsiYSG
 mePQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrexyQ8TGvP1dGl9dSJ5oN7bc4gCS+5DdZdWNcdTy1VDwbOa8PiAfR+8fPaOgvdRLYZpqVa7lJUms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHAZMHEUeNUpBWQElt/bOqv4AWthFBLvMyVgozcUlN9FleaG4B
 Z/Yf/uEkyo/3l7gbBgwKg28ubt7LhHfaV4pm4SdxGECuebOupPfrSM1As6XApH0=
X-Gm-Gg: ASbGnct9FkYYm7J8Wpmo2tshU9hHNVxTAZFzIFy+BGdve35MAYkj0IAybZt/Aqkb9nx
 FjWsGvVlQ+tsiu2/+moagfQcmX0HyHaBEtI5Wfd803joJqHfX9TmTe0ju3nuVllFO8Di+UONe9s
 CP0DtwNsHShHZnuK6GAaWvKpmONRt+Q3QZu/94VXtc7p+sX1pl+x/82YbI96NccmzTd6kwpoU2D
 Kb3NTmQCzBoHnbTuvXAcZRQS/WspsbzQ1gdNawwHZbcwXWA56txspL8HK2qs3MUC6L0tfDuTxgr
 5crcB/y3UtZ5wIpxeCMrXU4=
X-Google-Smtp-Source: AGHT+IHvHK9pE/lJ1sbvSikM6yxevJJhOW+toCBmWw7PDK+wzGYcNkAt2K57E9sTUMAV9Ze/PJqhag==
X-Received: by 2002:a05:6512:2821:b0:545:6a2:e52 with SMTP id
 2adb3069b0e04-54506a20ff4mr841140e87.13.1739077624656; 
 Sat, 08 Feb 2025 21:07:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:52 +0200
Subject: [PATCH v4 08/16] drm/msm/hdmi: switch to pm_runtime_resume_and_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-8-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8ggrOHMoONGuV72hshgJDWyRmMWrabWT+tktxkICLQM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfibvp8G2Mg6U4kntY4TDix+sHhUGkYjpmgS
 NNb+V0lzKmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34gAKCRCLPIo+Aiko
 1ZOuCACuIdGuV1z9z9UzxMNBCcGvD/1jN1gxNpsw6zo3qtvGjKRkgE29wRh+70PdHygdsSuJJND
 MQki8GKKIOtm2TMfh+6qLFk75iGLCdaFZeZxBXNCF7DXEBgAgtcHrGCRf8V59wZBCedv3aG+Fjv
 cXg7zqX6S7kZCGzN1etDHpsvbm9+otPbTE3VJ6zkIpDpBw7N1ufN+sm3I2juhcTvXxEDP1hmjxx
 o9YPIO/P3wB5ewBaRYJco7WQme9QVlQs3/YzNlYGghVOo21A0xb0tA9h+FqcQDj+rB+MVHq7t+U
 jSh9lS5oE/Md0BKq6r34Tr65Q/5WqHuA8FJ7DSqmCc1TROtB
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

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 6c5bbd772700b0362f884a737598d7bf419adf9b..d7d5d3755fb853377aa999e2a830debf54afe984 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5

