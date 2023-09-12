Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883C79CCF7
	for <lists+freedreno@lfdr.de>; Tue, 12 Sep 2023 12:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8CD10E3DD;
	Tue, 12 Sep 2023 10:04:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391010E3DD
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 10:04:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c93638322so1163602166b.1
 for <freedreno@lists.freedesktop.org>; Tue, 12 Sep 2023 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513095; x=1695117895; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dFC/pTqRgOjYtF1eBy169/e4YScgRvybAMb04hqUx/E=;
 b=wIe41mS5zAnB3eb9RTa3IPrWMGzc1xgH/y1EF1XFuQOhQBjfmpu/GDZjA1lRgHkN63
 J+E9mtnLHn7T0yXlXdTbPaU6JODTut8ntqPpgvKdLWexmU5aYKPfKl10VHpjD/WpIfnb
 iLGqn2cpXMnkYn6ngBqzpJ2uaBZyepIVLAcGBKbUhsvvsC0yV7JqWu5XkSC1LeAAWfu3
 APLuxVnIphOsBJA4w/kuUPLbPwEzTH3KD8SWTxVlbQkOwckw8ba17C+r+YW6evq9C+/T
 qigOpgD1ZZOicuzX5Tkf8pFNoPsnN7F3qdbaAp+J/Y+D1UJaTs8UeFCT1AvFusDYhXPj
 ysDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513095; x=1695117895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFC/pTqRgOjYtF1eBy169/e4YScgRvybAMb04hqUx/E=;
 b=s7olTRMP9e9+0dUs97iLOPh6+fr1ySEXPZrlxPB04DjJpE3RDtmsNn5DhTgbW8Kh3j
 rTMsJXdqxBZk5EGzXXiYFSzvLvEeB9j5suInJ9b6qMNj/QhMmvjKhJpL1bfX6ySUIDtB
 hNMai9XDVuvxIi4LEqGFxGT900c/1PJARmlZKrNebfphFD3zICB4Yr0F8JgXUZQJSTvw
 zguIafFYLPjAUTBbtJk7Vna630MWAK7hJxkxXtHOllgceAE2f2cYaIqwJK6DztI2Q2LU
 52rZm/xjKBFsb4mGi1CPflnC2BQUZl4MmH2n8ahi/zTr/DAw7ox7ZhsutD0uvU5UkmDp
 BSAQ==
X-Gm-Message-State: AOJu0YyROuvl7uZgqCWMapRW/YlrkrO50jNFFxX51paj8Xa5EKd5r/3b
 QugjNaxraJvICulU3abvEyk4Pw==
X-Google-Smtp-Source: AGHT+IHaFrTOnGe34Jx71oU2QkuilYO1K5z3uHv2TibXV65+mH2tFFZHwn41s4Mp/ROS3NzwsObYCg==
X-Received: by 2002:a17:906:3117:b0:9a2:143e:a070 with SMTP id
 23-20020a170906311700b009a2143ea070mr2814335ejx.20.1694513095636; 
 Tue, 12 Sep 2023 03:04:55 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:04:55 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-4-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=2751;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ggC5Dp2QsbNqWJaD+04wUKh0iGm16iYbE0EVpFZJ6dY=;
 b=tfYF8uXLR1C62nhIcO11FEXvyFuZ+37RsdN0U6dB09ySn16LaPhcPlJyVR2qmbyJxGuq4lu/U
 VxFupprMeHwCT1rGaYAlWpOWzkVa7a+PNcj2OZCJO9IxNjVF7Axv9gB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 04/10] drm/msm/a6xx: Add missing regs for A7XX
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add some missing definitions required for A7 support.

This may be substituted with a mesa header sync.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h     | 9 +++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 1c051535fd4a..863b5e3b0e67 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1114,6 +1114,12 @@ enum a6xx_tex_type {
 #define REG_A6XX_CP_MISC_CNTL					0x00000840
 
 #define REG_A6XX_CP_APRIV_CNTL					0x00000844
+#define A6XX_CP_APRIV_CNTL_CDWRITE				0x00000040
+#define A6XX_CP_APRIV_CNTL_CDREAD				0x00000020
+#define A6XX_CP_APRIV_CNTL_RBRPWB				0x00000008
+#define A6XX_CP_APRIV_CNTL_RBPRIVLEVEL				0x00000004
+#define A6XX_CP_APRIV_CNTL_RBFETCH				0x00000002
+#define A6XX_CP_APRIV_CNTL_ICACHE				0x00000001
 
 #define REG_A6XX_CP_PREEMPT_THRESHOLD				0x000008c0
 
@@ -1939,6 +1945,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
+
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff
 
 #define REG_A6XX_DBGC_CFG_DBGBUS_SEL_A				0x00000600
@@ -8252,5 +8260,6 @@ static inline uint32_t A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
 
 #define REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1			0x00000002
 
+#define REG_A7XX_CX_MISC_TCM_RET_CNTL				0x00000039
 
 #endif /* A6XX_XML */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index fcd9eb53baf8..5b66efafc901 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -360,6 +360,12 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_GENERAL_7					0x000051cc
 
+#define REG_A6XX_GMU_GENERAL_8					0x000051cd
+
+#define REG_A6XX_GMU_GENERAL_9					0x000051ce
+
+#define REG_A6XX_GMU_GENERAL_10					0x000051cf
+
 #define REG_A6XX_GMU_ISENSE_CTRL				0x0000515d
 
 #define REG_A6XX_GPU_CS_ENABLE_REG				0x00008920
@@ -471,6 +477,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_RSCC_SEQ_BUSY_DRV0				0x00000101
 
+#define REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740			0x00000154
+
 #define REG_A6XX_RSCC_SEQ_MEM_0_DRV0				0x00000180
 
 #define REG_A6XX_RSCC_TCS0_DRV0_STATUS				0x00000346

-- 
2.42.0

