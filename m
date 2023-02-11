Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF45692D1A
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E310EE6F;
	Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3AA10EE69
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lu11so20241064ejb.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
 b=syji7ogZFBwzTLInBmVuGWKr0ndydMVQXekoAx51PsekZCZUTi4msTK0WYB25BxyUo
 2TMtpy9rbjD6Ls50h9ELF0WKBeszljaHxpTEzZhs0PnwF/eCl4lIxcteKKtUuhkUCBMM
 3XxEDOu8MQAdD4tDAYpEBbRszaWn+6BipsEN5csCbYukMDR4ODugs9QoxT37XAEx2tQ8
 0cYyRuKWSMeqMiIITv5cPlYTWufeSgHeifMaCdqpHdvsHOKe8U9C412EIeCIm9Q7U3J8
 fpX72Z2+gwLVkYBRzWs/K9unUgQTc2xDESXzyO4y8Jw0mr5zuMwMaCfpagG/EBaQp504
 u5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aL2edqo6KDYx6sYRiaj4UMh7ljorLtIgUzS84s66Pvs=;
 b=YRcES8D4xUIfIS+BqDJMP9wIRfWqM8j4CHxfDumrWBrewxAY/xydPNqr4tXuhyO2Fj
 k/OexmRLEZr4v6t9DdyCYOBTwSar4wwX8dNYxSQuV4TqPP3pvW/L3PvD5dbaiwdYiVGS
 FtSHWV8LWod7+gwl8VzdcOj/EJlUJqPzWaroRVk+SdvG1+pO16jUcX9z8Q+1BDOuCHrb
 60wBP43tsGBRsR3tpuVei1wXWNjj8b8COflTOcmb0o+vNp6cOqhiKvOrPD6jmMYq3OVp
 UFnKBTmYq/KqgW+KV9a66x+knpunsETnTRs9lyvtLJMF3fe2dHQGjn3bAOq7s4gM+KyL
 3KjQ==
X-Gm-Message-State: AO0yUKWYe5SddCXTF8nO/V+Gp/ROgFVzkSxTG5wd/tiNlq9QaEZGyIRg
 3u7Q5JM7U8cmYB6+jpxbPKsOdg==
X-Google-Smtp-Source: AK7set8fLKeN5SoZcBxnITXcJ2zjFAvYtTaQt5TQL5NMB31kq4UDrcrQxQAHgwQ+ED0xNB7wyIh1cw==
X-Received: by 2002:a17:907:62a1:b0:86f:64bb:47eb with SMTP id
 nd33-20020a17090762a100b0086f64bb47ebmr24553481ejc.3.1676081482536; 
 Fri, 10 Feb 2023 18:11:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:36 +0200
Message-Id: <20230211021053.1078648-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 26/43] drm/msm/dpu: correct sm8550 scaler
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 2103ccfc22f0..8a81ce0cc0ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -10,7 +10,7 @@
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ff507acc6ff6..48ee66f52ddc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -424,13 +424,13 @@ static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
 				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED3LITE);
 
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

