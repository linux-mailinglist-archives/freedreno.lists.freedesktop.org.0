Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE56934B7
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3A10E3C0;
	Sat, 11 Feb 2023 23:13:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C74410E3BE
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:09 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so23951724ejb.5
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U1IpVFQllNnmxH9bVf/0phfBgT76t1Ev0s5bNBdEqIA=;
 b=KSrLTVCHmr2C9Jh0XMLL9wD/ZA1rEuYcSy8G1MmjTI7JlM4NOwFIe2nZlUVTuhncc8
 YjqLRWC8xLodw5SdQDKg2GbvbXo6VQWAmz2U9J0hbiPVvX/Vx9O7hjUmqFlyKR9wq7fy
 WtjR+Ixr6esVOTSiWBj1+DO+9eUtAM0YJPyLQWjS4kYIYLGOBb9F1/TxIT0YrCMP3Zbq
 8q0TyC5AZY2miE8kc2fHxcM5IRhAcTUnqhT5Ws3M0+FPN2AVUegdm7wQi65YXXG8/4hv
 0v29KMcKWDZWK1X67zGK9KlNJ4AYOwkqG5KSk2FbGfU5PBWFBsb9bAIh07rHCrmzpt7r
 fRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U1IpVFQllNnmxH9bVf/0phfBgT76t1Ev0s5bNBdEqIA=;
 b=bNaqtVUIK4fWNUQtWST2cY+XwJQo1XmRML2ZOcRf2w3c++SNfdwvlEmToGS68X07mJ
 C0y6MsPSNNx57/oR4rAymGqTzg+UJTm55tFlUqLFKwxumHrP7E2r+mwoA6fqBHBLVH/5
 UfJXMBGQA6PvrA+ZhoL+0pFdTuHV698MG74g6HXeZ6X3xXadK6kR61FasB5O2svFDjyc
 tNAO6gTRYrgkuFuYNPf3xwp8kf6XdUtPGOe6jsD3zaipOOIJ2Jg0TREd7etiAE83E7D4
 pRqIe2wbLFbUK8SmyKZH4JniXfdrE4Z7S3kEl9SeyesDXQDEsnIEmSr6sjMvJvmWFdgk
 fNug==
X-Gm-Message-State: AO0yUKVJw6yLoZIsEtDL7GVq+TQW1XLf0er6sJ3qQNzC5neq1/S6zaRa
 CajODH7ouH92Clh33bDs0ZlYlQ==
X-Google-Smtp-Source: AK7set+GZIhF15cn+A7I0w/qaEN410sfJjsqKydJSbrh5X4/R1rNfAEsenShZO8CdYPNEZ1VFCFKug==
X-Received: by 2002:a17:907:160e:b0:8aa:c035:a651 with SMTP id
 hb14-20020a170907160e00b008aac035a651mr17278188ejc.37.1676157189154; 
 Sat, 11 Feb 2023 15:13:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:15 +0200
Message-Id: <20230211231259.1308718-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 06/50] drm/msm/dpu: correct sm8550 scaler
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
sm8550. Fix the DPU caps structure and used feature masks.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 192fff9238f9..c4e45c472685 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -458,7 +458,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
@@ -1301,13 +1301,13 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
-				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
-				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
-				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
-				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED4);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
-- 
2.39.1

