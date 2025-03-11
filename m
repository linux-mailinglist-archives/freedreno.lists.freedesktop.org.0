Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA4BA5CE82
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 20:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E4210E66E;
	Tue, 11 Mar 2025 19:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N96Vbobe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB11810E676
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43ceeb85ab2so2846325e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719756; x=1742324556; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
 b=N96VbobeYfBxC7j4FGXkpki8h20cJ3yLjUC89ycDg81C5BXjClH2HhWWrmlvCnnREj
 McOl9uI3AUO3bBy4H8tTLYLboml8miHjsN9zMJlTvApYQhdSa+6C0BlVCm1dvH2DfCws
 tTmQUqe/JYTaI23CHSXwnV9DgBsCnF6lijLxLc7UlYKgyuCo4Ryj40YugGZGs09gGdZP
 En6VmvQea7U9V/rAWrIEQ/Qdf0eg9Ni9K4fxMtRwmsLLK3c851656541UQRQOBtjve1P
 lhbves9rcLiA3pzfGPG+o9MOW7JKP5dFhLrtHbfCIYi6zQfcYo3Gp06dQ6N0HxT7fpWK
 Hvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719756; x=1742324556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RcjB+241gLR6s1cCQ4uICqRoaXk8v/y0NqsWEvqWvyI=;
 b=N0683d48tZWqCLwuQIJEi1vuv65OSuL6SDnOE8AaAy6uKQ/0jfm1i5umQZAetxDbZ5
 M8Bx7ue3DeK8nMiP9CAlyJ+Rp51R4QxHa7+DYdjGXruyeJMeQKC406LLaIqhO84OZttD
 aTxy0g1thYN5H14U23ysbdDn8DV1ouyd57BBWcrp8/dmOkYEJmuXx8JQEV7JGDKbwM0p
 SXrd+d0MMMBLo82xWDKHm8XNtJ8LhbeueaO5HyFCR1wIlGrVfnciuspsyYszLUKbf/fg
 MZiTt0qaT9ZlKBpzE/g1C1RkLRQZh2DImyyUqH0Y8vDzRArh1RgtuOSd6dwzLLNBWqwE
 rjLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWo033BGZjNsvnCQpTPXD/ACbTjJijoQ8rLVIT4KVZPPEM1foEMj+Bru+BTKn5PtV/LjnPGMBsv28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEzCVxyQzcY97R0A4cJv+Ehaaa3RktTEQUbrVWiQGpwis2fJxU
 66F8fqJop2LT3mg2WwTUmTR27GkP489qOEm+P/M3NJIjOod5utrVW0YPLXpT5n8=
X-Gm-Gg: ASbGncs7wJxPWol1g2p0RD1kX1esAcEAoBsL3k5PT7JRVTU8/Ryj91QAVJMY9/V64lC
 12D/UtMO0RaFwVaT6VC/z5fQdobtR7bLBW7d12rUCUvJXJX0jehmd6cHlhaOsIr28wH34zyZklk
 SGLgHyUvX987fujdAoB9ZPTWl6GqTlUpGbakHEAt7t5dZefO3yg4BwpXopw3Ksc5OKGsxHDSx5L
 ai94Qkuu5LBjmZP1tszT2Tv9vPj9c725nWOMJr98b/OHUt7DUu0PT467WPHt0pmAg9lDh5PRVIo
 qVuyP9exhWgU/xTPlYkdKW/eRiNTbCJDL6Mg3ekHpRu0xdoO4FNGkV+PTIM=
X-Google-Smtp-Source: AGHT+IHUI/GfBvqMOBGLfMGJ5oC3n7CH3DWUPWiGMnSbl7+9ajR5P08W9uLIpwe5ervzERP38Emslg==
X-Received: by 2002:a05:600c:198e:b0:439:94f8:fc74 with SMTP id
 5b1f17b1804b1-43d01b88b9amr24028355e9.0.1741719756112; 
 Tue, 11 Mar 2025 12:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:58 +0100
Subject: [PATCH v4 08/19] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-8-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y6bWRccagbxiPugi9lqg3LxI5q7Luq+aGXW341tS1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IirZiMlFxIwx/kR+5CN6LQ3oI+wkm7qHAayp
 hUmAyRP61CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqwAKCRDBN2bmhouD
 1wb3EACZNeztGLSxAB1Jrehurx9bUz7y7xVphpXYvou6pmU5jzCVchBQAyL8H06dHtkF/USEAME
 PjWBgSX+pMv+XgZPHpS5LMcwTMbqhq+Wqkr2kcDK6NlJmcs73zqBXrth372YEkRA8o5GCdw8FNC
 Y6sJ4dZlEQ9SsrCrSX2zkKZqtWigfDoA7xT/t5YV+1CBKG8Fl4wT/6PMVqIdxZuuedrh16802jU
 uKsFObCjV7DbADi4TGkM3VobbZ4JNyUC+A5h9cTICYDPo2TZF2RRCazQNXtUnDdy+kahUi6mrnY
 vKBDezawNLxOzN1L2D4YaDKxBjNvULH7GF0kdSe9F+Wnqu/r9GIh/q9aa+7hOwe5ZzjtQA9WOjE
 8vgCEuSTwFpbBYOJoda2m+eLXLAXWyI+aCTnQm1LwFmfv6hoif5uOYEstvl8k/0U9itEvlKDtaB
 jhQBIEe7YH+FzNcofg1WXN14yOITrTbdj7Foz6axPodRVHweRunALci7Bn4pTogy5yOXoiiwrf9
 2eKLxrVAGWwACGfqaePe85ONfxCaDB/aYSKZnu9OKHaOQ78OTswV6BagZKrQ8EE2/yoBgCcnwBi
 GLhNs1AQy9dconnR8Q+137TWMtS49s/SqCp9cPq8azzW002V6nKJS4E91m72uSWWuYevbwpWaeo
 iyggg/4Vc6qXoHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 951d5dccab6faf34a519d06683514aea1ee6ef60..2ce59ba50ffa0d14eaa07e993fadf0f218390ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -667,6 +667,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0

