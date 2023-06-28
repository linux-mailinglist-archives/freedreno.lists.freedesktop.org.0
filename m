Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82BE741987
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD8110E397;
	Wed, 28 Jun 2023 20:35:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E52810E397
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb41682472so84808e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984531; x=1690576531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bTNFQ30TyWOh9qaBR5NIxyfhe015j8OGjUNEwiBiUBE=;
 b=rNY7Sp4fiyswXrormwfh3F4jUm/yunYpxnZlfQAtJ/AvZPwL+vV/wGyWr0K6lFNSda
 5Hnu/6iuSef3jS7yX6TAxnxMcNPz6sZfU1QSLufeSdTgukQkjRdZ9AfgdHsIgC3P6dfq
 NulYenOtGjDULnywxISy6OVlUUJCpo7UaWVW+I/YFy5Vfc68HvgwZIWH7VSpy3P29vUH
 N90DlmQqoezeJmq9A16h1NMlYQNA37E1gptfpxlr1K9c531O5D4f/+aebzTPzgQtbKVa
 EFI9h4UzF+BGWfgng/jgfg3UuXszlcLZlb6fKp8hDn50SGZbqWtGm/mY7i/UJ4EdrOSs
 kQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984531; x=1690576531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTNFQ30TyWOh9qaBR5NIxyfhe015j8OGjUNEwiBiUBE=;
 b=FooUYCtQR33tnGTotFFqtQ/6vlRQg3RXouhB8wkZGTitCrGfv1phWTI+PQXb5wZMrL
 FcV52YvjiPAeu/vb1BJhuYZzZvlsXUrg2Zedy5gy8yF/oFfvOV5VtmywdcjQvJWCegCw
 V+XHxBDmmH7hWVwO+7wucyPc3QBPTBS3a4rPbAJzm+MyI7hSnXQNYJppU7TeeVX7A+Oe
 KSm7FxEoX5O4In5Gwbt5EBJOhbNl7wccFnAUCy7erUoFqEVyYw2PvZCnKhRPk4Y4cFLr
 jn23pbf7w3GioXaGdNvzboImVmNNchqWYDRsvV2+ECN5WCazhYuWQXlvPHZQCEHPd95w
 Vemw==
X-Gm-Message-State: AC+VfDxXk5fFg3TTAtngCzSwoGGnvsK7kKnucC8uqoXBoYi5acYRKznl
 x/m16Al32gV4TExrVWU93+y0WA==
X-Google-Smtp-Source: ACHHUZ6Wn36i8NGzMdAhcrkKlBNkXjKYXdU0GrHa0OVnjNDzk4TrXTIlgTfV/UnI4ojOLmpTWmX4UA==
X-Received: by 2002:a19:6445:0:b0:4f8:74b5:b4ec with SMTP id
 b5-20020a196445000000b004f874b5b4ecmr19816568lfj.41.1687984531636; 
 Wed, 28 Jun 2023 13:35:31 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:31 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-4-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=2612;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wKfWUDd2PVjs4yPffZ0/I61PRILfdZFsM/DDl//zeKY=;
 b=Tvw1x5Y2X4eZJDD2DwED7rXifTpV8rQciZkQwCwVkXm/qQ/OJEmH0+OFlZfs0P8zKhsW+IjMe
 RFcem22jVsZBbSWZI+/9EWnp/Xj81vBbz4jlWgkO8pcx/qpCtqejrkY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 04/14] drm/msm/a6xx: Add missing regs for A7XX
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add some missing definitions required for A7 support.

This may be substituted with a mesa header sync.

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
2.41.0

