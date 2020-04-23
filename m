Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD71B65F0
	for <lists+freedreno@lfdr.de>; Thu, 23 Apr 2020 23:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4E6E9DA;
	Thu, 23 Apr 2020 21:10:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E56E9DA
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:51 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l25so8104298qkk.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atMoZqiGfGrOmGKY/I2+PhQMlSiQYlmQolz8HyR0yj4=;
 b=KE0N8Dvr/hsd0qy+xqs/9QKLKEjofnqm7An5nc7MLkRpzlG5Jb+3hr1JQXvddcJIgU
 e8PKHy+wJGjEjrhdrJcdg9fg/hgFsVGge4otL5O4jaLwvaa2Qg4KUoU1rup0PNA7mA7Y
 dGis0YGp93VAxVYD51oDm4fpOPBSrP1kMHhxi6/TGqn2kAY4qZFKkTBidg4T03GvnSxp
 wBjq5uPWmA0M87KWqdMobWLsGHYDGqL/ZH2a8Fc3muQevhQGXpHWipJOAAOqT7Z4VT/X
 9hejIZMPhk0KUJk3P2uKlsSwoY4NbyWguUjOwPrNf2UQH3A9YE49Km9i38RUECoUBbJu
 WS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atMoZqiGfGrOmGKY/I2+PhQMlSiQYlmQolz8HyR0yj4=;
 b=W74o8aIPue7z9wwAsPSSQqvSHNIKWpH9qvwhdbNoAL8+iSA+ckBCG1i5p9OR2KbSb1
 rD1MzisOFjnjQnMZ91VNYTzFVPGFWc5pFdEFJE/vRaedNdl6tbLu5G84QlwqBgiuJeOz
 z0tTgQVIZW03Z2LceDLKD1yuvvEzApRtNtU4O/JkGxhhu3QwCh+iw5GWQRVVOzyeZHdv
 jGMUC+ixtlH/8mzT1kKuvR7h9W0XJYnFb3DjpOykyCTqgo/GWrmRdRqWJ+CLrgvgPIWk
 4wh9UZiX5OPBkmOs2/xAy5ptnoq6CeJgf2rleBzEzQD2WqXWT/y4jhqynSn11K2T+es6
 jWJw==
X-Gm-Message-State: AGi0PuZtAZROmREvBLXx+wLyItK30JngOLe0lF3ENy82KAIMYSdfnxuK
 ut608npy1ZdUOyo5ZCnuchFPuO982gB9wg==
X-Google-Smtp-Source: APiQypJEx+5TfCLSHzzBs2QROMWQNQDAfRhgP2tKOaI50DxwTLNcB+MCBpDBxM6CFiJVyfJtIGPXAA==
X-Received: by 2002:a37:9105:: with SMTP id t5mr6030530qkd.202.1587676249701; 
 Thu, 23 Apr 2020 14:10:49 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:49 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 23 Apr 2020 17:09:19 -0400
Message-Id: <20200423210946.28867-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 7/9] drm/msm/a6xx: update pdc/rscc GMU
 registers for A640/A650
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
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Update the gmu_pdc registers for A640 and A650.

Some of the RSCC registers on A650 are in a separate region.

Note this also changes the address of these registers:

RSCC_TCS1_DRV0_STATUS
RSCC_TCS2_DRV0_STATUS
RSCC_TCS3_DRV0_STATUS

Based on the values in msm-4.14 and msm-4.19 kernels.

v3: replaced adreno_is_a650 around ->rscc with checks for "rscc" resource

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 90 ++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     | 10 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 38 +++++-----
 3 files changed, 85 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 988575fc8e71..c6fce994194d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -421,7 +421,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 		return ret;
 	}
 
-	ret = gmu_poll_timeout(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
+	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_SEQ_BUSY_DRV0, val,
 		!val, 100, 10000);
 
 	if (ret) {
@@ -447,7 +447,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
-	ret = gmu_poll_timeout(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
+	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
 		val, val & (1 << 16), 100, 10000);
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
@@ -470,32 +470,48 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
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
-	gmu_write(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
+	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
 
 	/* Setup RSC PDC handshake for sleep and wakeup */
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
-	gmu_write(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
-	gmu_write(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0, 1);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4, 0x80000000);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 4, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_OVERRIDE_START_ADDR, 0);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_SEQ_START_ADDR, 0x4520);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_LO, 0x4510);
+	gmu_write_rscc(gmu, REG_A6XX_RSCC_PDC_MATCH_VALUE_HI, 0x4514);
 
 	/* Load RSC sequencer uCode for sleep and wakeup */
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
-	gmu_write(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xeaaae5a0);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xe1a1ebab);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e0a581);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xecac82e2);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020edad);
+	} else {
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0, 0xa7a506a0);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 1, 0xa1e6a6e7);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 2, 0xa2e081e1);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 3, 0xe9a982e2);
+		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
+	}
 
 	/* Load PDC sequencer uCode for power up and power down sequence */
 	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
