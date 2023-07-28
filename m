Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B567176790B
	for <lists+freedreno@lfdr.de>; Sat, 29 Jul 2023 01:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C046510E79F;
	Fri, 28 Jul 2023 23:32:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7141C10E79F
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 23:32:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9bb097c1bso40464801fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 16:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz1hKoDY38DT//BIw/FpyOAtOdxg6YreDjToq5km+Ks=;
 b=abUkMbCTmdB/Bya5vivhruYnFj+FqgrbDwvOXl3qZ9Z07it8CY8xUH0jhGpNJHwgWz
 Q1X+3c/wC+O4qd2U3Q5fjknnTs/M9g4mjvcDrqeIz7guXgwgsT1ch6aQplMXGwPjE8uX
 i/ANrXw8oNR04bn4fjJFE+EUyXMQazSisRDmX3oEe/uesrKYWiUSmzyldZGvCEvuEM9h
 +WC3zLsmH3S9aYrRb/d4Q3DkBPVE5vZjL5KKsTqv/0zoxnn10Nv1g8VZ9Xcyu3UUvdhW
 ZsQZzqJXFeVjeRRmneKkfBT8GxwtausRHmj92SdhnPmsuLUVLg3QOxgZRF/VlBxe51ar
 cm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690587122; x=1691191922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz1hKoDY38DT//BIw/FpyOAtOdxg6YreDjToq5km+Ks=;
 b=M0shN4RV6gTTOXriy48lg7AgzMstZnkTzbUoq/YhlE9+yaFLJe+GP2UKoHBzWpHLlV
 btvlE00vNLOAPmalrq1rCvn47NdVSfrGM73xnLHcKrIWSjJY5ZTRgOPvIRplAufKeb2G
 VHhmnzqsCbq7RCQGYXtLbGRsc66GB98PR3puhhhHjr0X2Tjj/C4WuPfJFSfHynH/H2l7
 v6J/vr0rQ3jF+BVCactaN7L6r22MjA3p01LKSWmjtQQ2X5ZTFuPlGzHVX7Y6pHh5fqiR
 wzIu6/ca2mENq+nuUmcLUjm0gZ/c2AGdL+HRjm4gerqgwl+VjBpMBwIiRwaNuEcqyqRw
 arTg==
X-Gm-Message-State: ABy/qLYVTOB11Vdb3KRFq17riMOUM9fQq5jGJkx7xKPYuNgUZhow8Qf4
 JI62mGuZSeWuGli3G/At4AnEgQ==
X-Google-Smtp-Source: APBJJlEF/t3tbnHJUjTfUgF9okNauvNaBleuclbixZhx2wu2SKBy6OFlfIUp7kHyanVp77Y4HDOGZg==
X-Received: by 2002:a05:651c:115:b0:2b7:a64:6c3e with SMTP id
 a21-20020a05651c011500b002b70a646c3emr2651731ljb.26.1690587122796; 
 Fri, 28 Jul 2023 16:32:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a2e9dcb000000b002b6c8cf48bfsm1148289ljj.104.2023.07.28.16.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 16:32:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 29 Jul 2023 02:31:56 +0300
Message-Id: <20230728233200.151735-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/6] drm/msm/dpu: extract
 dpu_core_irq_is_valid() helper
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

In preparation to reworking the IRQ indices, move irq_idx validation to
the separate helper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 01a9ccfcd54b..81d03b6c67d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -200,6 +200,12 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
+static inline bool dpu_core_irq_is_valid(struct dpu_hw_intr *intr,
+					 int irq_idx)
+{
+	return irq_idx >= 0 && irq_idx < intr->total_irqs;
+}
+
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @dpu_kms:		Pointer to DPU's KMS structure
@@ -291,7 +297,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -344,7 +350,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -429,13 +435,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	if (!intr)
 		return 0;
 
-	if (irq_idx < 0) {
-		DPU_ERROR("[%pS] invalid irq_idx=%d\n",
-				__builtin_return_address(0), irq_idx);
-		return 0;
-	}
-
-	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(intr, irq_idx)) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
@@ -518,7 +518,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -555,7 +555,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	unsigned long irq_flags;
 	int ret;
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
+	if (!dpu_core_irq_is_valid(dpu_kms->hw_intr, irq_idx)) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
-- 
2.39.2

