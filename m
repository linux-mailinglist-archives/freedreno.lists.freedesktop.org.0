Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F053D4B21
	for <lists+freedreno@lfdr.de>; Sun, 25 Jul 2021 05:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5377F72EC6;
	Sun, 25 Jul 2021 03:21:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC9072EC6
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jul 2021 03:21:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c7-20020a9d27870000b02904d360fbc71bso6322175otb.10
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jul 2021 20:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gsTOc+rL6lEAEpQSXvea66h2ZWJwfuK8xvAPUmJAZQI=;
 b=gnvBYzhUm3ydgVsFyglm2kP+QZCot55q8iUAD6sPh1zLPLsTe5RrT09O0uoMvoaCwn
 Rj84VKCzuUEIOhVWi4c0WFyeXr586GKnbosCCKQ+tJeIf+edJy1ocX3uZsLBTJ5lNVw7
 aAYH6D4f/izOD1eXU1hUUwQlhA8SbO3lBdbiAB63jvbTtuA2nPAOJeRR2bjSEUwv/Jwt
 qxMBpmPRlIKjXrl1CQvK7km3kdqDsqCPpV/6Egm02Mzb4fo5vyAZhkP82E8TxE3uotLq
 HDpdWCBbgJVbmLdk1RoMMhKpj7yrSUvDToMAJ8FZrUQLvfPLzQMKAL5JlRVLWoY0ygIE
 k9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gsTOc+rL6lEAEpQSXvea66h2ZWJwfuK8xvAPUmJAZQI=;
 b=TYjBHRoXK/jZg76OjrSfnkyCpb/U4WDu/ICXJm1N+esmYTkneNxg8tB1r4cDlX0OTk
 bld9rKpKfz/ItUxGX2BjOc1MhYvM9t+wO/I4HPnYeTCWTMEndnTx3HPKTSSgsAK1yYRo
 jDo7SbmqtsfU3BRPqxuVsRKna+DaqmKVCt2PA6CbU1qopV5Wl3koKR2zLg+2D1gY/IcZ
 3biudjgXu4qEe2umoVEcSRuvzk2BY4ZjlWLyiDQRHTwJnYPSGJ45zsnsnyY1E8COiOB4
 qRjUcLI4+J3MCREBXpTcKStgFpl5LwgqIQ0nya3W2wpUpMGwMyyTmRwZaGgKraroWulj
 nq/g==
X-Gm-Message-State: AOAM533n5DmKZsiYGJWHbpgWqONNo+7wlG8DC+hm7Yb5oj8l520qdps3
 WInGjfAbnap6U0Zjfw/2w7wNGg==
X-Google-Smtp-Source: ABdhPJyf6p654Mek1ReOJlfg/V8CNaHDfEO820VLd2UQ6EH5SIlguppVKmBbPmT4H6S7ltrx0+VhYQ==
X-Received: by 2002:a9d:600a:: with SMTP id h10mr7593133otj.144.1627183308943; 
 Sat, 24 Jul 2021 20:21:48 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r16sm5567139otu.26.2021.07.24.20.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 20:21:48 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 24 Jul 2021 20:20:02 -0700
Message-Id: <20210725032002.3961691-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm: msm: Add 680 gpu to the adreno gpu list
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch adds a Adreno 680 entry to the gpulist.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
 5 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b349692219b7..1c0d75e1189f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -521,7 +521,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		pdc_in_aop = true;
-	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
+	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
+		 adreno_is_a680(adreno_gpu))
 		pdc_address_offset = 0x30090;
 	else
 		pdc_address_offset = 0x30080;
@@ -1522,7 +1523,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_16M - SZ_16K, 0x04000);
 		if (ret)
 			goto err_memory;
-	} else if (adreno_is_a640(adreno_gpu)) {
+	} else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_256K - SZ_16K, 0x04000);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9c5e4618aa0a..5cdafc6c8bb0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640(adreno_gpu))
+	if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
 		amsbc = 1;
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
@@ -757,7 +757,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 * a660 targets have all the critical security fixes from the start
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
-		adreno_is_a640(adreno_gpu)) {
+	    adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
 		/*
 		 * If the lowest nibble is 0xa that is an indication that this
 		 * microcode has been patched. The actual version is in dword
@@ -897,7 +897,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
+	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
+	    adreno_is_a680(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
@@ -935,7 +936,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
+	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
+	    adreno_is_a680(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 	else
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
@@ -952,7 +954,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	*/
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640(adreno_gpu))
+	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 919433732b43..df8af237cf6a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -428,7 +428,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(&msg);
-	else if (adreno_is_a640(adreno_gpu))
+	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
 		a640_build_bw_table(&msg);
 	else if (adreno_is_a650(adreno_gpu))
 		a650_build_bw_table(&msg);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6dad8015c9a1..799e4a35ca44 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -300,6 +300,19 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
+	}, {
+		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
+		.revn = 680,
+		.name = "A680",
+		.fw = {
+			[ADRENO_FW_SQE] = "a630_sqe.fw",
+			[ADRENO_FW_GMU] = "a640_gmu.bin",
+		},
+		.gmem = SZ_2M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.zapfw = "a640_zap.mdt",
+		.hwcg = a640_hwcg,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 8dbe0d157520..a7e843e81b1e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -258,6 +258,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
        return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
 }
 
+static inline int adreno_is_a680(struct adreno_gpu *gpu)
+{
+       return gpu->revn == 680;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
