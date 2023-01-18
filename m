Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F8671087
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F5C10E630;
	Wed, 18 Jan 2023 02:05:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682410E62C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:04:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mg12so7489199ejc.5
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
 b=TzQ1sMwB1RC9DxUo+AdAxkjIchDRZWROV8NmIYXgAIIm8tGAc+WZF8v7f+SI7u8QZ0
 Fw5IC5+qfNsgpSfSztb5oRoMtmORO249BvgasoG1V2PrHf+OCl+LUGX5K7Cbt/1bmuGx
 qIkfQOTY/xHZFFiSE765QXxPbHXnNysp7kftsNWlsx1htxxk9pHxi7VFgT1U3AvjLidJ
 bziVaQlZSweEy4woXQ2c8gmJsvceZpBcpcPDyw+tVNjnXFnWR47AvYkFhVnCQFXMuHF+
 pmp0xi6vaiuM12lj4EgY3vfiwFAjH8K26Ak76Hf8KU/MOzt7e6ikMLPF2AKxsyppOfgO
 YTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
 b=6PyIZHYKY20yIMieBw6SiGbl5bJKO87a+gzm/daIl5DWZx9qYeoiWAD/cNB3/F8N2/
 f7BDVK+3tLMZs8amDdIX/h+YDF+PkWLR6zdjOlhOzvqXtKPXJa7sgrOz8EOGJkjq5puW
 8viW9zL90AvpoElbYsM0Ee/5rKHFqayvqebZ+B7r8AFHyxCLYH64uX+y9JGZx+PbFg+h
 /fVrS8WhkwOPXFLYYsiS0xLRgcR9xNt2l3YKN9H+WWZj1G/S1mVR7QdRYXY5BFzP0orB
 QFlQ96vuFoAa8iSNoyKv/Czvp93yRtdEvN7nCz6zlJy6CSiTT2RW33VDYLpnGQHzdVQW
 ndRg==
X-Gm-Message-State: AFqh2kpVs2QGvwsJaBoQ2pEYz58WIDEpxLn9OQ6tZtSh22SZKjeutqUw
 qDAGNQQSnkUV5ABXCjzkr+akqw==
X-Google-Smtp-Source: AMrXdXtiEWdKiTBtULSL3zbwnQKxj2N+QGGIq/7/7UHhlqWC8yXA9vnF78LmQUIn8hmcExxnmd+/8A==
X-Received: by 2002:a17:907:9885:b0:870:7340:b770 with SMTP id
 ja5-20020a170907988500b008707340b770mr5118885ejc.54.1674007497848; 
 Tue, 17 Jan 2023 18:04:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:04:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 04:04:55 +0200
Message-Id: <20230118020455.1689929-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: use sm8350_regdma on SM8350
 platform
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

Correct sm8350_dpu_cfg.dma_cfg to point to sm8350_regdma rather than
sm8250_regdma.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3d0fbc1746e2..e6618e678384 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2737,7 +2737,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
+	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
-- 
2.39.0

