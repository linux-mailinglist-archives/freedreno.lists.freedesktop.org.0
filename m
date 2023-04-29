Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0576F2203
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 03:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327F410EE4B;
	Sat, 29 Apr 2023 01:24:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EDD10EE3F
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 01:23:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so3026595e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 18:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682731437; x=1685323437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XpHRCDl8YUqkvzGdi9xj3a31C+ZLIPISEtnli6YWyd8=;
 b=u2t1BbsEvLJsnd4haLznJtlvYjxKqBGVHQAPIb3m371bwOG6enT5Ukd1Bw9aIcfsxt
 IL1y003mSznP1CBJfmRDEvIuf/qQYUePPKXw+s2wr2BaNj2DjjcoWKjVf9/oHFqwz8Uq
 RPWXYpmQl24WllwEYSTsY7jd2TIk2Lmw2tmLOskDahaclH2E+AsD4mdlWYbAuhTRh9y4
 aETvUyggCsDlVcN71ehfLa+9O5ydXLFgM06Y71q/XS5OCNCN1hXIqeDsvVd0YrumvMOS
 JXod0tfaucW56Zmiz126LPbg9oo+Uf4Hgblg4956FEC4iCL2ibbO1hYaYmZ5JxIDdgkP
 MNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682731437; x=1685323437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XpHRCDl8YUqkvzGdi9xj3a31C+ZLIPISEtnli6YWyd8=;
 b=Y+/0NU1w4uVrlXoDpgTOpT5wY2HYDfgLGLuMN6kVaAOD+vgA0+GZQyqSmNJFz1Mx1G
 jiZZP4mQzELJrMQoJwHnHKVpoJt8YzqJCPl4ZwR60qHNa9IlW3gYZdyPRTj7kUTH6Dxb
 9kVsgxCZM5VGJaxmXHyWgoDAXJetTYMLnmvX4wbjh5PeaGdxUOnho4Lutxoa/sOD9Eiz
 iPoZalAit4P6hRCn8z8YSdfrd4x6AM8QyGRkC5n6l8NFwPvQgLgU8iITpDn6Q17E/FHg
 /aeSN15jI83bsbAe5Azh2rT75DHhZz356uUgn2q0wPlPJnjFqYvqRSmHaS2wuN9tmad0
 dSVA==
X-Gm-Message-State: AC+VfDw2fczp6Pn8nvRjuSbWsp10PFeexEUuhHS7/wGSBbhoMxpTVP40
 QZED0Pco2eNrfeXWDcO1tP3SWA==
X-Google-Smtp-Source: ACHHUZ7UGhVk/hWFxV7349dYMYcFwWyPjAS+bnGonW90J8FBTiYvv5a9C69sPp7xss24J2zXiOt5Gg==
X-Received: by 2002:a1c:f217:0:b0:3f2:5be3:cd6a with SMTP id
 s23-20020a1cf217000000b003f25be3cd6amr5096302wmc.4.1682731437417; 
 Fri, 28 Apr 2023 18:23:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm12983554wrs.67.2023.04.28.18.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 18:23:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 29 Apr 2023 04:23:53 +0300
Message-Id: <20230429012353.2569481-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
References: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/dpu: access CSC/CSC10 registers
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

Stop using _sspp_subblk_offset() to get offset of the csc_blk. Inline
this function and use ctx->cap->sblk->csc_blk.base directly.

As this was the last user, drop _sspp_subblk_offset() too.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 43 +++++----------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 37cd5f4396c6..fd9714659293 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -136,30 +136,6 @@
 #define TS_CLK			19200000
 
 
-static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
-		int s_id,
-		u32 *idx)
-{
-	int rc = 0;
-	const struct dpu_sspp_sub_blks *sblk;
-
-	if (!ctx || !ctx->cap || !ctx->cap->sblk)
-		return -EINVAL;
-
-	sblk = ctx->cap->sblk;
-
-	switch (s_id) {
-	case DPU_SSPP_CSC:
-	case DPU_SSPP_CSC_10BIT:
-		*idx = sblk->csc_blk.base;
-		break;
-	default:
-		rc = -EINVAL;
-	}
-
-	return rc;
-}
-
 static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
@@ -210,19 +186,16 @@ static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
-	u32 idx;
+	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC_10BIT, &idx))
-		return;
-
-	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx);
+	opmode = DPU_REG_READ(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE);
 	if (en)
 		opmode |= mask;
 	else
 		opmode &= ~mask;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
+	DPU_REG_WRITE(&ctx->hw, sblk->csc_blk.base + SSPP_VIG_CSC_10_OP_MODE, opmode);
 }
 
 /*
@@ -530,18 +503,20 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 		const struct dpu_csc_cfg *data)
 {
-	u32 idx;
+	u32 offset;
 	bool csc10 = false;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_CSC, &idx) || !data)
+	if (!ctx || !data)
 		return;
 
+	offset = ctx->cap->sblk->csc_blk.base;
+
 	if (test_bit(DPU_SSPP_CSC_10BIT, &ctx->cap->features)) {
-		idx += CSC_10BIT_OFFSET;
+		offset += CSC_10BIT_OFFSET;
 		csc10 = true;
 	}
 
-	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
+	dpu_hw_csc_setup(&ctx->hw, offset, data, csc10);
 }
 
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
-- 
2.39.2

