Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E11791FE8
	for <lists+freedreno@lfdr.de>; Tue,  5 Sep 2023 03:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778E10E16D;
	Tue,  5 Sep 2023 01:25:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253710E15C
 for <freedreno@lists.freedesktop.org>; Tue,  5 Sep 2023 01:25:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50078e52537so3302200e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693877131; x=1694481931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
 b=WF8g2nSm+d3oXRhz+75JaEy98jvLFCS2Kd2vwZYDJMKOeBYHgxZOUoYddmKb1syt0c
 uIcQWKKWojQqKLvjUI6GFVfQFAqMuSDO0NfTm6sTdGeoXq+J3T8w2TYNCAxHZvI1lHo2
 01LuBsskEaGzr9RfL5L0nibHYBmVUiNdleUGIKwMMW27thJFYHTxO8/yR0kJ+L8FJtUN
 tnFVOPVvDGdfRbvaKWmKkCwXIWWpucJwZLSIR7Sk15kkshtNVcyE3cT4SDWM9MZMO1Vn
 3Qp3iDwyqUJr9+zss9SWO+Nthi80IUcYAfM3rluhaQPV+dO6p9gyUkjLOl5BDA0pFMui
 Ox4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693877131; x=1694481931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
 b=PLO29PY2ervY7FIAd3Wys9+iRqfnvhXnKcSTp3ANZK59drpBCSWfjNjL7qN5oegA8Y
 EGrGWGgaqD9BlTEM5r9gjDSijnSp88SHeqcV+lLEU/FNdeRPvF3DOQcs/YxA1Z6N51Xw
 nuMNsmLtsEOBaReJZwgsWhaP1/Bzis0q2X5G5kmONYi0oUB34NjY4Zkcyy+O6QUSJ6+d
 5Oxfo0VZlW7UsK12g0z7W1ePaCkEiqfX2W50CTQXZb2cNdOEpNdFiQm5Z/VNeM2TXbZK
 p7WP9QrFHZG9aSrngHemzoujAtmVQN/RKrQZKxQ6zC9iS4Geb3HA3rvI9pbxmAWobedW
 IfRA==
X-Gm-Message-State: AOJu0YyiM45CzTD2YtuqUVf2fb2w7wYEqWUpwYYaiiKFmGWm/mj12f/7
 F1GE7Qmb1+uBL9x4kOglV9GPaA==
X-Google-Smtp-Source: AGHT+IGL7XrtBeVMSH/u25G0DwjYX0kSPFOOiD+xcYJ7PSXAlJXrEyGz446CtJl5o20jIkQw2iJf5w==
X-Received: by 2002:a05:6512:10cd:b0:500:a2d0:51ba with SMTP id
 k13-20020a05651210cd00b00500a2d051bamr10609443lfg.44.1693877131664; 
 Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  5 Sep 2023 04:25:23 +0300
Message-Id: <20230905012526.3010798-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/8] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO
 macro
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

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7c08bbd2bdc6..63716ff5558f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,48 +252,50 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

