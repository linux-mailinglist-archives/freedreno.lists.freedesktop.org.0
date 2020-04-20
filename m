Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B141B0DC5
	for <lists+freedreno@lfdr.de>; Mon, 20 Apr 2020 16:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678CA6E5A2;
	Mon, 20 Apr 2020 14:04:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059A36E5A2
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 14:04:04 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 71so8431464qtc.12
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eW6T1wQC7jFy/lW3/sPzizGiLZZu/K+yKI7oSfRVfR4=;
 b=Z666IGajMXYRRwkHoXM1JRZxVO4XDY1ykrsRr2qEOOJavpPTpIJZhgCer2Aoee0EwA
 UdHcHFGyuTfs/KODgOFLxX07AE88WHPM6IrBe/skj1fsAJolUHIRx4oFckeUKb7XkdWT
 TtZpCo9IkcZRZzjReBIUD3hFNGw1mfjsETIuBVfbrWmLp+mPEWH/kJGrj3rQSfXFKzDj
 oHhpYfA1qTqUilsT+KzXX0Vid4dM+Pu4uQis2BpBzdp+vk4Y7Yf404/tuWuaEYLiYamK
 QwN1Tnin0aezydvwZ69gfmwStRMowsmLixqJmpvJANIbIj5DswQujVMh81POtEhy2sOk
 zZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eW6T1wQC7jFy/lW3/sPzizGiLZZu/K+yKI7oSfRVfR4=;
 b=gbNaw/mxX4nQkhKthBfEIEBUhTdkxsTo+5hJ4szkrx4BzisLrDXvH2ZjgAh/bF3P9W
 nMq6LpYyH2OVP8+eaSDGUw71fTqzjfIaPaBstTUb70a3lK9SOmyEaH7XhVp6ZkghahLN
 5vx44QvdopfLhshrWa+66xMQR9zN9c8rt7cCso02CO/SwLKvsJjkFN2hjPjLEuJyHogl
 qFigNCexQ46n44qDYHvXP57VYcH2SNgRnhq0Fl8feCGFjev3h0dNGEopmpqDXEfMweBP
 IxpUAi3C6QHqA2UzIwHjZB9xBw5NgxXSIxBR4BEy8WJ0dDRcpy61JqdK5YjUZUVNjHMo
 GCvA==
X-Gm-Message-State: AGi0PuZ+wkHDy7iI7p1epUf9EUKWOrOy3Ygselj1GhUfCgdDYmCHthUb
 GpNxsCj7Ov/XON/NOtmteWqLHSA0NGJe5A==
X-Google-Smtp-Source: APiQypLJlfTA0EEOcTyxsbG8dZpAA7Or75F4BrxU0/Gdcf5iKcvhGZOpowt/67eQ2sV42bZ7V2Vk0A==
X-Received: by 2002:ac8:73d3:: with SMTP id v19mr16321592qtp.263.1587391442783; 
 Mon, 20 Apr 2020 07:04:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:04:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 20 Apr 2020 10:03:11 -0400
Message-Id: <20200420140313.7263-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 7/9] drm/msm/a6xx: gmu_pdc register values for
 A640 and A650
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
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3e51939eb867..b583bf6e293b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -469,10 +469,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+	uint32_t pdc_address_offset;
 
 	if (!pdcptr || !seqptr)
 		goto err;
 
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
+		pdc_address_offset = 0x30090;
+	else if (adreno_is_a650(adreno_gpu))
+		pdc_address_offset = 0x300a0;
+	else
+		pdc_address_offset = 0x30080;
+
 	/* Disable SDE clock gating */
 	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
 
@@ -523,10 +531,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
-	if (adreno_is_a618(adreno_gpu))
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30090);
-	else
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, pdc_address_offset);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 8, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
@@ -538,17 +543,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
-	if (adreno_is_a618(adreno_gpu))
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a650(adreno_gpu))
 		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
 	else
 		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
-
-
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 8, 0x10108);
-	if (adreno_is_a618(adreno_gpu))
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30090);
-	else
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30080);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, pdc_address_offset);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
 
 	/* Setup GPU PDC */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
