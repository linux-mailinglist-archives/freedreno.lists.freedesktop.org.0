Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E029AA3D68D
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B971210E921;
	Thu, 20 Feb 2025 10:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cE1fy5bg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543110E922
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-545284eac3bso820699e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047193; x=1740651993; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XcgN3KcZQIKunyhp5MN5k0ww8zI0POS9d4nm1tGHVCo=;
 b=cE1fy5bgeDx1G1dlbYZQMPdxsEHbRs8jiozf5VGQRh7LR4ghJ/THPMq6nqChxVQ6jH
 RcsdT3RapMlNQUu6igUD94eUVq64/EoCNHDFji3ZB2oy702RkwnuGzlyUXKBJ1YT4tdG
 Et5e+4oO5pj+psriEsuLihrYG3Rb8WNTESDthezXRFXuBp7Ew0eyq2vluHzDMz1whvql
 S73JfJ/ypRHhydQ3YdkeiUwqS0xUAisBzBH3Q4qQUkdCNwqrIkvrey+iiPxR0vGB2ycY
 ssCM04c9hAxViuUGdGUFw17oNQJ7a+MxtwJl5IWbnKQ3EeG5HO850awpilHYei4+eppR
 CnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047193; x=1740651993;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcgN3KcZQIKunyhp5MN5k0ww8zI0POS9d4nm1tGHVCo=;
 b=nXNTWdT6En4zkFsdoSBBsBX6Aazbj5VK67s+uBtLBMOd/TZyP42M2NHY24g+jsNUsg
 XJU3uHqdE4p2MlCPT7FolAWmwJz03naQ2scnQeMFKZTy43dya1Kh+mVV9BB15OL/5vzX
 g0sMGIALhxvdQ6vxpXCHbbWITxtv6oUqg00zPwL+ITk0QBrGpskp5PvbRJjYioUw/QYq
 MT++B07mAwiTvi4VOZqLjiheLAcYXScCXLAOkG4AcEAe7h71v8wXn+318hmkaZRgcfyg
 tFIgdKiNHCA4vuJ2lW0jsUhRCcuKyN/Ihz4pPfXU4DZCiptfKL9qqzJ8dVyrJlaos9ax
 cwcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQKQgdG3I7clAnQbw6BHRzMQOKIaWfGTJljip+eZuzV1lyFsTMdQ8XW2vFlRyl2G4WOroLHrzQtRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaI0iVsS2F0AvPwwehSyDWrZ07+1vn/ZAVpJ0V1m0b0mqap9HC
 xqbqp+lcbzFKDmILpMc/iwMeIqc5QmX4/dvnO6nWZ+MFhRPc7Wc5gDIXVdCqcNDRo4qHQq90mqc
 f
X-Gm-Gg: ASbGncv2eabj3JbIeyhsM0quy8Uihb++AaQB6PdsBwFKnA8v48h7k+kjD9X4YPrKnwG
 L1hGcTIAY4YvGU1jlH68kbY5AxJ22sFoutFOxNKdVJ7jqOmagaBCHyoGNwPbZK7SNtByh46Zp2M
 Y0rzoORVcjP8jo3JK6SsqgfJ9CB/WXvOTjuHuxGBWHfYlLYwWCd/SmNvkdy577qTW08UOxlHBms
 PPKo9FvOMkOMMeHbRhBQL5LVixQVbIAAUx8RF/6mtVilkGYuRXcs1raJeIImUlSF2PLksv896qP
 FEuUIpqfH6xO1XV8F9vi3Fw=
X-Google-Smtp-Source: AGHT+IEM9+GwpoyKZl6DXyfHoUFNWFP013z/rJDJY6azNQJu3BsrfRzXnCOVs/HY3FvHdFiR+OFW2A==
X-Received: by 2002:a05:6512:2396:b0:545:1d25:460d with SMTP id
 2adb3069b0e04-5462eee6586mr3144030e87.12.1740047193190; 
 Thu, 20 Feb 2025 02:26:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:23 +0200
Subject: [PATCH 6/7] drm/msm/dpu: allocate single CTL for DPU >= 5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-6-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bTtPeLTR7bIGAjAGWZZbYSPB+kORXsbXpocudthnDVU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNLcO4pIN+ypbPAk3kZc9xkCx3N/uJ1cgUA4
 9Jx+DG4DTuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSwAKCRCLPIo+Aiko
 1b4sCACwhvMnemZlynSEuUk5qg5JVNllVcUdExghA2X1IiBLMjPPRqFLSOs40D2uxyzV5xc8ZkN
 DV+h0qhdC20PUTM7ZUtl/Ngb6gvmA10XOTFlli0ITCbOuItVfJrj8QopMwsQasQ4R32Xg6jXOnA
 jy+HXtzpD4feH+5hz+PiR8v+ZOe/epUccGfXOIx0rEJ+tD0RT1htDMg34FAlmwkPKoG+pBz4E3N
 KpX15ArRQDd5zAZrsb+sKYoVcbdWkU8wbvOzcc5dudT95O+yhmYEThoIIShE6NwdvgibQL0U/8k
 MBuoevG8EUDJ1+wSsL3VJkxGBSalC90b4I6Bo9QB5AupStG/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Unlike previous generation, since DPU 5.0 it is possible to use just one
CTL to handle all INTF and WB blocks for a single output. And one has to
use single CTL to support bonded DSI config. Allocate single CTL for
these DPU versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 5baf9df702b84b74ba00e703ad3cc12afb0e94a4..4dbc9bc7eb4f151f83055220665ee5fd238ae7ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -53,6 +53,8 @@ int dpu_rm_init(struct drm_device *dev,
 	/* Clear, setup lists */
 	memset(rm, 0, sizeof(*rm));
 
+	rm->has_legacy_ctls = (cat->mdss_ver->core_major_ver < 5);
+
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
 		struct dpu_hw_mixer *hw;
@@ -381,10 +383,16 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	if (rm->has_legacy_ctls) {
+		/* each hw_intf needs its own hw_ctrl to program its control path */
+		num_ctls = top->num_intf;
 
-	needs_split_display = _dpu_rm_needs_split_display(top);
+		needs_split_display = _dpu_rm_needs_split_display(top);
+	} else {
+		/* use single CTL */
+		num_ctls = 1;
+		needs_split_display = false;
+	}
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
@@ -402,7 +410,8 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (needs_split_display != has_split_display)
+		if (rm->has_legacy_ctls &&
+		    needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 99bd594ee0d1995eca5a1f661b15e24fdf6acf39..130f753c36338544e84a305b266c3b47fa028d84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -24,6 +24,7 @@ struct dpu_global_state;
  * @dspp_blks: array of dspp hardware resources
  * @hw_sspp: array of sspp hardware resources
  * @cdm_blk: cdm hardware resource
+ * @has_legacy_ctls: DPU uses pre-ACTIVE CTL blocks.
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -37,6 +38,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
 	struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *cdm_blk;
+	bool has_legacy_ctls;
 };
 
 struct dpu_rm_sspp_requirements {

-- 
2.39.5

