Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FB2A9991
	for <lists+freedreno@lfdr.de>; Fri,  6 Nov 2020 17:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4216EAB0;
	Fri,  6 Nov 2020 16:38:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7000A6EAAD
 for <freedreno@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g17so1171703qts.5
 for <freedreno@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
 b=k3MjYGOGKVYelIzBvfp3L8cST3oDN4AlfVorpp1NDVxMYElQlNO3DALI40yDkTrawz
 mgcs/RTD4xlqqFsj0pjj75nHndQJZfTvjrl10mDt+PWoYU1EMx4zWgUz7k0o1Vz55sLy
 pSMuMNWSszPtCXIHVhI1puyZMniA7Ob22db6Ks6TpabmPxLzVmNRaQfATrT5MwsllmqF
 flvA2plO4KB9Jm9Yg4scr+UucfSUY3hCzX4i3Rm5WrZGVYfURrtmpONO5NWpaiBLZduE
 mV+oIa4Zplly8jpTfF4zftuD1v6KV6b/+4EEkuzYXzRkYcs8A/H5+D7X1TGBBItW9erS
 BuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
 b=OhiodJUxETUQkpntGOR6XMs/X0goGm+CYPyVcXO9d2KvUPJX7LBgIUJ2QAx6d6dDjD
 OeItdEOWbKOitwOqB88iPZGuVMrKSaGVTaaI5x/acv14/6dJzGW3QkpyzpcFxppHCjFd
 u41GyEmjuqexO2Bc3XD790KqRs7Wf0e/V9kykD88S1YksZSZyNPNGbcJzP5m6nnbOHtL
 h70Tf1nI9BrRgWDUpRXde0RDSee2JciqD5AfqlYibC2oJIdICtxiLhNIC+aeRaN8BUFY
 Pg2SLHct5goWBUmnlTEEgH4gmqDPyjF/CCx7MU5QZ9zg+B6jwiX5iSU0aK3HC452L/WV
 iadw==
X-Gm-Message-State: AOAM531OFqbZ6i8c7PPgDh+mxeFoGoKC9/xNdtplxAZzqYCQGOPTHuA3
 rQZFaXd+7jtpBPE+xKkoTAKgEkTpqok4Xl8Cp+o=
X-Google-Smtp-Source: ABdhPJywTSmbTMlzI9PUVuL5HIr8Aymu34q6XmjeK+5a0EqRC0hGs44w8EYmRRoQucNCsiOWsq2klQ==
X-Received: by 2002:ac8:3797:: with SMTP id d23mr2269867qtc.205.1604680724317; 
 Fri, 06 Nov 2020 08:38:44 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:43 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri,  6 Nov 2020 11:34:32 -0500
Message-Id: <20201106163437.30836-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201106163437.30836-1-jonathan@marek.ca>
References: <20201106163437.30836-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/5] drm/msm: call dma_direct_bypass()
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Always use direct dma ops and no swiotlb.

Note: arm-smmu-qcom already avoids creating iommu dma ops, but not
everything uses arm-smmu-qcom and this also sets the dma mask.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/Kconfig   | 1 +
 drivers/gpu/drm/msm/msm_drv.c | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index e5816b498494..07c50405970a 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -20,6 +20,7 @@ config DRM_MSM
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
 	select PM_OPP
+	select DMA_OPS_BYPASS
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 49685571dc0e..bae48afca82e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/dma-direct.h>
 #include <linux/kthread.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
@@ -1288,10 +1289,11 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	/* on all devices that I am aware of, iommu's which can map
-	 * any address the cpu can see are used:
+	/* always use direct dma ops and no swiotlb
+	 * note: arm-smmu-qcom already avoids creating iommu dma ops, but
+	 * not everything uses arm-smmu-qcom and this also sets the dma mask
 	 */
-	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	ret = dma_direct_bypass(&pdev->dev);
 	if (ret)
 		goto fail;
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
