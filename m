Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C55744397
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 22:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1FC10E4F8;
	Fri, 30 Jun 2023 20:55:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED6410E4F8
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:32 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b699284ff4so37990761fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158530; x=1690750530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNVmU8HfJzAhSkmsEVuTAg9GbpLxTciOPnh3vvstVXw=;
 b=f//wGEaqZBaUvbk42MTt5ilcOlle2/2QUHaUEk1m/L98MhZWXbU6u/88C7T1pVLtSj
 6v852L+asxRXX7zt4JWLao6PzRzhe/FNqWduuUWnj2glpHZYJ9qGZL8BQbXwx3tw5ZqS
 XeMfJlkG431lDFMW+VvZQhIa+kIJVFZgpzwuxj8fwpk8mMc9OxoBqGXF73eYHkfjpiwZ
 0gVHS1VQnT2cGBvQ/2EnNaeMSxKp8cFGW5DjJs5tP949UGKYrAi2zfGhjBXimjzdUw2R
 gZhN7CjudmzgvzmQaCYqDTsJVXNrnJevhW1DHC7t6ah3uEACxtG6ExYpWw+RVVEX48NJ
 YZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158530; x=1690750530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNVmU8HfJzAhSkmsEVuTAg9GbpLxTciOPnh3vvstVXw=;
 b=MmusSAs3NZg8ar2WWrFenYbMUPGDT0iCNz7QP8r6OArVdX+/6LM92/eKumyId2HQgO
 MO2Nkq3U3C1YLp4tpP1DXVYg0cbPmLWXTWgd7dCfNlQ3+DgB1EL0R5O2AQI7IcaRl6aI
 2uZ2CubwLN95GetxVbRHMh4OVdlS2cPprcH0JRQn9iZcng9WjSu0a/Ga7uSpMD5PKH0C
 W+PN8Ah7nwk3uuzD6A82Ck8iQJ8AwFowK4F31ieAq1SY6apCiwUv8eUs+4uZnZf5uSUM
 JwqahYA7XS4LbcTqalTA8IxqCE6RVQbsBG1rvkw9FmU2DDzt/KCKSg3A5mN19BbJMuUi
 XtYg==
X-Gm-Message-State: ABy/qLZc1MMJMo02DTDPca/alvjtvlKdtthb+vUFlfpgTPOnBPz+vfWD
 aieTM+cBf0NjQGU162CeUYbjYA==
X-Google-Smtp-Source: APBJJlExHsyRDH6kMi2+38aJrM34jptdomKRUlQ6QzHz46r0gnHStPNiGOd6yd259I1hO4NsQCtOvQ==
X-Received: by 2002:a05:6512:31d6:b0:4f8:46e9:9f19 with SMTP id
 j22-20020a05651231d600b004f846e99f19mr3757977lfe.1.1688158530458; 
 Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 30 Jun 2023 23:55:16 +0300
Message-Id: <20230630205523.76823-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 08/15] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
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

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index bb10b35194ff..4aa11eabbf2a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -27,7 +27,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 3d3d72ff6a83..7de538046a52 100644
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
@@ -179,7 +184,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	uint32_t hpd_int_status = 0;
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
index 9780107e1cc9..d1f6b53c3109 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -57,7 +57,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
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
2.39.2

