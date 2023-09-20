Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188297A8F90
	for <lists+freedreno@lfdr.de>; Thu, 21 Sep 2023 00:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58DB10E54D;
	Wed, 20 Sep 2023 22:46:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EE310E545
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 22:46:11 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-530e721f077so281267a12.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695249969; x=1695854769; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
 b=lIr4v5sQlqZL8Xnq2AG/p/tZNbgL0MD13YFhz2AYkSUxu/ihGcFQEKwSukQLbYFUSU
 yR4bXBspSNW1zhBP/BB976pD+6951RzINjvMBvUpEicv3v/l2+bWZNKvdhSvfgUbr5xu
 THuDQJsg5hXjQKfRmaWFB7O3/fTxM08CZzS4z45BbgkmEX/m+ev4nwT75kxuTD12am71
 Zga08z3qm+QE424BJ9AARk7QWGJupDYX7rfWPFr99jLZ0SwZM6C5CzDhpXbRLKHe27rR
 lpZD0w6d55XZDnn77855Ngy3+QTSCtckuZ/UEYVmjqwkcckJDd3TiXmUTdA6sVymdPrr
 Kzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695249969; x=1695854769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdSuAkG4VTCtPFnst9Jv9C/wFXy4KDDgAI8d6hl528I=;
 b=UYga5WKoM4dCZTJF478sVcUHNBEMyyU49tp0frZuGKoL2aD/Zkp3ww56PJ0hBSLPjq
 u2wRHXfv0NYR+dLTuaQXjoSDZsRKmdqioOlc1YMdRVpzgo9x863b6YPjALdEuvfRcY1P
 sls3ZWhQe4/MXq6YGaxkRAG+66B1loG+x/UTrtSwDll3O8UDXsFU0OnC6j22MngxA4Kv
 kjSAXWMKvO1VjghIuffzW42NiftBBEZJvC13GaX4Zxu4JMMkMug6IBA94f5z8lNLP0mJ
 BjMTblgiPiIxY1fST+o8ZH/hpCsQQlR5l675q5kTDuVKXyoUNoipz+ufCZovZMBizZYY
 CNFQ==
X-Gm-Message-State: AOJu0Yy9Qfs/Gw/BrVOCroRYS5AaH7lO66AxUu1Vs0DteX6Nrr9tEUoW
 TmVL7T1V9F/bXCSsnD1rPRkkZQ==
X-Google-Smtp-Source: AGHT+IGmn7SRDvmNps2xltWiAV/8ypq3MJY+6zz/ooTGSLT7+Q/E1kHCXDOP6lmDewqMh5Dw1MUueQ==
X-Received: by 2002:a17:907:b609:b0:9ae:61d:4248 with SMTP id
 vl9-20020a170907b60900b009ae061d4248mr3049732ejc.48.1695249969770; 
 Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 21 Sep 2023 00:46:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-2-6912a97183d5@linaro.org>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
In-Reply-To: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13-dev-0438c
Subject: [Freedreno] [PATCH 2/3] drm/msm/dpu: Add missing
 DPU_DSC_OUTPUT_CTRL to SC7280
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DPU_DSC_OUTPUT_CTRL should be enabled for all platforms with a CTL
CFG 1.0.0. SC7280 is one of them. Add it.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index dc3198335164..b6a59d7b94c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -164,7 +164,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
+		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN) | BIT(DPU_DSC_OUTPUT_CTRL),
 		.sblk = &dsc_sblk_0,
 	},
 };

-- 
2.39.2

