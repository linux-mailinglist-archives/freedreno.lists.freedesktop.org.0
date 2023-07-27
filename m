Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F292A765635
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 16:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D8410E594;
	Thu, 27 Jul 2023 14:45:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7927710E5AB
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 14:45:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b74310566cso15668611fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
 b=ZZAp/HMdMyKbswenyzIOHOBslyFVPLkIYYGacEce4rmkUV6ai4D5X/9zWhvXzdS/Lf
 LJ9RjOVWZZgRFJ7anpqA8S4V4Oh9H4ZG6vUI02i7cNVpEV/helKGOf138k90tEpdyRHV
 +aeAGIWhTI+9wvxWowjmEw0KeF+JphX7OqhzoreNMuYQVAKqlod9JrVvSSux/Lcd1bdr
 isaTIqypnpRuY8KshiYbqaRMTfzVhDg7EQSTKkMlWH2VzN9j5p0Y9gaShLdvBqSRGzO4
 ypCvrRSiIpzMeo2sN5tvy7Mq0EXkhxfMv/jHz/uKzq+C43GAzwZ60cmwEYL6Usc46xf3
 Qs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690469147; x=1691073947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OS0/Lxd5lKrwuqIAbL/+8ULTmmH/V10tfKT3ZkQl4g=;
 b=MUQCI/CCDsU4eZjpdD3ZUTQuPmk2yPj+EJ9tT/jXR2VjVQsUPeBmC8ziY7wr1VcmmJ
 meUjousz+eaNu0dxIKWs+K/oyz6pBi6nI1LdAEFAAcu2WOMir4b4n/t1ev58J4q95a4S
 dxSdotf4UpvtffWOIpaDZYbValQWpOzs3LvSoy9fWT/B00G+dIXN+nQp55xUz7A+nIUU
 9eWGYsxbC9WMdDsEgN5PTMo8IMnNwTy1RXeR2cq2oCX8NFWFjxQ/oHKacMPT22fhhXN4
 gVxvgZErxndjrIaN342QDR0p43ub2VKZBhemUUgRsE+C0M7i3EhOmyUO34s8+Udem4B+
 gK7g==
X-Gm-Message-State: ABy/qLabKuejnhCBpIgVy7E1hv+QjIEMwdptK+4e7CfZU9Rk9GNiTxS5
 3uxutFkUfIgHVMyIPS8vOnf14Q==
X-Google-Smtp-Source: APBJJlGXBETZDllFMYnUFy6biPyn2Ehox7GbdpmmogvvyQO192JjCIOey9LxSi+XWGrcgzZiasrNww==
X-Received: by 2002:a05:6512:6c7:b0:4f4:b783:8556 with SMTP id
 u7-20020a05651206c700b004f4b7838556mr2015913lff.66.1690469147649; 
 Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 17:45:41 +0300
Message-Id: <20230727144543.1483630-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 3/5] drm/msm/dpu: autodetect supported
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c    | 16 +++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h    |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 0cecdc847b49..e3c50439f80a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,20 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
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
+		if (intf->intr_tear_rd_ptr != -1)
+			intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..6e0d0188edc6 100644
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
@@ -33,6 +34,8 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

