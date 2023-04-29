Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83FF6F2202
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 03:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137710EE42;
	Sat, 29 Apr 2023 01:24:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEB810EE3F
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 01:23:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so357463f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 18:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682731436; x=1685323436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMTg1W9FzftioxMCISNlGed9GIUyXWxjomoAI3Jy3dY=;
 b=vcjN67ET9nnTv65zioikMGVzqybE48WiifidA5vDmlEUrVyRpIOS3YHNsvFIdN8EDr
 KPIQrwTBGbbqKofQAzuZ8E5QXsAyRXCAqUwblop7X23nwCMwV7xDvpbvdKOqUJrJuYBJ
 HQMNJ/5xbpbCvKf+5DMr5x/gvoqpEmU3gpjrF/4N8lhSe0jT06iubLxy+JtvHAiu0Lqf
 6Bcd7tl5OPZAmwzYK7SkC6QAdHvifB7CE6urPyEd4RQzavE//Mj5XH6HZzOiA6nFOUUt
 21hKU8eLa5zGehXIHy925pE+WJVLDVGtnL8XKuL2yKSXcgzczj9y0ArhGUvo6QCvDehX
 CjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682731436; x=1685323436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMTg1W9FzftioxMCISNlGed9GIUyXWxjomoAI3Jy3dY=;
 b=YYmKN4sJNSSSjpZZVUDEkr4iin9uzm5dcxp8lik+VR7GceKK9NslwiR6X5atXStosm
 L3jEYmxaAXDJrXZMakb+R6n2GXtHcg5+pefxvSrTa3hOWLUdBw2DojTopKcHHGN3EeIU
 ylieZl6SWpVyqBQFtVnoHfNMekv0HYozM/wTh0SzrC5IlJ5qOFOTba5jElj4diGd64Z2
 O0I2etA+pDffvKXTImW44xHgW75aDKPFtdi3HDb0ki9zJrtgJmOQwzxMy+hnqXFQE4+w
 /qvF70m2I+13wnJZDcDaZeZB49OJxB6sdEKcv7BEffbgJl3tQodSAFWH13LJXcJ5XrjX
 DX5Q==
X-Gm-Message-State: AC+VfDydXyPBydn4ho+EGiBYFQrezTkqRcryzEcH8xz/QIPpBUiGFpdF
 CrVktdbL9F34VvPc73/wu+p4Cw==
X-Google-Smtp-Source: ACHHUZ4rnurd+gniKsJNzfAaLJtqgOrLlxdRy1nrjqF8b2bM4Trb1FBBmjy8E4W75m2HIKq9mK7aYA==
X-Received: by 2002:a5d:4147:0:b0:304:aad4:b1ed with SMTP id
 c7-20020a5d4147000000b00304aad4b1edmr5494292wrq.13.1682731436544; 
 Fri, 28 Apr 2023 18:23:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm12983554wrs.67.2023.04.28.18.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 18:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 29 Apr 2023 04:23:52 +0300
Message-Id: <20230429012353.2569481-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/dpu: access QSEED registers
 directly
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
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop using _sspp_subblk_offset() to get offset of the scaler_blk. Inline
this function and use ctx->cap->sblk->scaler_blk.base directly.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 27 +++++++--------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 83a091f978e2..37cd5f4396c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -149,11 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 	sblk = ctx->cap->sblk;
 
 	switch (s_id) {
-	case DPU_SSPP_SCALER_QSEED2:
-	case DPU_SSPP_SCALER_QSEED3:
-	case DPU_SSPP_SCALER_RGB:
-		*idx = sblk->scaler_blk.base;
-		break;
 	case DPU_SSPP_CSC:
 	case DPU_SSPP_CSC_10BIT:
 		*idx = sblk->csc_blk.base;
@@ -195,22 +190,21 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
-	u32 idx;
+	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
 
 	if (!test_bit(DPU_SSPP_SCALER_QSEED2, &ctx->cap->features) ||
-		_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED2, &idx) ||
 		!test_bit(DPU_SSPP_CSC, &ctx->cap->features))
 		return;
 
-	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_OP_MODE + idx);
+	opmode = DPU_REG_READ(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE);
 
 	if (en)
 		opmode |= mask;
 	else
 		opmode &= ~mask;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
+	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
 }
 
 static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
@@ -416,25 +410,22 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format)
 {
-	u32 idx;
-
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
-		|| !scaler3_cfg)
+	if (!ctx || !scaler3_cfg)
 		return;
 
-	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
+	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg,
+			ctx->cap->sblk->scaler_blk.base,
 			ctx->cap->sblk->scaler_blk.version,
 			format);
 }
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 {
-	u32 idx;
-
-	if (!ctx || _sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx))
+	if (!ctx)
 		return 0;
 
-	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
+	return dpu_hw_get_scaler3_ver(&ctx->hw,
+				      ctx->cap->sblk->scaler_blk.base);
 }
 
 /*
-- 
2.39.2

