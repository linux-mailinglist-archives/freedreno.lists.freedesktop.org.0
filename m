Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF46076550F
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 15:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD47310E584;
	Thu, 27 Jul 2023 13:32:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1310E584
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 13:31:59 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so703558e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 06:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690464717; x=1691069517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43GPkP1PeA9fZvjE3accIBVrdRKqnNagCa2FjKs2v0g=;
 b=kYG3vIYonT2Saxken9gnkC3TY2ScqKQKR00NGzYVYLXHCq9Ers8WrC8wfliSBd+fY+
 EP3l9LJD4I9qKKcNsWWQF1RR04nXEhcDHbVcCs059szWVwOSfZIldjyipxMDkvDdJhMW
 qWuwWvVkZOC0JDcREqwvgXmMtte0iyNg+5eVc0fxl/NJD/jHiel5R36Zkcv3Sby7cGvH
 LQ3osIvzf95hwNM2zdX8b7vItLgSMQt1wOaQ/WC4JZ/Hd7ybpd9Rjs818zt3JYMpp+5n
 XI1KcIgWd4DmVxJ5U04356zbXpGaj0a7jZjFdLaeAVk0KUNRdx5HqEquqj1NoT9Oq7XH
 xMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690464717; x=1691069517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43GPkP1PeA9fZvjE3accIBVrdRKqnNagCa2FjKs2v0g=;
 b=OfZYuqBn103l4DShwRVZVmPhQlWtQiQWvOGMJdyJcpw+g+ULWsHB6qcKEXGNUJSSo8
 zdw/5Hsl7Wz4AxXkfUBHsQX+7UXwyBEJX1xBscCVkdWaJsFpuqhBCrLewOrOeke71K6O
 KFukK+OJWrhgCTPTkVtyNGS1P0NvPsKao7PZwDjj6FLa/+jOS+D5pd5h9LRIwguz9yrx
 3DOGUsM1D2HQzWqoElzgoguougNBwENx3DUr8rc7++Aw0S080+XIM9NrnzqPGjbPPoZh
 CEKp3gIz1mUGtDOWj9ZZ8iSENsDKI7tk2yTYZ71Dm1jN3jJCMHfavuxnk8/MdXnwufbN
 HT1w==
X-Gm-Message-State: ABy/qLaX63n3steNDwgYb0Zwev0Ep2DM2SO0T+Kv23KLJLnxYMNn3+Fa
 1hBfG5gamMv5CY2MXUYcq/wooQ==
X-Google-Smtp-Source: APBJJlFjztgEBS8BeDBxfm8Fn+Qb6BdMyJrpPdsXoOmmp5mI+KFk1/u7RsdzOVNAD/qdbItVec1kRw==
X-Received: by 2002:a19:e609:0:b0:4fd:d18f:2d93 with SMTP id
 d9-20020a19e609000000b004fdd18f2d93mr1677986lfh.6.1690464717488; 
 Thu, 27 Jul 2023 06:31:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651204c900b004f85628ec34sm313511lfq.33.2023.07.27.06.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:31:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 16:31:52 +0300
Message-Id: <20230727133154.1421721-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
References: <20230727133154.1421721-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/5] drm/msm/dpu: autodetect supported
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this with looping over the enabled INTF blocks
to setup the irq mask.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0cecdc847b49..a745de20d387 100644
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

