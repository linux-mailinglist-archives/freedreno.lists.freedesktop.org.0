Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E359D736A6F
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A7410E2C2;
	Tue, 20 Jun 2023 11:10:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3866A10E2C3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f955def3a5so230924e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259441; x=1689851441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tkWRn+h6xkygImqtaQx4KpYutKkbF50StX6n/eitmXs=;
 b=lE6PqAGie4zRPIrct4WYU6mFM1dSyjOBhre5QMlGi+1OgovgiTbMbF9KA6VEIcxl7G
 PER1ypnwevSf73+x7HX6akXnluMZySomV9SjYtxFLiRUeuuedCRNLDNPynRi/16BT0ae
 j5spkYsWbFF3Af0//7s6CkLonhsB7a0BVsZPtIToQdFUEmG7vgYXSuwwcfsomcV6rrA4
 lL7tva5ESLKtXfS26axDwSns9PzNqog50lHHCnDH1vb1L7E3X4dyIApBw4acVAt1m2Uu
 0F/e3hSDKFEeWDUZi0l+lALmLoiZeeaqDzTctKHeknLd/RwmQ3362WbQSGc8xS3rtd4r
 40og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259441; x=1689851441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tkWRn+h6xkygImqtaQx4KpYutKkbF50StX6n/eitmXs=;
 b=eBMEtPZ8QXiPfUtdy80Ghh/BNdx/MHlrKVNZbrd0bvZvxEZSt8Lb/+DtTPSMQvtoDp
 9Gvb3m7z3G7S4obcPOxlRH9iMF46iCQDlT2EnXY+9ebLs8gEG/l8+2f+f/WQhjeb75IK
 1s11bfUSlrPG4e5XOBjLhU6RjoDBvcGf3KSDd1aZzBmJ22++i6j7AtzMmZXfzWw0eDuP
 xh0IqiVzHQYHnt2iU1gp52t4ozHHOSUz5+/0kCr4mtlBPLBjtT8vfg/2LTXhykrUKOvB
 xW7GD24N1HkpS6j3QZHisrpNsP2oxzpeXPCTYV9PQ6Y/XLYluQwtoIGQJpQCQOvafr5h
 WxWA==
X-Gm-Message-State: AC+VfDy+VrDdibvcix8F5B/rl4YDWkemCZEAh6/qSPbpbPBiPut2Hudv
 II/DE/BOKAGP6oODBlDiFwUqqA==
X-Google-Smtp-Source: ACHHUZ6qh4vOEEaDkBhVbqRlEWEdV2B2RQCdSMydYT+x2wOTNIb3qdLZHsAaDevP99UE9evkW0UHeg==
X-Received: by 2002:a19:6452:0:b0:4f8:7524:8431 with SMTP id
 b18-20020a196452000000b004f875248431mr2673772lfj.44.1687259441623; 
 Tue, 20 Jun 2023 04:10:41 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-1-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1618;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nFCkHKYu6fZpo1oSnNEiddoJoyEVOdH0h7thI2vrgRc=;
 b=nRNs41vgr+n4vunmbBJGhbFUhF0rOqAyzhYIrSjBneYnE0v0zDOxr59b2gyZGFeWygzWk4kvG
 lAeBkS8ItJnBMVlRG4ufwqSIzZt+uXkEJYGprGmhpUrCCrRH7krksb9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 1/6] drm/msm/a6xx: Add some missing header
 definitions
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
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a definition of the GMU_AHB_FENCE_STATUS_CLR reg and CP_PROTECT_CNTL
bitfields.

This may be substituted with a mesa header sync.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h     | 3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 4dc3be6ed45d..1c051535fd4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1166,6 +1166,9 @@ static inline uint32_t A6XX_CP_ROQ_THRESHOLDS_2_ROQ_SIZE(uint32_t val)
 #define REG_A6XX_CP_DBG_ECO_CNTL				0x00000843
 
 #define REG_A6XX_CP_PROTECT_CNTL				0x0000084f
+#define A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE		0x00000008
+#define A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN		0x00000002
+#define A6XX_CP_PROTECT_CNTL_ACCESS_PROT_EN			0x00000001
 
 static inline uint32_t REG_A6XX_CP_SCRATCH(uint32_t i0) { return 0x00000883 + 0x1*i0; }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 9ab15d91aced..fcd9eb53baf8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -425,6 +425,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GMU_AHB_FENCE_STATUS				0x00009313
 
+#define REG_A6XX_GMU_AHB_FENCE_STATUS_CLR			0x00009314
+
 #define REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS			0x00009315
 
 #define REG_A6XX_GMU_AO_SPARE_CNTL				0x00009316

-- 
2.41.0

