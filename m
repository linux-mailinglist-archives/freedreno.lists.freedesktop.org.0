Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBA8017FB
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 00:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88C510E9A5;
	Fri,  1 Dec 2023 23:43:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323E38981D
 for <freedreno@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50abb83866bso3960933e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474162; x=1702078962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
 b=oAEl0L1NFf/dhbMCilRQA0bqgDYRU2+xqRc0Rv91VJQAcnFArE7w8dHbwhFKmal7lM
 UIqIDiRAH3qrXsHr2V7QZvKqU4WVQL+cVC+DY5moD3p81SmsmV+GW0G6jtZnCMiAi/sN
 LF6by2go5VXtj8MbnHk4SpFUMv78EO2RAV7pRYZKohUeIqFVEc1YY6Puy/qFLJRPt8Al
 89fUEUVLQa8CVpEFE8cFBqx/6UDqggbLiZMNYp8oKZ/p+Z/O3GBPffLWKl7lDYUgsSWF
 AXeYAoMmVam+VWAyPy6+u/+haEI2st7LOFheTnjfjjr7H+M8U3BaTQs/i1MeFnTaR2j3
 lk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474162; x=1702078962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
 b=IBtuxtZon3rBmsGTmHJikYRNZlEs7dl7yUJhXcaZNSd+upPZ7TY7j5fAuGEweqwN5J
 oaQtINSW6/p9cX4X9/OGWXrjsDDNZKKr+TdQFo+VSayOUyLWHvADbY9Tc7bTh5wmroSG
 cn734Rdv6IXoadCLxV5+nYF8t+zkfToXzpws4xUZPJ7VQSp87NuoMzdhwn1Q+MASenwF
 BNtx6SzwukzxNUVQTzCLygRLPaGTo5Jd3UJN8XzuUnJURrhdOrv6Me3QgSUA/Bh4Br5b
 MBsKA4EIxgs/sqh1YiJA0fj4AghvumqobTBh+qaK2hpx+toSFz/j1ufhERlS0x4n6DPL
 hXYg==
X-Gm-Message-State: AOJu0Yx968LXojr7TsMeA295HEfDVg6hfxf9ePjQ2iQrCcLQ4FjDY8xl
 kG8nfRJaE/jDTvPFDgxRvVoVig==
X-Google-Smtp-Source: AGHT+IFVxIG599B/qmVK8nvPueo1AL+dGV1zyGuHDAAkXVB6v+C59YW3slMPcO1HEuPyeEum3M3jDQ==
X-Received: by 2002:ac2:58e6:0:b0:50b:c88a:bca with SMTP id
 v6-20020ac258e6000000b0050bc88a0bcamr690043lfo.64.1701474162472; 
 Fri, 01 Dec 2023 15:42:42 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  2 Dec 2023 01:40:31 +0200
Message-ID: <20231201234234.2065610-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2a9b2cf2c05..f9586ddbafda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -248,49 +248,51 @@ enum {
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
  * @version: qseed block revision, on QSEED3+ platforms this is the value of
  *           scaler_blk.base + QSEED3_HW_VERSION registers.
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
2.42.0

