Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BC3ABEC9
	for <lists+freedreno@lfdr.de>; Fri, 18 Jun 2021 00:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051A56E82A;
	Thu, 17 Jun 2021 22:20:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA00E6E2DC
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 22:20:34 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k8so11133865lja.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 15:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
 b=nf/R3gMKmZ8YgJAIeW60PBX9O9+j3CsjOZDroP9lA9yyvHNR7Ca40xUawrTgWUTg1N
 BQu0Z5+/n5ovKf0/qjnQ7GG9EOwTdpb2mGE2O4V+w6lbeZ3wt1rw6R/bBn8NyWydIsSD
 S1NKDTJSygtKDGiQsk1U2BbPWwHLQUwjjKjMict3x1ahfh8Br1AviN9pzzeGsLdH8Scm
 TesUzsO8PJxSSWSsizW9MeGAwk01dFj8tC29SB2w7R857fqIpzcfS6YJs6AyCc6d31ge
 vP4uqGgoxapXtXrsDxq6P6IlvhEgkbaNgFCAkkflnpqORETZ5Xltds3q89BC+TV2slmH
 nnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
 b=isgkzP6Gs3o7VXsvlJUWhQTCG6vEcNL/89pfod6X0K4RiihFP11o+vIQeKhRecTNXu
 DTgkWXIiwiSdr/BS+5e+/qArzamcP5CK1YiaEKnPUm9k6UZ2Hc8zyLDjJrMDua5foHOR
 nHUg/U3RZBxgvXv7diAnA52v/iHrcHmV6UnBV4C4hC47hLxSTzTlTsRR8gKoj216DB19
 5Mos9So6c722wx3BRlMveVH8YGCXNZGbmvwnfrdqFRiIXUN/jYhJ74CQPJhKXaAl4hvH
 Rr1oR+7xBCmvXFW5Fjf/9EfT55yozVi9UjN6Dp7msaBYMu+QjHVqkpS1TumeSxtLkStX
 fHsg==
X-Gm-Message-State: AOAM531l0W8WnQ4hxF/j+erqlmFXZQ0+zF9BOG7CrRDi6eufuL0bWQby
 c5FnneSCkS6iPjbjC8bZSp4OUQ==
X-Google-Smtp-Source: ABdhPJzPs0irvwnPKXw3J2P+XJG57pLvbM7p+TMR28NCYTmMBcBStdtF8CyUECqv4poLyv9KuTCiwA==
X-Received: by 2002:a2e:9f14:: with SMTP id u20mr1035864ljk.222.1623968433429; 
 Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 15:20:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 18 Jun 2021 01:20:24 +0300
Message-Id: <20210617222029.463045-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 2/7] drm/msm/dpu: don't clear IRQ register
 twice
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We already clear the IRQ status register before processing IRQs, so do
not clear the register again. Especially do not clear the IRQ status
_after_ processing the IRQ as this way we can loose the event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 2437b0c7c073..28e9b0d448db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -120,21 +120,6 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = DPU_IRQ_REG(irq_idx);
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off, DPU_IRQ_MASK(irq_idx));
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @arg:		private data of callback handler
@@ -203,8 +188,6 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 
 			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
 
-			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
-
 			/*
 			 * When callback finish, clear the irq_status
 			 * with the matching mask. Once irq_status
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