@@ -516,10 +532,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
-	if (adreno_is_a618(adreno_gpu))
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30090);
-	else
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, pdc_address_offset);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 8, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
@@ -531,17 +544,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
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
@@ -788,13 +796,13 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 	u32 val;
 
 	/* Make sure there are no outstanding RPMh votes */
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS0_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS1_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS2_DRV0_STATUS, val,
 		(val & 1), 100, 10000);
-	gmu_poll_timeout(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
+	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS, val,
 		(val & 1), 100, 1000);
 }
 
@@ -1353,6 +1361,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 {
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	struct platform_device *pdev = to_platform_device(gmu->dev);
 
 	if (!gmu->initialized)
 		return;
@@ -1365,7 +1374,10 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	}
 
 	iounmap(gmu->mmio);
+	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
+		iounmap(gmu->rscc);
 	gmu->mmio = NULL;
+	gmu->rscc = NULL;
 
 	a6xx_gmu_memory_free(gmu);
 
@@ -1448,6 +1460,14 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_memory;
 	}
 
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
+		if (IS_ERR(gmu->rscc))
+			goto err_mmio;
+	} else {
+		gmu->rscc = gmu->mmio + 0x23000;
+	}
+
 	/* Get the HFI and GMU interrupts */
 	gmu->hfi_irq = a6xx_gmu_get_irq(gmu, pdev, "hfi", a6xx_hfi_irq);
 	gmu->gmu_irq = a6xx_gmu_get_irq(gmu, pdev, "gmu", a6xx_gmu_irq);
@@ -1473,6 +1493,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 err_mmio:
 	iounmap(gmu->mmio);
+	if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
+		iounmap(gmu->rscc);
 	free_irq(gmu->gmu_irq, gmu);
 	free_irq(gmu->hfi_irq, gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index c6d8c0d1f90b..e16c16bb65bf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -47,6 +47,7 @@ struct a6xx_gmu {
 	struct msm_gem_address_space *aspace;
 
 	void * __iomem mmio;
+	void * __iomem rscc;
 
 	int hfi_irq;
 	int gmu_irq;
@@ -125,6 +126,15 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
 
+static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
+{
+	return msm_writel(value, gmu->rscc + (offset << 2));
+}
+
+#define gmu_poll_timeout_rscc(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout((gmu)->rscc + ((addr) << 2), val, cond, \
+		interval, timeout)
+
 /*
  * These are the available OOB (out of band requests) to the GMU where "out of
  * band" means that the CPU talks to the GMU directly and not through HFI.
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index eb2cd41dae6e..b4357ea550ec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -336,8 +336,6 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316
 
-#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00008c04
-
 #define REG_A6XX_GMU_RSCC_CONTROL_REQ				0x00009307
 
 #define REG_A6XX_GMU_RSCC_CONTROL_ACK				0x00009308
@@ -350,39 +348,41 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_CC_GX_DOMAIN_MISC				0x00009d42
 
-#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00008c08
+#define REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0			0x00000004
+
+#define REG_A6XX_RSCC_PDC_SEQ_START_ADDR			0x00000008
 
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00008c09
+#define REG_A6XX_RSCC_PDC_MATCH_VALUE_LO			0x00000009
 
-#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x00008c0a
+#define REG_A6XX_RSCC_PDC_MATCH_VALUE_HI			0x0000000a
 
-#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x00008c0b
+#define REG_A6XX_RSCC_PDC_SLAVE_ID_DRV0				0x0000000b
 
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x00008c0d
+#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR			0x0000000d
 
-#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x00008c0e
+#define REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA			0x0000000e
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00008c82
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_L_DRV0		0x00000082
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00008c83
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT0_TIMESTAMP_H_DRV0		0x00000083
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00008c89
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_EN_DRV0			0x00000089
 
-#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x00008c8c
+#define REG_A6XX_RSCC_TIMESTAMP_UNIT1_OUTPUT_DRV0		0x0000008c
 
-#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00008d00
+#define REG_A6XX_RSCC_OVERRIDE_START_ADDR			0x00000100
 
-#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00008d01
+#define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
 
-#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00008d80
+#define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
 
-#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00008f46
+#define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346
 
-#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000090ae
+#define REG_A6XX_RSCC_TCS1_DRV0_STATUS				0x000003ee
 
-#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00009216
+#define REG_A6XX_RSCC_TCS2_DRV0_STATUS				0x00000496
 
-#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000937e
+#define REG_A6XX_RSCC_TCS3_DRV0_STATUS				0x0000053e
 
 
 #endif /* A6XX_GMU_XML */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
