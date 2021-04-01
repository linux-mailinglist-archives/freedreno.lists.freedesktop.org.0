Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EACC350C36
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 04:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B766EC07;
	Thu,  1 Apr 2021 02:05:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047956EC08
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 02:05:37 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f16so538468ljm.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 19:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=npIx+syRqPHuDl3yS1YmnkoXjeuuW+FJx46iC8knyUQ=;
 b=Rm/0hYgL3m78hKiTKo+fqDiJZmlsD1NmPQL/rT+94qQOPu4LJn6ehmPnke3KWE+m0R
 eE1XQC1FJJUd5wceDPBRQy5FFCproZJmThsYt8dalihwkjiuwu3gahyMoI5OmGclte0w
 PFJTNLDyPZj62y9/oHDk7aD/zebXV7Vx2dgtvQzqAq5253bG3IjAVEkqPTwZjtRzMplt
 AxfXQknjF8WME5PQAdLT78M40xueqB/nCXJ0Kb2LkUPqMtwF5MLzIfciDdyPgGlbrBno
 3CE/Hp16RV9ZTo6gyqF5hpp/Q9nZ9MaHrGGSt4+qN0cKwxF2S4RfRWB2vI8B1HGR+I+o
 uHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npIx+syRqPHuDl3yS1YmnkoXjeuuW+FJx46iC8knyUQ=;
 b=V+tjHgTeAF65FzPueAiC9Ki/ghQlbRbatQ6bJ+2+gdeR1yuXox9rPo+KshkxY207Pk
 0JIHi15/RQp2LB7BwIAMMExQ/I6/FhfNJDNZtfwTwGdQ1aJwNSgVHZfWYoDpRBwRuy11
 r72AuBO70RNjFhJ9QefkutqfSA6zA2t25dD2SDZpcRoVRH+2JUDC4NKZqVSDPY5Y7aQx
 spmk1OBt3+foGih/0lsAz+LOKi0jWJT9eJKKUem+Zu53iey4CzP2KgF/mjO8KSdyEMfU
 kLtTKvcm8nrAQZIk+6ip4QJzRaJdg/lxPnP3SyIxECQogF5ECG0lTExuySxu5KrQ4QFO
 U5Jw==
X-Gm-Message-State: AOAM532sJTzC43fG2y4Y0lILYaBIp5wJBsfBTh29fnWfpTCyamHLln8N
 JqRCvtsr5EzT5LjETLT8rC7gYw==
X-Google-Smtp-Source: ABdhPJw5hfDCLTS2qhpTOsvy6fS40oxMFPKf3G1U0VMNQERLGj9a8Jdxv//zD69XOXgf3UmSzMohuA==
X-Received: by 2002:a2e:958c:: with SMTP id w12mr3920089ljh.117.1617242735406; 
 Wed, 31 Mar 2021 19:05:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l4sm383635lfg.123.2021.03.31.19.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:05:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Thu,  1 Apr 2021 05:05:33 +0300
Message-Id: <20210401020533.3956787-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
References: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: always use mdp device to scale
 bandwidth
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently DPU driver scales bandwidth and core clock for sc7180 only,
while the rest of chips get static bandwidth votes. Make all chipsets
scale bandwidth and clock per composition requirements like sc7180 does.
Drop old voting path completely.

Tested on RB3 (SDM845) and RB5 (SM8250).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 51 +-----------------------
 2 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 85f2c3564c96..fb061e666faa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -933,8 +933,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
-		dpu_kms_parse_data_bus_icc_path(dpu_kms);
+	dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index cd4078807db1..3416e9617ee9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -31,40 +31,8 @@ struct dpu_mdss {
 	void __iomem *mmio;
 	struct dss_module_power mp;
 	struct dpu_irq_controller irq_controller;
-	struct icc_path *path[2];
-	u32 num_paths;
 };
 
-static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
-						struct dpu_mdss *dpu_mdss)
-{
-	struct icc_path *path0 = of_icc_get(dev->dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(dev->dev, "mdp1-mem");
-
-	if (IS_ERR_OR_NULL(path0))
-		return PTR_ERR_OR_ZERO(path0);
-
-	dpu_mdss->path[0] = path0;
-	dpu_mdss->num_paths = 1;
-
-	if (!IS_ERR_OR_NULL(path1)) {
-		dpu_mdss->path[1] = path1;
-		dpu_mdss->num_paths++;
-	}
-
-	return 0;
-}
-
-static void dpu_mdss_icc_request_bw(struct msm_mdss *mdss)
-{
-	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
-	int i;
-	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW / dpu_mdss->num_paths : 0;
-
-	for (i = 0; i < dpu_mdss->num_paths; i++)
-		icc_set_bw(dpu_mdss->path[i], avg_bw, kBps_to_icc(MAX_BW));
-}
-
 static void dpu_mdss_irq(struct irq_desc *desc)
 {
 	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
@@ -178,8 +146,6 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 	struct dss_module_power *mp = &dpu_mdss->mp;
 	int ret;
 
-	dpu_mdss_icc_request_bw(mdss);
-
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (ret) {
 		DPU_ERROR("clock enable failed, ret:%d\n", ret);
@@ -213,15 +179,12 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
-	int ret, i;
+	int ret;
 
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (ret)
 		DPU_ERROR("clock disable failed, ret:%d\n", ret);
 
-	for (i = 0; i < dpu_mdss->num_paths; i++)
-		icc_set_bw(dpu_mdss->path[i], 0, 0);
-
 	return ret;
 }
 
@@ -232,7 +195,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
 	int irq;
-	int i;
 
 	pm_runtime_suspend(dev->dev);
 	pm_runtime_disable(dev->dev);
@@ -242,9 +204,6 @@ static void dpu_mdss_destroy(struct drm_device *dev)
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 	devm_kfree(&pdev->dev, mp->clk_config);
 
-	for (i = 0; i < dpu_mdss->num_paths; i++)
-		icc_put(dpu_mdss->path[i]);
-
 	if (dpu_mdss->mmio)
 		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
 	dpu_mdss->mmio = NULL;
@@ -276,12 +235,6 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
-		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
-		if (ret)
-			return ret;
-	}
-
 	mp = &dpu_mdss->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
@@ -307,8 +260,6 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	pm_runtime_enable(dev->dev);
 
-	dpu_mdss_icc_request_bw(priv->mdss);
-
 	return ret;
 
 irq_error:
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
