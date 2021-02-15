Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E939431BE95
	for <lists+freedreno@lfdr.de>; Mon, 15 Feb 2021 17:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7626E8DE;
	Mon, 15 Feb 2021 16:16:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8CF6E8E1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Feb 2021 16:16:43 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id x14so6847579qkm.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Feb 2021 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
 b=tl4w+PPzBhdOn4ABfS5co/4PLj5I7a39ayMvxYtyAKY29aSkATAGmUnCbFEyoN+d9c
 BbInmUFjXKrcg8WajAeEK/RDzoiwQnW00blY6ZN+WVWgBNkZ6wJCdn6V3b4iqXal2ZzW
 VxF5HhjdhqCATOi4TxcO8Kpuq0TzaUfefL/vrTM5qBgdBnkmXCRJjiMRIzggxgcOis2P
 BRFYEfwKBY46LJXlVevZx8cN7MEJ5/UX+EoNTa5rugqGNPO3Rxthn1kXLPfXHsHqVnMb
 eSC7wO/b1sxjBMcjzNnkRxEzbKSOchDfWZuCUBX3/FBct5k7+iqKY67kHTDtcBIc9IMF
 /bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFjJmq0Au97vKEfgrOVE/VaVkFx8gpBh2nvbd9qF3qo=;
 b=VJ9UTNdpQMEqM9FVzJz4r4EiFXsRxM0R0Xku+eRGKe4DBQ7viuFJb0oH5YMqSDB5Wv
 9tMQfsTYGIWtmswOvOgQfB3jtdeZUMWcDvzXT8WNUeMwBpZQ9hgmdr5NYRioAUjgtivo
 VybE/engusVqQZvB3BO/NEzM521S4Yo/+veDjOVJYb1DHb0kAHaAKo1x5vAu8uP+gr45
 L864Hi/X+8SiD+dc8kBN3avJn9Ibo1oPsh4zYO3+iR40IIbSjiY13nWCuJmRkTwszSDB
 48t1Y3/vavmiDMvpVPxs/goOWzpnnC7KxVBFQ3FKbbVCKRfWeCWD8SEIpSCLeHae8iRI
 hB/Q==
X-Gm-Message-State: AOAM531l91WsCjQMsInuL+ZP4faWdA1jKFaqE4Z/uxcbvS1QpMWY5y2a
 MlMeeyrGvF7YmmuMnSGKA5BDIg==
X-Google-Smtp-Source: ABdhPJxyETNNT3979AkpXipAech5eZPrp9lur8P4ZhLUWsa6ZiqwiqWuwCh6/NsbKt1UY3V4t38Kvg==
X-Received: by 2002:a05:620a:227:: with SMTP id
 u7mr15801746qkm.226.1613405802624; 
 Mon, 15 Feb 2021 08:16:42 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id j124sm12225227qkf.113.2021.02.15.08.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 08:16:42 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Date: Mon, 15 Feb 2021 11:15:33 -0500
Message-Id: <20210215161537.14696-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210215161537.14696-1-jonathan@marek.ca>
References: <20210215161537.14696-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 1/2] drm/msm: add compatibles for
 sm8150/sm8250 display
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 tongtiangen <tongtiangen@huawei.com>, Qinglang Miao <miaoqinglang@huawei.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The driver already has support for sm8150/sm8250, but the compatibles were
never added.

Also inverse the non-mdp4 condition in add_display_components() to avoid
having to check every new compatible in the condition.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
 drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..5763f43200a0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
 
 MDSS:
 Required properties:
-- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
+- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
 - reg: physical base address and length of contoller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
@@ -41,7 +41,7 @@ Optional properties:
 
 MDP:
 Required properties:
-- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
+- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
 - reg: physical base address and length of controller's registers.
 - reg-names : register region names. The following region is required:
   * "mdp"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5a8e3e1fc48c..fff12a4c8bfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
+	{ .compatible = "qcom,sm8150-dpu", },
+	{ .compatible = "qcom,sm8250-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 94525ac76d4e..928f13d4bfbc 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
 	 * Populate the children devices, find the MDP5/DPU node, and then add
 	 * the interfaces to our components list.
 	 */
-	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
