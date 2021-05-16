Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B433820F0
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 22:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4DA6E89C;
	Sun, 16 May 2021 20:29:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8C36E88B
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 20:29:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id q7so4412958lfr.6
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGMOGCO+rXXuc+SdnjkArplKY1gYuk79w2HTLemDuEg=;
 b=NTx9ar97fxO0aOpQXXbJfVACbDnXZKedlVsNoABklF1EQQmK6EURrjFXS+al+7dO6B
 AtxF2FD5zN5Ihr1Ixfwjm7ccks3ekxH0B+bTrK14kNdW3ngCDr3JAdkeRTKXPMr7Af/x
 mZgpAIp5YqbJyRs+iIIjsHOd7yDFjZgcHIWWaykAkgZC3h+dCfrRUtE5v2X0ZrURh32C
 syqSoZgKFxGtMC21KID3N0YTPrubRUb9XegmRFvA9RQEJ1J+d1wUN0IkbYG7osnP6vYY
 zDw9+a92KWG0OS7DJ6VTGuGR1CVd+W6hNKg4RaHalcZXqMJsL6jDyn0Wb4oA138eknzt
 /irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGMOGCO+rXXuc+SdnjkArplKY1gYuk79w2HTLemDuEg=;
 b=SD4Smor5n1qF8DlpH2HTpJLAas+75pdJHOrwEhWsdHQjnU59F0VEfvNnpwB1RX9wEQ
 rSAVsCwn+HhWHJRilzq+X1XT/UPACNPAyfqBq1y9IRZSChbP4Tr6xrrcoYcb82JR+Itk
 eXWnke+qGKjN3P+5CNoPiA4e8ABBEw9JHH+udRqf2wu845tB/HyS2SlPNv2fSKnaaPHR
 P8kspwj6KXAIATfmt0Yh0urwH74bJU8L+QuneMZG/jW4O5OtP6Mcd/pF8db5UES+LqSq
 6y4E7pC4mYf8ENGOT2wODg4JyXC4IXxy4beCM8l654Bom/8+HOuUs+UFwH4SLw238N7I
 pAAg==
X-Gm-Message-State: AOAM530ijr5YQWqW84sDLR0OchDhYhLYiNhNbL8vo8nmLXwNqOZdDUGJ
 JA5C97UNV79NfSBVQkw78R8GNg==
X-Google-Smtp-Source: ABdhPJxX65vtkISCDdwGOiGUCA2FWPSRnMCZVYgH6fJ7kUcOXs1J3I3ZBxtgDqQTRuqu6eaRnHnTrQ==
X-Received: by 2002:ac2:4db2:: with SMTP id h18mr296350lfe.313.1621196963134; 
 Sun, 16 May 2021 13:29:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 13:29:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 16 May 2021 23:29:08 +0300
Message-Id: <20210516202910.2141079-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 3/6] drm/msm/dpu: define interrupt register
 names
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

In order to make mdss_irqs readable (and error-prone) define names for
interrupt register indices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 45 ++++++++++++++++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 18 ++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b569030a0847..9a77d64d3fd4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -7,6 +7,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include "dpu_hw_mdss.h"
+#include "dpu_hw_interrupts.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
@@ -56,6 +57,23 @@
 
 #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
 
+#define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_INTR) | \
+			 BIT(MDP_INTF1_INTR) | \
+			 BIT(MDP_INTF2_INTR) | \
+			 BIT(MDP_INTF3_INTR) | \
+			 BIT(MDP_INTF4_INTR) | \
+			 BIT(MDP_AD4_0_INTR) | \
+			 BIT(MDP_AD4_1_INTR))
+
+#define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_INTR) | \
+			 BIT(MDP_INTF1_INTR))
+
 #define INTR_SC7180_MASK \
 	(BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
 	BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
@@ -63,6 +81,23 @@
 	BIT(DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK) |\
 	BIT(DPU_IRQ_TYPE_PING_PONG_TE_CHECK))
 
+#define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_7xxx_INTR) | \
+			 BIT(MDP_INTF1_7xxx_INTR) | \
+			 BIT(MDP_INTF5_7xxx_INTR))
+
+#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
+			 BIT(MDP_SSPP_TOP0_INTR2) | \
+			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
+			 BIT(MDP_INTF0_INTR) | \
+			 BIT(MDP_INTF1_INTR) | \
+			 BIT(MDP_INTF2_INTR) | \
+			 BIT(MDP_INTF3_INTR) | \
+			 BIT(MDP_INTF4_INTR))
+
+
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
@@ -1060,7 +1095,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
 		.perf = sdm845_perf_data,
-		.mdss_irqs = 0x3ff,
+		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
 
@@ -1091,7 +1126,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sdm845_regdma,
 		.perf = sc7180_perf_data,
-		.mdss_irqs = 0x3f,
+		.mdss_irqs = IRQ_SC7180_MASK,
 		.obsolete_irq = INTR_SC7180_MASK,
 	};
 }
@@ -1125,7 +1160,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sm8150_regdma,
 		.perf = sm8150_perf_data,
-		.mdss_irqs = 0x3ff,
+		.mdss_irqs = IRQ_SDM845_MASK,
 	};
 }
 
@@ -1158,7 +1193,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.reg_dma_count = 1,
 		.dma_cfg = sm8250_regdma,
 		.perf = sm8250_perf_data,
-		.mdss_irqs = 0xff,
+		.mdss_irqs = IRQ_SM8250_MASK,
 	};
 }
 
@@ -1181,7 +1216,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.perf = sc7280_perf_data,
-		.mdss_irqs = 0x1c07,
+		.mdss_irqs = IRQ_SC7280_MASK,
 		.obsolete_irq = INTR_SC7180_MASK,
 	};
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 5bade5637ecc..b26a3445a8eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -74,6 +74,24 @@ enum dpu_intr_type {
 	DPU_IRQ_TYPE_RESERVED,
 };
 
+/* When making changes be sure to sync with dpu_intr_set */
+enum dpu_hw_intr_reg {
+	MDP_SSPP_TOP0_INTR,
+	MDP_SSPP_TOP0_INTR2,
+	MDP_SSPP_TOP0_HIST_INTR,
+	MDP_INTF0_INTR,
+	MDP_INTF1_INTR,
+	MDP_INTF2_INTR,
+	MDP_INTF3_INTR,
+	MDP_INTF4_INTR,
+	MDP_AD4_0_INTR,
+	MDP_AD4_1_INTR,
+	MDP_INTF0_7xxx_INTR,
+	MDP_INTF1_7xxx_INTR,
+	MDP_INTF5_7xxx_INTR,
+	MDP_INTR_MAX,
+};
+
 struct dpu_hw_intr;
 
 /**
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
