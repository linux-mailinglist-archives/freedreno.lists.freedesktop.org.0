Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB13516392
	for <lists+freedreno@lfdr.de>; Sun,  1 May 2022 12:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459B910EAFF;
	Sun,  1 May 2022 10:10:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FC510EAE4
 for <freedreno@lists.freedesktop.org>; Sun,  1 May 2022 10:10:26 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c15so15346250ljr.9
 for <freedreno@lists.freedesktop.org>; Sun, 01 May 2022 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxneJ/kncFMY8d9IcgGVsWAjH+3LCEPl2PBnSj2rnEQ=;
 b=glmx3aWJdXh3K8Id0Di5uJIgmmFrLfJXtQjdDZPjiTjEAXWHciHXfT6koZX3HcpA6X
 kPEC3Ki1Fd97kpO4Gtfh67xPoEmOokQ9pegml/+xnr76iu4GvTjwvnl4Rm1gW+HfeJ54
 dZS2RZxGDd+v5yQJOCQJP3FY48sf8NS4qMNQveeDlBeOHBP8MJ3zFXqNiUA8byiTDTmx
 lRi3Wyd9i/jTT79pYKObFvPlWpXd7l776OCU4eYLubREpowR95BVSzVQxO35JQMJjJdC
 DLz3QMx2Ig5UbdY/zL1JsFCry4Q2a2byKQlyudVyw9eGpDNLmhg8Na3ZgRkUgsmGkjcd
 hKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxneJ/kncFMY8d9IcgGVsWAjH+3LCEPl2PBnSj2rnEQ=;
 b=iOp7lxAUz9WEyx7/N8fgEaGMmXTbLXHrT2es23K052CHdEMyi3UguIp3mzfxemFT3N
 qmsjMCIHIdHOsGIFIoq+9VIYoGmUHfOR+GsiUmFGEnTXJIUltM6hEZSYQ6jaXApg8pRn
 PU1mfjSviVj7WZQUZfXTBOro0rNlAK0d1bFMbWTtrBiox1gOTTS9qZjIWRKru15PkCso
 ILNYkNshNE6lPbCBECoNTTRJCS5cKOhQuXTZyD/CHp+fk46iKq0kxRooXnuq4Wdu49eX
 NjBstjqupT81HlhpcbFquURG0tB5sxtE+ti6KfkxnV/PDpt8qZqZJo26e4mxeEQqVTBj
 qdXQ==
X-Gm-Message-State: AOAM530BbBvwfawyTzoKt3HngAcsQq/6a2uSVp88GX/KfQH+NSdnvo29
 pPxnZzQlHiS8wkt/owhFRYefWg==
X-Google-Smtp-Source: ABdhPJxodDOC4yalrske6iXXr4yKAW+Qra4VE2I3PE7jgFraxnmLe9wUdXe+3olMi8FsPw1HGfVHXQ==
X-Received: by 2002:a2e:9d46:0:b0:24c:7f1d:73cc with SMTP id
 y6-20020a2e9d46000000b0024c7f1d73ccmr5104973ljj.358.1651399824946; 
 Sun, 01 May 2022 03:10:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:10:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  1 May 2022 13:10:21 +0300
Message-Id: <20220501101022.3931295-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm/mdp5: move iommu_domain_alloc()
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

