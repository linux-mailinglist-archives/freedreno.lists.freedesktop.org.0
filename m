Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A94AF849
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77DE10E559;
	Wed,  9 Feb 2022 17:25:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4AD10E506
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f18so5496730lfj.12
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
 b=b8IR7h5dbRXHphEJjKal5av2yFLfFOoWDbpU/y21y7SUYjXIY3R6u4gHM5E7CnQUsT
 yPoUE1h7KasAhtKVMzYmbWzgaGwAPzYeGt6ARJQxgV1/X2O/JbXpWEVRg4WXGApzgJFQ
 Q7zBeky8DJNnb/P3wwz9eiyPPYMSosqlV0RJ/I2fo5eeg5UQcWm23Q5lhM26hqwtmZZ4
 9mA0rgMoPxvfp2kRlb0aUsTFdsPVzTkjliKap2hcDnh03/sILrrMUcIDHtHxwb8q1JGJ
 n2ZNZ3CFDziviIfDkH4meJ88URKtFxl4ajc7ijVsOjIPDQI8GOYjd24RRkUs5FUHB+m9
 lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
 b=J1CWJfl+FwMuku4FacEnrFt71nNIKMakDv785r4xd81RDNEzx9L1JLKP2VN5cpfSqo
 xMdZ5AbVIg7cQc72HAhiUcLx6NOev9JI85s34iOHxLd9UAONSPPkOjlET6icT9v591jJ
 NlCKqQvlIp5EHSvZB0KQOJKlaA2hiYCk0epxbFp21D7xK//KQNKoZXSBGRveAdwDw8cW
 5/QwkxzpBGt6zg5xvYJsni9jD6pJ+smzGe4BHuRzCRmPFXrXkDu8m9A75kNgVvjkapAZ
 f3suxqj9EdwholoCtwRiiwQw6KxuSsfWuk0pegMXIwuhTdaUjvmb/Dxoc51Ddjuye48y
 XLFA==
X-Gm-Message-State: AOAM532HFMTzqZV9auwdf51CUeoCm9mx20WkRuxrA7vXm6+g8M4voeOX
 O6jitojn7hFzYoPzSPATq3ODUg==
X-Google-Smtp-Source: ABdhPJz8kmyJanrqloX6/6HDqOUPHkqMRTOKp+o5kAZWrtD4BGIGG3nUvTZ+YjEh7LY3vLoUIZ85ow==
X-Received: by 2002:a05:6512:398a:: with SMTP id
 j10mr2241899lfu.189.1644427546995; 
 Wed, 09 Feb 2022 09:25:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:25:19 +0300
Message-Id: <20220209172520.3719906-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 24/25] drm/msm/dpu: populate SmartDMA features
 in hw catalog
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa75991903a6..3564eea29563 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -17,17 +17,21 @@
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.34.1

