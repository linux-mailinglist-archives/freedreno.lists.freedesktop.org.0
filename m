Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FEB692D21
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BCD10EE74;
	Sat, 11 Feb 2023 02:11:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176B910EE6A
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p26so20141783ejx.13
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=peX0Hd3MUbZTRxXaxBuK9erOu86OezHmTR38rFHYkm0=;
 b=YWm4wbd66ZWAhomKVzJLUsZJNQEcEO7LPzrnKhH1sB55dCVEo2O9sqJGQxPllNHfyM
 IVjrQgqSddIJTmXF9I0y60RFAh2S5SGVdF4wGWZxZfUKFdue1UHAapr8EnjquPilQ83z
 d0UGrMh2xZXy1nU0jf08oFtNgmIg3OsBckAVCPXQeXsLyc4Wk6237MYBhYGaZkHPNaln
 Kp0gzJpoG+CvawSSXSbgVmCK5EroirWWW3Ig+xBjO9Kb2VvqUsSfJJdgM6lKfiUF32NP
 aq7Nzpah+gSmbuXOs4itqsyCCKFP5Q74kthXPENCz0+3kaCF52bd2tI9PHJ4SjmwuPR9
 avJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=peX0Hd3MUbZTRxXaxBuK9erOu86OezHmTR38rFHYkm0=;
 b=a3S64VP98peNQNz/mUMzl6tAz6V+sXVneDUuhKpAp7AcoXSi99uIylujcCu/iOrQKN
 va1Qg61v/LCx69rF5XDADIS3M4YFW1C8ra345miqSy+OJ1PdGsUqan9Y/c9O0r82l29v
 Gr2YNBtjfuAryJKAbgCIotRMke87oPvZ5rvn7Dm2Kw5dm8+rQZayM0fwk7iNX0gL257j
 EBMf2I7GyaStp4vR1Fh4v/jYzU+PKnB0UOqjQqJY0Rfvkf0AiFvuX0FnIBAPM86ZCMFM
 Q89L7+Q3Kn6WC/g88GguWmECt4guNJNAUlXC7sbO9AD75YWJVYtOX5nODPYRXEY3g4K9
 Yspg==
X-Gm-Message-State: AO0yUKV5FDPBDT3fuzYUVuPG2xFRsnB4plbvnbZo2m7zMnSCw6SVZ73U
 LxtKndgufq/tUd3ecREn49ObMg==
X-Google-Smtp-Source: AK7set/E1LUGPJmIPCdCkwWyy4/g5rAKo+8SUU3oO4vYg2wRsUwk4sp42J1AVm9rvUdPQ17/Q+Cp2w==
X-Received: by 2002:a17:906:3b94:b0:886:4ca1:39f1 with SMTP id
 u20-20020a1709063b9400b008864ca139f1mr17306559ejf.73.1676081483720; 
 Fri, 10 Feb 2023 18:11:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:37 +0200
Message-Id: <20230211021053.1078648-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 27/43] drm/msm/dpu: correct sc8280xp scaler
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sc8280xp. Fix the DPU caps structure and used feature masks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index a9df4c1a714a..7b0dac12895e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -10,7 +10,7 @@
 static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -83,13 +83,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
 		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 48ee66f52ddc..f3649ac9cc70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -435,13 +435,13 @@ static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
 #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
 	{ \
-- 
2.39.1

