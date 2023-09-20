Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372757A8F94
	for <lists+freedreno@lfdr.de>; Thu, 21 Sep 2023 00:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5326110E550;
	Wed, 20 Sep 2023 22:46:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000F710E54C
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 22:46:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99de884ad25so29480366b.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695249970; x=1695854770; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=faQgYvcRr+Q8Wbd4/aYnbbCq/6v22SMhkw9gB15Q9b8=;
 b=KmzdblHjiT+Wd/Ovb7rrkHPMe6aSAebfZy0kYlKg/6W4lVHHxF/YkX+dRCuvwuyhKT
 b+8MOZv0vrze3MU0GIhqbnPIYUwlayT35WT9SUwYp42wPinCBEw0x8x8zsW8kx+KKPy9
 Aiu/QeWSZq3B+82vuEjpY+0l97/JIAg4xfEURpQw7nwsIS6cnO/B8mBK1wd+3RyCb3Yl
 PjK8OJZk68wgB5xX8LjXqe3LhR//mHXyk9hLFw/P9v+dLzb8P9lu9g5jJo4ixvf/YXZp
 qIRgOtNCKIkPX4zdTLKV85ZqTXvHH3lfR2YOqIQlmQaSBrHIe/k0uyKCwoFbi2kzWqg+
 zJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695249970; x=1695854770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=faQgYvcRr+Q8Wbd4/aYnbbCq/6v22SMhkw9gB15Q9b8=;
 b=QVI0M62dGJjVT2aVWH/VAqRIza8c+2bHdNbsjISzie+Nz+5JfFiHhsDu4f4/aHOvXA
 U0psIBhM8BVHiyvEyfol+/zVGcC6BNEZGh7gTvfnmIQ9qL1Zvxkl//1jbRK1199AngOp
 bfTIXcbd7oDihbZlxnsz8z69H/evJyQNe7rf0rTAF8V3bnZhu4aIR+FmpswFJX9Di0W0
 Lr/tglITjVa/FPwy19KaFy/r6ufgu2ynu2NYxEp1154w8uNJ5XXNt9idwFNxukdDVeVw
 5NQpbcO9w+/LrgZ/PYT5TTz9FH+tFXedtaTVleLwhjszyjqVfa2A6vS/BpAd95lZ4gly
 SbpQ==
X-Gm-Message-State: AOJu0YxyG18n1MqBvStjxEodop2HAiBsRBzb0ez3/CYZUlQ0b9qqc1hW
 vGjP6Dp6omgDSdT7usuixaNB+g==
X-Google-Smtp-Source: AGHT+IF/hPFX+k8aV648zOqgN0vtG3qxUC8bAz53xmMS3qD7B68OhuVS57Zh0nXLTxheIifi61yA+w==
X-Received: by 2002:a17:906:3003:b0:9a5:d16b:6631 with SMTP id
 3-20020a170906300300b009a5d16b6631mr3561901ejz.70.1695249970372; 
 Wed, 20 Sep 2023 15:46:10 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 15:46:10 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 21 Sep 2023 00:46:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-3-6912a97183d5@linaro.org>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
In-Reply-To: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13-dev-0438c
Subject: [Freedreno] [PATCH 3/3] drm/msm/dpu: Fix SC7280 DSC block length
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

Commit e550ad0e5c3d ("drm/msm/dpu: fix DSC 1.2 block lengths") changed
the block length from a wrong value to another wrong value.

Use the correct one this time.

Fixes: e550ad0e5c3d ("drm/msm/dpu: fix DSC 1.2 block lengths")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index b6a59d7b94c4..de5e1a57a142 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -163,7 +163,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
-		.base = 0x80000, .len = 0x4,
+		.base = 0x80000, .len = 0x10,
 		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN) | BIT(DPU_DSC_OUTPUT_CTRL),
 		.sblk = &dsc_sblk_0,
 	},

-- 
2.39.2

