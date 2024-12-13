Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85089F188C
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192710F10D;
	Fri, 13 Dec 2024 22:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QrdttJmK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37AB10F10F
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:33 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso25416911fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128132; x=1734732932; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SYiRea4EwjBuM/pDrnKzR7CxY6M8aLg13dPrT2rr+uw=;
 b=QrdttJmKUkMYQttR6uZEJnDMDf2E56QcTXZrD5MLyWtJUVjbzS5/OIditZqJFCD0ZO
 e00Hx/gHohT0RwCuQq2+tBmVB/1J+0mztnhgEk4WxAslspFfnfJW4cY+JBG+R1Oem49W
 WHyTpVELvTSrZVUtoXYsx5wQmDX8i4Scf452cR8qHzNAO6zFdZjgf/aF6VHlrQAxN4if
 L1QMTjafjIYamcteE3vgodrR6Bn7IwJ2zs0pcMjE8ST6J8kXW481u6oisdazs+iFQrCc
 6ZXk1gqY11f3u+dDA2KS91TSfGRhZ0kj4QBNl7u9VgOb/MlYJ/me+T/ElJB2KPWJSvtp
 cV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128132; x=1734732932;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYiRea4EwjBuM/pDrnKzR7CxY6M8aLg13dPrT2rr+uw=;
 b=f4o7gV5+NuSq2+JYCxjJ3R1CeUNAUoapGzRM56H0+GEpDBY/y5eBLZAqeQAY7P3IDN
 ux2GoduerpoT7VevBZAofdrq/JuAORD9F4mEpNj52C6p0VT8LVGvuII9RcA0EvFFw9NW
 msZYIP+IPU7qjQRxbuIwx5WTK/q3yy2j0d5NUN04ZJQVPQF1+DjPu6tzouO6Ei9+5e9V
 ZlPNcGjSGMpc74reRClBIBThdBKwcs3uE0UBjsU8xZDYJWbHJXkcrmxnw/n60SZPRAWz
 RK4Ng92Fl2nKcf94a9+sO1FQQdvDcMK7kb4hTOFGElOYuwBt+I7bDFTKevuAv1FCSdNu
 GzOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYh9rd7oB6RE3FKgRysjPcq3xEjz3X/k4LFdovSx/zNm+TWkKUKdazkQ9lCxfbqre6mGYYFc7iDus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQYSV8vUpT8QgMIWNToTQwkBq8ZVsim0ULsVTiRb/bBVI5OoMi
 ebRMoHuVo3gYuqtmwJJv8dYza7o/A1tJYjc/u9zPDo2zobP+HrbX7uoY8YFb46TQc/Ordw2VX5c
 3afU8ZQ==
X-Gm-Gg: ASbGnctCEWI2H5M65c034LEIzsEXw6RW/Omjx+C3J3m9jjc9GeZzrYxp17khxq4tyOS
 HAG1DP5eQe1PgkiWxTVuc16nILKEZZkx8Y/+xdfSXXlXy39xnCNmO82P5vQokol0KFYB06KT4j4
 9iVENdSBY3wbD/Y2W4Ber+ztWLOMmR46p3J60C7gZrfHvhZQVJNmdCg4qY6BJi9DlOc1x8yoIuA
 eQBX2EXLm2fZMEpmb1PQnV9tZ+/cZ/Un03+5uSsIB/Q+xrsthERAq22DMfOVZgT
X-Google-Smtp-Source: AGHT+IHkFnwj0GDYRxTrti0RjvnXm2VfFagkgygcdKY+TFKK2Q8ADUGMLry8upg2ZGyUB8TbRM9yuA==
X-Received: by 2002:a05:651c:553:b0:300:32a3:a322 with SMTP id
 38308e7fff4ca-302544ae84fmr16288621fa.32.1734128131749; 
 Fri, 13 Dec 2024 14:15:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:40 +0200
Subject: [PATCH 24/35] drm/msm/dpu: get rid of DPU_DIM_LAYER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-24-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=no0sfKO/tylUOGei0YmNfycYpYlftUgIkxgk0z+dSYc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHHgsuXxj3B2BQiVlsVmWCsmgq1OouOBYftx
 JxPlOjFM8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxwAKCRCLPIo+Aiko
 1R9aCACxClRBR5KyoH/z5F91crL041ilJUSNt/WOYgnqyu+kyo8/mqnfkB7x1UdpbwMhl/7JyWE
 f/jNfXyA6vlrRt9XpRGuglMMsFyYXMUgnunKGhGKfHqln5Zsl5cnFV1vH4OQnxex9zHBTlmfTc0
 86MS9AcTwrN+d3T+8hswh+4W6MbXj64VDoT6CwG5mj9ca+Kbf8ZyeF2TxfWFevFt8TwmaRx1wOo
 WJ3unMOjguwqA7/SvcVv1IXLgS0v0cRJGHmRtwN/W1XBl+o6VT6T6iEd10ybPza+ze2M9rg/iWS
 HjODxmr2+5y+R3Wfc3KJzRTe+1DszXUBtmCa0TDXL1xbGzuh
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

Continue migration to the MDSS-revision based checks and drop the
DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 6 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 63fdaad2f38aa8157098351fc051b64a6167e45a..24b46f570690332026cc71ba0f2548b56fafbb3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
@@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 		.dspp = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 842505ab5c4a6555e0a3223804065e68a5a4e680..155db203282f687e5632dcb042393951bb03876f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7087c3c2e728c51f070b67ab0f8039f74eb7da6c..708cf1544bd1d5c72a125b572e51d628c53f5033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a2fdbe39e4415c1da1da0517db2284f368bfa07b..b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.lm_pair = 0,
 		.pingpong = PINGPONG_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2107d0ed7f3606b3467796c298010651f6425b8d..976fbae56a4cb6ab01663ad0f92ee4d095e7ddef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,7 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8b94ed395392a4ee43030e92d0b58baeb4d47dec..3947fbf7e7f4f5e0e3c0ccc263ed14c7b22bff8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -84,14 +84,12 @@ enum {
  * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
- * @DPU_DIM_LAYER             Layer mixer supports dim layer
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
 	DPU_MIXER_LAYER = 0x1,
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
-	DPU_DIM_LAYER,
 	DPU_MIXER_MAX
 };
 

-- 
2.39.5

