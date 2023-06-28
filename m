Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84574198E
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A4210E3A5;
	Wed, 28 Jun 2023 20:35:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B8310E390
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso101910e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984533; x=1690576533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xtpQvzp4RpyUG/PwqaST+5tYMMgpC5C6Y/5Ihh3AMLQ=;
 b=eRUCKRekrZjHJpsZkazD1CQsku0JiP3yeQQhB5BhMUaety7kgG4AFhrlgwRlP8ji1x
 XgQwJiAJXpDIkcYmuS+KUQSeskxt788EsBO1/wZY3cLqaGdcE9yS3s2Q4QWsQtbbOlkw
 rfZMnSrOe96vQqCsOmmsWuzaTAPQFWa2xCj6wSHhxjglkqhVEOpGAJzRh7+DL1imZvAN
 79/7I/UnYL9PytvoGdwQUjQB+wN7OwOWwahkR6SpKab4ldhjozV0n2NlDyz+zJwb9yB9
 BfjkhHZAISphtlDFA5MjK3kacWO2eq9TJUF3lQ2f/qlLxqjo5E/FX9I1mDM/xbYlh/n2
 o9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984533; x=1690576533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtpQvzp4RpyUG/PwqaST+5tYMMgpC5C6Y/5Ihh3AMLQ=;
 b=J5/xMpmK7oBZScodpL0V9WUMCtse1BxLnnVrN8L9akL6/0dAC+7KEeVYQnXK5zYQCo
 nFevdZtoHAm70e4HaRRLgHmX3o1Plny7rcABwPRmvKMuf1LSMKQLDCiYU70SqN8Za7xJ
 OYJEyRjEah/O9LZ2tJEU4epRmy+djgaHfVneebYudze21iOwGE0E22cxv8BXOoA0zwql
 GveA9U+nsswQhvWs7uSXNWsUUaFiMUpQkAArHsXD14unSvWkVWdfQqYQYyePnBQ0OV6L
 uXsnk9y1l9X4kfgYDx192UwsqCvkh8/yqRhoSGmFDXSQYaAi2hMGzcF8Pg22m9vWlAxK
 EuOg==
X-Gm-Message-State: AC+VfDzM785lyC4iPLnA7osVjORthkZRDp2uKoJcHj1RsamkFC//szdA
 4nYJ8lnQjHoRKuHw2YpJsDLxlA==
X-Google-Smtp-Source: ACHHUZ4uGYGv5RouOZ7IOh/HeB4Lh6M5iGT2Ode+APGSuhS8itbLrgq/rOdeNAb5HXfybgd6tpS7Bw==
X-Received: by 2002:a05:6512:3d8b:b0:4fa:5e76:7ad4 with SMTP id
 k11-20020a0565123d8b00b004fa5e767ad4mr9970258lfv.10.1687984532977; 
 Wed, 28 Jun 2023 13:35:32 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-5-a7f4496e0c12@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=909;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+c+we8nCMly7yIkJ6dm5RdbFwSno59/Ex2lT1jIgyL0=;
 b=EXC4gaMs7g1fnr8cXfio+6LPLGT4COF/g31FpebXZDdZ8J1XKs2kcr74BVY+zK0BoOUiw9mvT
 P1Ilely/ODtBXuhV0Rf+KSVfXzQKUvdj0LNK/KbYosjeKMVEq2kYOHb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 05/14] drm/msm/a6xx: Introduce a6xx_llc_read
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

Add a helper that does exactly what it says on the can, it'll be
required for A7xx.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 488c69cf08d3..a70e36178058 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1740,6 +1740,11 @@ static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
 	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
 }
 
+static u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
+{
+	return msm_readl(a6xx_gpu->llc_mmio + (reg << 2));
+}
+
 static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
 {
 	msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));

-- 
2.41.0

