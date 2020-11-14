Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA512B2DD6
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 16:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8516E92B;
	Sat, 14 Nov 2020 15:21:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9406E92B
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q22so12455433qkq.6
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
 b=pJascp7VGYt/H6n29g64kblStEJQHiJchoF3UWHdzGdpjG81mpnsko/3z8m016I0IF
 QLUAPyXMENTvrzyVFNTy/8OdnM+2B6l3cHde4uEAwzpo48nwwjzvRhZSlnEwofdu6gOj
 vKgha1gL0RcUMSJ4YOAY1CCHnhKzaLg3s1rBHAxLgEtGt9xs1jzDcGxhJiAj9LsldP46
 QcSXOwRli2V706fEv5gpY3q+Nfhy1/Q4nvGECR5Xxdxsutm1e3EGO54vbYtv9hjVQqtX
 TWJknmynolLMmfZXxaacPwU9xBTpnG5YEpgEXoAOoCI6iNZ7NYnpHvxpZLfe9onNNIy+
 E9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPmKg3FYk3Lzs70K/NYX4J1DHPtpY/HdRoRb6lm0KnA=;
 b=fT8Wl364l2VB84QjBGW33SM8nC/F8klAizEV4n2xx7vnckdSvNWUylyDymVgeRx9y3
 NDkUhIlVDr4K49eoBtHVqpw8Chocb3/lXQyJwzcPC1UxTzoSie2oUl+TMSHiKdM8t+aC
 GYYoqNDPGVsEgiCeOQXi/sQLM+2qlwAwh1us3DPcmZplV8oVCRMG3ub+awkh+giaYwYi
 c1TeZhY1vMaUMhB9xfFPF8RxNwfapItINSu14EFc/TD4IRNSPOPrHG4XY3TIpAiwBUGK
 qMbMwDdudlIyRMwo4n9jtrK2nDYQbDpa//XBVjJlZA245BeFmhMr7fov4vbO9zwO3vQU
 D3ZA==
X-Gm-Message-State: AOAM530PmroZh5niqBOBH4sAtdzA7gR9rAIYd1DpvRmuoKt2/BbO3qOq
 b+Aw6Tyd/PnUVFQtRJTj9Zv58rtBCTqVWa1oCUg=
X-Google-Smtp-Source: ABdhPJzgscgk0ohNXdNYoDcxxdIkRC8kNTlyMvItOc3OOIL+2bEmEN+MGO8+p9C4UiNuw9dUFWyyaw==
X-Received: by 2002:a37:2f43:: with SMTP id v64mr6878299qkh.127.1605367269282; 
 Sat, 14 Nov 2020 07:21:09 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:08 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Date: Sat, 14 Nov 2020 10:17:11 -0500
Message-Id: <20201114151717.5369-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND PATCH v2 3/5] drm/msm: call dma_direct_bypass()
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
