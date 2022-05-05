Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F751B47E
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 02:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FDE10F91A;
	Thu,  5 May 2022 00:16:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D1810F913
 for <freedreno@lists.freedesktop.org>; Thu,  5 May 2022 00:16:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w1so4989601lfa.4
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxneJ/kncFMY8d9IcgGVsWAjH+3LCEPl2PBnSj2rnEQ=;
 b=eSdaQXqLV5y9gYB6i+t11gIR4eGywlanMc7QwLvFdz4Whw0RgENJNvm7XMyz1N+LxK
 lGrR+3BDE2fVKRvGAbYCrk2ssYbgMbkfYXgNo4nDU7CSkmq//5KUv1jLjFd2H6y7Prbc
 X75Ng84PaU/uUqAnhPEEkL+vrCiABSKW/Zt3rAmuqwlso2iwNxKDBKoi9vxzbDqGeS3W
 IBNAzXr1rpmpDkm9T1Bn1R6qdhbJMRm4LaDBhrgMQL2GfQFTasIQ5BM9z5C4k3lWZlGO
 pTw4jZ0+8BeeJUBo4xJWJRyWBr3i6zQAIFJn1c42K4iByJTHODPFAnCtm0g28IFO2dw8
 4Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxneJ/kncFMY8d9IcgGVsWAjH+3LCEPl2PBnSj2rnEQ=;
 b=1E4GqSJHi8b5kEkvu2bctZ8osa4ylozldKFPfcUI88dCaRRwjqIVSKkH2lAz5Vw3i7
 59W+JicXX+Rm/UebXH4e2qhFK/QPs+ajwK/OR6ioVqOYGca14xjZDgZ3fTudAo5rk73h
 895fXBUQH/xawpDjg8NUxGu42m46LQMgy3MTrzDeZHozcLLmhoCNXecmIskJ2Uw8hYQu
 G2hz+HsKKynT/zsQ/r9eHm+IfjaUSuRkXG9LUn4htq0cneY7ixJOFtQonMoProPoBIVo
 cn41jYD/SRpTWWn6nQMHKVULb2tEvvNGw5KV7W6ZoOvbT3e5/X6dz1qbJ/45aEFvfcnX
 LM6Q==
X-Gm-Message-State: AOAM533qRJq8JCbCSB2tMMhmPWh2jmkv9qepNtzk1z8JyMnypTNxqj8d
 Ve1tel2bua2bflpAg4dY8X99JQ==
X-Google-Smtp-Source: ABdhPJx7i5MQisFJYgiIXBExSDUDkkoLGJnTLP8uesur7gkiXmnXwhNKj2pSdqh7mb+2kxxudamqOQ==
X-Received: by 2002:a05:6512:5ca:b0:471:f1d6:b183 with SMTP id
 o10-20020a05651205ca00b00471f1d6b183mr15934999lfo.197.1651709767908; 
 Wed, 04 May 2022 17:16:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  5 May 2022 03:16:02 +0300
Message-Id: <20220505001605.1268483-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/5] drm/msm/mdp5: move iommu_domain_alloc()
 call close to its usage
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
This allows us to drop final bits of struct mdp5_cfg_platform which
remained from the pre-DT days.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
 3 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 1bf9ff5dbabc..714effb967ff 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1248,8 +1248,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
 	{ .revision = 3, .config = { .hw = &sdm630_config } },
 };
 
-static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
-
 const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
 {
 	return cfg_handler->config.hw;
@@ -1274,10 +1272,8 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		uint32_t major, uint32_t minor)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct mdp5_cfg_handler *cfg_handler;
 	const struct mdp5_cfg_handler *cfg_handlers;
-	struct mdp5_cfg_platform *pconfig;
 	int i, ret = 0, num_handlers;
 
 	cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
@@ -1320,9 +1316,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	cfg_handler->revision = minor;
 	cfg_handler->config.hw = mdp5_cfg;
 
-	pconfig = mdp5_get_config(pdev);
-	memcpy(&cfg_handler->config.platform, pconfig, sizeof(*pconfig));
-
 	DBG("MDP5: %s hw config selected", mdp5_cfg->name);
 
 	return cfg_handler;
@@ -1333,12 +1326,3 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 
 	return ERR_PTR(ret);
 }
-
-static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
-{
-	static struct mdp5_cfg_platform config = {};
-
-	config.iommu = iommu_domain_alloc(&platform_bus_type);
-
-	return &config;
-}
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 6b03d7899309..c2502cc33864 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -104,14 +104,8 @@ struct mdp5_cfg_hw {
 	uint32_t max_clk;
 };
 
-/* platform config data (ie. from DT, or pdata) */
-struct mdp5_cfg_platform {
-	struct iommu_domain *iommu;
-};
-
 struct mdp5_cfg {
 	const struct mdp5_cfg_hw *hw;
-	struct mdp5_cfg_platform platform;
 };
 
 struct mdp5_kms;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 9b7bbc3adb97..1c67c2c828cd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -558,6 +558,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct msm_gem_address_space *aspace;
 	int irq, i, ret;
 	struct device *iommu_dev;
+	struct iommu_domain *iommu;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 
@@ -601,14 +602,15 @@ static int mdp5_kms_init(struct drm_device *dev)
 	}
 	mdelay(16);
 
-	if (config->platform.iommu) {
+	iommu = iommu_domain_alloc(&platform_bus_type);
+	if (iommu) {
 		struct msm_mmu *mmu;
 
 		iommu_dev = &pdev->dev;
 		if (!dev_iommu_fwspec_get(iommu_dev))
 			iommu_dev = iommu_dev->parent;
 
-		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
+		mmu = msm_iommu_new(iommu_dev, iommu);
 
 		aspace = msm_gem_address_space_create(mmu, "mdp5",
 			0x1000, 0x100000000 - 0x1000);
-- 
2.35.1

