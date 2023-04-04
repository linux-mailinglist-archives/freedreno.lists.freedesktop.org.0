Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F06D623B
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64A110E694;
	Tue,  4 Apr 2023 13:09:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C52810E32C
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:29 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y7so1341406ljp.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhkclZ1bhKzHC4L5ZeiCogrMBS8g1rX6wAx5Z2sA5Vg=;
 b=a+ztErcBt+Q34G9DfH9VqeKAcLxMkHJl4gV9JO8kFN2V0CWvb0IBqOj3s7RgUC7slF
 Myeu0A/HDgYJZgS8qODAsVA9kunB76kBSyEs6oAtfBKmHVf3QAHsA4g/irrjTTAoTCuk
 iCXVqMiQuQ0VWmaeW6mfxAQOF6YF5WlDdYmKp784D0Bmg3QHremTsh/bCt6k1zWQuNXK
 Bu8fvNCHVaKojw1ZidMo9l6lDyO6YARGq8sDawyzBVvZTLIss+qanslr5gXSFsNzSXW7
 /op2++X+K8P10+s+RkWTsW6vz8LUjer2pFWOSL/e/63UWLAnlRPuyb1ngiA8rWaZw0DA
 S2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhkclZ1bhKzHC4L5ZeiCogrMBS8g1rX6wAx5Z2sA5Vg=;
 b=06ugJH+7QbXksnlsnxNqX9tOEZ1Eo6nKPfkh0KFvEHQ8QCskEbCyYsXuY7IpnNfkcv
 Cp9MLMfZFF7mRGqyf5/pPEE13n1tnpyxULs0hSmdHgsBCRQW1DhGFEZ7W4FOiwcioO4b
 ES1M5Mk/4Urxac2lMcFmm4z26HrckAPIR5v58ASEBFg6LslPBKYFEYLptVBRDIt7mpeD
 GeiGlUtj+42m8sF9FKmECO889ZLsXkE5tPsIV6oMN/k/DYk6xphk52KswySl/dXsZ9YE
 qwUQq0SqzF28YmkZb6M/aWYbtFnV+iojw4MJ2scscLOqZP4oWuI/YEVQIa7WdZHecDh8
 jAoA==
X-Gm-Message-State: AAQBX9cYZ4E75YfDfOaB8/8UhUficSvgqi6UAp8NnZiS3Ik+UpxGNvNo
 8jGnLretNYKMwseM7IEJ44QRYA==
X-Google-Smtp-Source: AKy350awjvvLg6BBHfVuN4ZckK80cceAJ6WPgnZHPS6sTntOwVOZBizCoNVnH++NWHCjFc6LjRgOog==
X-Received: by 2002:a2e:809a:0:b0:29c:d0ef:4823 with SMTP id
 i26-20020a2e809a000000b0029cd0ef4823mr771360ljg.16.1680613768580; 
 Tue, 04 Apr 2023 06:09:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:13 +0300
Message-Id: <20230404130622.509628-34-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 33/42] drm/msm/dpu: drop duplicate vig_sblk
 instances
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

After fixing scaler version we are sure that sm8450 and sc8280xp vig
sblk's are duplicates of sm8250_vig_sblk and thus can be dropped.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 ++++----
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
 3 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 3dc850a681bb..b2160cf5a049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x2ac, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
 	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x2ac, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
 	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x2ac, VIG_SC7180_MASK,
-		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x2ac, DMA_SDM845_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x2ac, DMA_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index cae08b5207ff..2e52ae045ceb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
-		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
-		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
 	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
-		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
 	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
-		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e338155e2b82..547546d85474 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -432,15 +432,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
 
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
-
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
 				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
@@ -452,15 +443,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
-				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
-				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
-				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
-static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
-				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
-
 #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
 	{ \
 	.maxdwnscale = SSPP_UNITY_SCALE, \
-- 
2.39.2

