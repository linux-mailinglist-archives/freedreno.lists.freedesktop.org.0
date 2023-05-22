Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A670CCCA
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 23:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7AB10E39C;
	Mon, 22 May 2023 21:45:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721E410E2B1
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 21:45:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f1411e8111so7279623e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791931; x=1687383931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjC2o2RQsqV5nTbuvN77aHeR5dEhH5/JaYtRSJzTgZA=;
 b=yFCOn6KG16oz0H2q//i83H/A/5qIXFVLJIizwi00hNLXlraCEKw7NnnC112cXbftks
 A/52oa7hV5PVMOaleoVX7UHfq5zZCN/GAh9exeU/MT4gx77d4usaHIKKQYIzA2066Ex7
 3MkIEythrjTsbvelSFV+c61SY0ZmFON+R6bo/TnJFReOryQZqyyXsYLTk1Q/mpN96YDL
 8r9RxCtJryJ8SRhQsnRbjGtO0Pwjkfp4/FoXKhoOG0aoVaDs5UHt4axnkXbI82V9ZNXF
 Wow2Cksy5UKarBeiYCE3skpw4rCqHjbFCZ4nB8ajY+TOZ91E+MZ8WcjTZF4diHiiRE8h
 EW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791931; x=1687383931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjC2o2RQsqV5nTbuvN77aHeR5dEhH5/JaYtRSJzTgZA=;
 b=YrkyddG9Romv3Yvyndp6/iBTQAU7qAbWI8w3THw1YKvIPo9BDxwMm2nAJCqSZWnU4t
 d/H482K0yeo6B7UCgj6/l8rjoahbOP8Kh1GPrdq0GPbOD9AqO3WXZ6OdPnCYnSjc9DVJ
 /+MEpVCCFyHc/t0A8BwV5Xg3jd64CXN77S4eF987grs8Vs/qZ120QODGof5xaiNAqIPT
 PwG8Bhg3aZd3mWlcRt00aQC1dNkTEhjSGc4KjCQJYjrItqe3wKzYFy93MApGf+CLKsGJ
 +OZIeYEF5CJLbwksZwfHJjhMBrDp6KuKKTqLrnEipOYIlcpkmG3tVrNEbddBwsvRJsoF
 THHQ==
X-Gm-Message-State: AC+VfDwv2OdutNjdfP+xCErpQJ5u/+gCjGlnL1PdjQraOgGs10z4Ap/V
 OoxQsTAw4osM4B8+dUnMuSkikQ==
X-Google-Smtp-Source: ACHHUZ6NwvxV3TVS24gu8bO7B4dqVlvVv5IeVWmpnbgZzT1BMA/coXmI/r6xYnmp1UneU18l08UnRA==
X-Received: by 2002:ac2:5a0a:0:b0:4ec:a18e:f985 with SMTP id
 q10-20020ac25a0a000000b004eca18ef985mr3362000lfn.13.1684791931766; 
 Mon, 22 May 2023 14:45:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 23 May 2023 00:45:25 +0300
Message-Id: <20230522214527.190054-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/6] drm/msm/dpu: autodetect supported
 interrupts
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this with looping over the enabled INTF blocks
to setup the irq mask.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a03d826bb9ad..01f2660a2354 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->total_irqs = nirq;
 
-	intr->irq_mask = m->mdss_irqs;
+	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
+			 BIT(MDP_SSPP_TOP0_INTR2) |
+			 BIT(MDP_SSPP_TOP0_HIST_INTR);
+	for (i = 0; i < m->intf_count; i++) {
+		const struct dpu_intf_cfg *intf = &m->intf[i];
+
+		if (intf->type == INTF_NONE)
+			continue;
+
+		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
+
+		if (test_bit(DPU_INTF_TE, &intf->features)) {
+			unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
+
+			if (!WARN_ON(idx == -1))
+				intr->irq_mask |= BIT(idx);
+		}
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..f0b92c9e3b09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
 	MDP_SSPP_TOP0_INTR,
 	MDP_SSPP_TOP0_INTR2,
 	MDP_SSPP_TOP0_HIST_INTR,
+	/* All MDP_INTFn_INTR should come sequentially */
 	MDP_INTF0_INTR,
 	MDP_INTF1_INTR,
 	MDP_INTF2_INTR,
@@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
+				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
+				   -1)
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

