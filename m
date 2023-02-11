Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E596934B4
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7AF10E3BF;
	Sat, 11 Feb 2023 23:13:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BECB10E3BF
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:08 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qb15so21887892ejc.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
 b=jWKuQ8GMbk3Vj84PFPIlV8S0d8syG4d1X2kNZpL/LCS9jlWsM4rRMf72B959nPQnC+
 ngBaCegLGXtJEt8UgYkCtHT8Cs9VRuJMdz0x95fwP0yMvhDeLDKZC/L7uIGaHfjoMcLq
 jFDyDkJwZlFQE8GaNVn+rhT2PcGR0nrIkSaIdNIk+fIMrCuki9sHwH9h+hXRoJ3fYuRy
 O4foa34Zr1gCD7lmlFF/WTkJtV5jUKPECQOlTBllRcA0OP/2HDNmRPeTx9oec4V5d64k
 ceZHXn1XOhcSFw21zawYhUpoZw7/l/bqq21c9KGC2WgIMq67wMzbOiXfLEezIuVDBEdF
 47YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
 b=X4iKBF+CkY6W+/qG0ZaUr101PO124vp5NHwR+alXA0blzbTITZx5Nfn90gLN2p7QsP
 7iJQGszBzPjsRrjdBmcnCC0T3JvP+S+OxskyHjhbWBIfx13SxhRoGMk9VVu82Fi/G9qi
 bejXT5/ZcPJEo8yRrWM72tEnUB5QtTahLcC0qBGI10KqVuTnCJ1eu1osWYX0slrT+XA0
 YUCfWM3lnouJ5qi44wA29viSWPZb05bxtHOQvPosX2j4c5gQOP/Jdq4NMytM+q2dATbv
 9DBFL4I/q31JbMTihxue/p0BpLaEnpNaVJ7J97Z9IY9Oy36KfTCCjlhcVPAz3/iICU3Z
 uv+Q==
X-Gm-Message-State: AO0yUKXzL/UEgdl7AiynZ2BceeTdcFSMsa/j79e0sVnaMBOCCtnaJVoV
 Mii/3h38qMnijcYk4t6Stc1+ug==
X-Google-Smtp-Source: AK7set9cqu2tXMqI/X5iLt9VzGRkElq3axtjm92kB97HjZi4gbsdCHY7Fj4VQofmFJbxPCqJbvNygw==
X-Received: by 2002:a17:906:3792:b0:88d:5081:e9f8 with SMTP id
 n18-20020a170906379200b0088d5081e9f8mr19468357ejc.15.1676157187817; 
 Sat, 11 Feb 2023 15:13:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:14 +0200
Message-Id: <20230211231259.1308718-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 05/50] drm/msm/dpu: fix sm6115 and qcm2290
 mixer width limits
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

According to vendor DTS files both sm6116 and qcm2290 should have
max_mixer_width set to 2048 (DEFAULT_DPU_LINE_WIDTH). Correct it.

Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47de609e2279..192fff9238f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -318,7 +318,7 @@ static const struct dpu_caps msm8998_dpu_caps = {
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.has_dim_layer = true,
@@ -356,7 +356,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
@@ -1520,7 +1520,7 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
-- 
2.39.1

