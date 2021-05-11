Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE2379E28
	for <lists+freedreno@lfdr.de>; Tue, 11 May 2021 06:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0170C6E9B0;
	Tue, 11 May 2021 04:19:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410F36E9AD
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 04:18:59 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 w6-20020a4a9d060000b02901f9175244e7so3941748ooj.9
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 21:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UHDiz1eezJ432ML1+q0u/7YP2AqbZQOs7C+Mh2wfUZM=;
 b=elkI4iI8zU5LP6C7fY67XaMyEKBfxs65uArPZDePbpFwolvnqmBPpTehyUjLmimqUB
 KlpbDcYlJkSLYpDEXMeFSvWvRGzuim++ElCuaSmTzN8LnFQMpkVDK2txkOUNF8A9zcNu
 DV0d0YZzCNSy7vhEpikEGYRyRkDAPjuTXJyNjvgbyNhCXsWBOh4qcJUD4XMZZu+nSuiW
 USJ75cDR9zxpb5sXoAmDReAldjQ09u/5Adqmkslbsoasle3Jk3ZGfY9eTdFkrJJ7HyMd
 KCcZuJCrPjH1qd8kRlJcRO4yijomLQ3MeKT3jcusbzPV7KjUy+FhelXURriC6o/E28gK
 iHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UHDiz1eezJ432ML1+q0u/7YP2AqbZQOs7C+Mh2wfUZM=;
 b=K0QInbOuaDmJ+50JI2j3VDSi1bge6NTu83O6rj6uCKkV2Udx5gObyQvvaUJFN3+HGs
 irWk97xWnwGlIdcgqYySWaOOD5/Eb719e8GrdJUeipkf/0zplsfRlUHMrkfeSsrGtLey
 Cbh/Rkc4oME6GzhuJ/lTdxhihBDdOQ0qY854h0v6phBjpZ0bITG5EB1eAK6wQ2S8GxO6
 ObMEPcS/m2OExVjPIyCRnBFMkGi7BDX62uanYrxLq3+miA5eR0BMLLRsLdKS9u23seu/
 E72YTVSmEd6OmwMjawm0aJrFx72lTu3eJo6eEcN3Xg6EMiPqhjxncBgfCVkji+tRZAxh
 UthA==
X-Gm-Message-State: AOAM530kMaFQjxtZNEPFnNJes5EFj3yaTEiYsyksgVK0xjaKSw7nfupg
 2ySj1301OtEyKHmZS2Tasdez1w==
X-Google-Smtp-Source: ABdhPJz/6oZvGjOsOX2nLMv/1sonOntXRywl8G5ChsiimZhwdTrNEprOLhFcZFB7PhMjRt2LRko6CQ==
X-Received: by 2002:a4a:4f06:: with SMTP id c6mr21827742oob.34.1620706738506; 
 Mon, 10 May 2021 21:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:18:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 May 2021 23:18:50 -0500
Message-Id: <20210511041852.592295-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511041852.592295-1-bjorn.andersson@linaro.org>
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/4] drm/msm/dpu: Clear boot loader configured
 data paths
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It's typical for the bootloader to configure CTL_0 for the boot splash
or EFIFB, but for non-DSI use cases the DPU driver tend to pick another
CTL and the system might end up with two configured data paths producing
data on the same INTF - with resulting graphical artifacts.

Naturally the end goal would be to inherit the bootloader's
configuration and provide the user with a glitch free handover from the
boot configuration to a running DPU.
But such effort will affect clocks, regulators, power-domains etc, so in
the meantime this patch simply disables all INTFs and clear all
configured data paths, to avoid the graphical artifacts.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c     | 36 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h     |  8 +++++
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2d4645e01ebf..7aba27c1055a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -349,9 +349,13 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT(LM_0 + i), 0);
 		DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
 		DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
+
+		ctx->pending_flush_mask |= dpu_hw_ctl_get_bitmask_mixer(ctx, LM_0 + i);
 	}
 
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
+
+	ctx->pending_flush_mask |= CTL_FLUSH_MASK_CTL;
 }
 
 static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc38c13b..8b01cb660381 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -970,6 +970,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
+	dpu_rm_clear_boot_config(&dpu_kms->rm, dpu_kms->catalog);
+
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..2cf47084482f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -4,6 +4,7 @@
  */
 
 #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
+#include <linux/delay.h>
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
@@ -229,6 +230,41 @@ int dpu_rm_init(struct dpu_rm *rm,
 	return rc ? rc : -EFAULT;
 }
 
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat)
+{
+	struct dpu_hw_intf *intf;
+	struct dpu_hw_ctl *ctl;
+	int i;
+
+	for (i = INTF_0; i < INTF_MAX; i++) {
+		if (!rm->intf_blks[i - INTF_0])
+			continue;
+
+		DPU_DEBUG("disabling intf%d timing engine\n", i - INTF_0);
+
+		intf = to_dpu_hw_intf(rm->intf_blks[i - INTF_0]);
+		intf->ops.enable_timing(intf, 0);
+	}
+
+	/*
+	 * Wait one frame for the INTF timing engine to stop, and then wait one
+	 * more frame, per the documentation.
+	 */
+	msleep(32);
+
+	for (i = CTL_0; i < CTL_MAX; i++) {
+		if (!rm->ctl_blks[i - CTL_0])
+			continue;
+
+		DPU_DEBUG("clearing ctl%d layer configuration\n", i - CTL_0);
+
+		ctl = to_dpu_hw_ctl(rm->ctl_blks[i - CTL_0]);
+		ctl->ops.clear_all_blendstages(ctl);
+		ctl->ops.trigger_flush(ctl);
+		ctl->ops.trigger_start(ctl);
+	}
+}
+
 static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
 {
 	return top->num_intf > 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..53cd649614a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -88,5 +88,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+/**
+ * dpu_rm_clear_boot_config() - Tear down any data paths configured by boot
+ * @rm: DPU Resource Manger handle
+ * @cat: Pointer to hardware catalog
+ */
+void dpu_rm_clear_boot_config(struct dpu_rm *rm, struct dpu_mdss_cfg *cat);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
