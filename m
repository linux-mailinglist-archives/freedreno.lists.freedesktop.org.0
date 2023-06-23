Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B073B939
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AE710E63E;
	Fri, 23 Jun 2023 13:58:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E2510E118
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:48 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b466073e19so11360461fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528726; x=1690120726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uu4tO5xYJ0NxTWthiYAhtDRdLcT1akEL+Zz+iqF7n+Y=;
 b=CeZmV9U9mY0Oe6yVcOFjNNmY65BZvOY2Fnkc/pjHFQg1zHtNG16yScBId/vX9hOscw
 EH5S1sKvF4QXAooRmyMpMEPFCEsyk3Daq5f55LOfFDJR1L4HZ/zMB2KkF/KHLUxDCwzy
 gt+d2CRUIeYmryw9CXM3xj+8cTnIUanFOt77PnaV03wqmDNAnW0Bq/U89hsoNeIEyhHS
 Mpf2ZgaPrYoQYj6ZK4ApCnbCMm/2UmLDkUlT9moQ8NoZZaVKpnrXZh2CaDTovEbamABk
 1z9UrvEFDhG3AnQC5/CPHshCikgRXj+6HzuILd4sP7FOVo51gd9PY0xMZ8KevVsXsGtF
 oiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528726; x=1690120726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uu4tO5xYJ0NxTWthiYAhtDRdLcT1akEL+Zz+iqF7n+Y=;
 b=OrOFTptR2qQ14WHMdn+61lFs788TTSH4O+Sm26ISaMolBWkXQbEtQZKJzrJ0tU+Z2Y
 C/Bw56nQ3e5tNJfkSmoCW2gngijQpcOB8eFjGuEX/U7P4yMYkKetPgGFzWZPlXdgJkkN
 hLjcKOPIMUjdxuNHkp2txN1cW1Qfl74+lGO0X7wkVkTJXm9XtdS67dyJmrO6wtrsqg5C
 dJFAz9TrLDKsSNVaZWajNKNpMjvR7E/K9B/4X+S69HNt+ioZGPXCO/cFUjGaish4uX5Y
 c3J2TwQaOqbdAJmgxjKhLVY8VOJN0VsGwLx+O0fsVw1LfuHUHp1ehqNJDDr6/+4J5hsw
 /anQ==
X-Gm-Message-State: AC+VfDwlis7U1FoyfH3+Cru0ebA9rbe26kU41vFHa3ayvAUdrjxSucbo
 6LwiBMGms6qKEC/qeTvzaSmwmg==
X-Google-Smtp-Source: ACHHUZ4q0llGNOWagJB/0UMXga9gIOHOPY1ju4BIwQ9uSliSZIX0muDGrenDifUdXjS8FPajrssCNg==
X-Received: by 2002:a2e:9b13:0:b0:2b4:6c47:6257 with SMTP id
 u19-20020a2e9b13000000b002b46c476257mr12923195lji.40.1687528726282; 
 Fri, 23 Jun 2023 06:58:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 23 Jun 2023 16:58:38 +0300
Message-Id: <20230623135844.1113908-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/7] drm/msm/dpu: drop the `id' field from
 DPU_HW_SUBBLK_INFO
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The field `id' is not used for subblocks. The handling code usually
knows, which sub-block it is now looking at. Drop the field completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 24 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 --
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3efa22429e5f..4a99144a5a85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -254,10 +254,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = STRCAT("sspp_csc", num), \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -272,10 +270,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = STRCAT("sspp_csc", num), \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -417,12 +413,14 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
  * DSPP sub blocks config
  *************************************************************/
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {
+		.base = 0x1700,
 		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
-	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {
+		.base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };
 
@@ -430,20 +428,24 @@ static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
  * PINGPONG sub blocks config
  *************************************************************/
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
+	.te2 = {
+		.base = 0x2000, .len = 0x0,
 		.version = 0x1},
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {
+		.base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {
+		.base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
-	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0xe0,
-	.len = 0x20, .version = 0x20000},
+	.dither = {
+		.base = 0xe0,
+		.len = 0x20, .version = 0x20000},
 };
 
 /*************************************************************
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b816e36d12d..bf7a525206ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -274,14 +274,12 @@ enum {
 /**
  * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
  * @name:              string name for debug purposes
- * @id:                enum identifying this sub-block
  * @base:              offset of this sub-block relative to the block
  *                     offset
  * @len                register block length of this sub-block
  */
 #define DPU_HW_SUBBLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 id; \
 	u32 base; \
 	u32 len
 
-- 
2.39.2

