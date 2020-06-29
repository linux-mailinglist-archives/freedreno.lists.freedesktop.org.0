Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489F320D08E
	for <lists+freedreno@lfdr.de>; Mon, 29 Jun 2020 20:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E384A89F19;
	Mon, 29 Jun 2020 18:19:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2A189E39
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 18:19:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 67so4171641pfg.5
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NcQmzB/12sdIDSUANv/DWZPIgxSIz4p962Qo3Ee9Xk=;
 b=LMYg4oGGKEaTmenbEsK0CIKVFhkJl9YAlVxpJdly4EOkbl0HBYt/5Ha3Srnig1UBoT
 h/qtDvpv74MmjMgwV/9506Og5qSGCJS4PBTr6dfpCvg0SAypsOTCJWlbnS2WI3W6lbGg
 Axn0byRolbnuj2z0dG5vUAetEKbHsjSf+tgr2Kp3+KAWsPh4O8Kcop2ltFxfxWHz8xAW
 8XwtIByCbeYbP9ZsKlGCD+/kFf5aZJQfNPO36x2f739Z+hm41rea47av0faYwnP1THe+
 oug4dfKuvUmE7TkKBumQDViI1es4IbdlihRotJdDQ43nRGgnfWdJ2prNvsLJ7P8nVnnL
 fmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/NcQmzB/12sdIDSUANv/DWZPIgxSIz4p962Qo3Ee9Xk=;
 b=W1297VmRWxo5nHyhSPXXSwPlWIeJmOGiGiwM503j+O+urnJ0pbfo1FDAcNr9lIlgS7
 /Ukuz2v+HLula4zPOyWAStp1vFsbkR6MzZSHLpu9p8Ci3Ggl6GFB9bnF0786xVr0+6Zi
 81ZWXM9+plgIBS0cokqtDge2aMZFXhPIezmTs6O57ffiIhR+p17K6S+hY0qGwkrYyemo
 5AspZAWnBNv1j3PlJlv33iKwF8ytq6SWGC+7yRNLUfVbG6QiR6+rIOPtASBR/oi3/1RY
 oylxGqtTsawC9jbv8YcUAzGbEWYbPXImBwrBwBrcLmSXcIlg08THhp/3mAR3agoVqFDe
 DPnw==
X-Gm-Message-State: AOAM531N3zhBKT5Bt1tDMZ91F/PMQ9Sgi5AYTPOgtTJ35F8uzHpQV5Ya
 OFMVFx6qyAA2BCoFpEQCS2M+Kg==
X-Google-Smtp-Source: ABdhPJydZmEj+KGJUb2VhyoF11wEycqqrieadtqlO/4guD0EeDtJASVLB7TAqDKHTzBvaC/X7SqBAw==
X-Received: by 2002:aa7:91d4:: with SMTP id z20mr14642359pfa.153.1593454765199; 
 Mon, 29 Jun 2020 11:19:25 -0700 (PDT)
Received: from miranda.anholt.net ([97.115.155.172])
 by smtp.gmail.com with ESMTPSA id a9sm359463pfr.103.2020.06.29.11.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 11:19:24 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>
Date: Mon, 29 Jun 2020 11:19:20 -0700
Message-Id: <20200629181921.3019271-1-eric@anholt.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/2] drm/msm: Garbage collect unused resource
 _len fields.
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
Cc: Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Nothing was using the lengths of these ioremaps.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 21 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c |  9 ---------
 3 files changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 680527e28d09..a4ab802fee6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -45,20 +45,6 @@
 static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
-static unsigned long dpu_iomap_size(struct platform_device *pdev,
-				    const char *name)
-{
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
-	if (!res) {
-		DRM_ERROR("failed to get memory resource: %s\n", name);
-		return 0;
-	}
-
-	return resource_size(res);
-}
-
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_danger_signal_status(struct seq_file *s,
 		bool danger_status)
@@ -844,7 +830,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto error;
 	}
 	DRM_DEBUG("mapped dpu address space @%pK\n", dpu_kms->mmio);
-	dpu_kms->mmio_len = dpu_iomap_size(dpu_kms->pdev, "mdp");
 
 	dpu_kms->vbif[VBIF_RT] = msm_ioremap(dpu_kms->pdev, "vbif", "vbif");
 	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
@@ -853,22 +838,16 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->vbif[VBIF_RT] = NULL;
 		goto error;
 	}
-	dpu_kms->vbif_len[VBIF_RT] = dpu_iomap_size(dpu_kms->pdev, "vbif");
 	dpu_kms->vbif[VBIF_NRT] = msm_ioremap(dpu_kms->pdev, "vbif_nrt", "vbif_nrt");
 	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
 		dpu_kms->vbif[VBIF_NRT] = NULL;
 		DPU_DEBUG("VBIF NRT is not defined");
-	} else {
-		dpu_kms->vbif_len[VBIF_NRT] = dpu_iomap_size(dpu_kms->pdev,
-							     "vbif_nrt");
 	}
 
 	dpu_kms->reg_dma = msm_ioremap(dpu_kms->pdev, "regdma", "regdma");
 	if (IS_ERR(dpu_kms->reg_dma)) {
 		dpu_kms->reg_dma = NULL;
 		DPU_DEBUG("REG_DMA is not defined");
-	} else {
-		dpu_kms->reg_dma_len = dpu_iomap_size(dpu_kms->pdev, "regdma");
 	}
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 4e32d040f1e6..13034cdb8665 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -100,7 +100,6 @@ struct dpu_kms {
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
-	unsigned long mmio_len, vbif_len[VBIF_MAX], reg_dma_len;
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 80d3cfc14007..9f20b84d5c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -37,7 +37,6 @@ struct dpu_mdss_hw_init_handler {
 struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
-	unsigned long mmio_len;
 	struct dss_module_power mp;
 	struct dpu_irq_controller irq_controller;
 	struct icc_path *path[2];
@@ -292,7 +291,6 @@ int dpu_mdss_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct resource *res;
 	struct dpu_mdss *dpu_mdss;
 	struct dss_module_power *mp;
 	int ret = 0;
@@ -308,13 +306,6 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mdss");
-	if (!res) {
-		DRM_ERROR("failed to get memory resource for mdss\n");
-		return -ENOMEM;
-	}
-	dpu_mdss->mmio_len = resource_size(res);
-
 	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
 	if (ret)
 		return ret;
-- 
2.26.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
