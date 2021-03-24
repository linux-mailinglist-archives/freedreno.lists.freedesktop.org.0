Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D00347B4E
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2846EC54;
	Wed, 24 Mar 2021 15:00:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEB56EC41
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r20so30618189ljk.4
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
 b=cxYmsvKjXhJjLy3e9DksD1CayKvLvTfTmZH0sVaTZ7cB7jjVCe9KeRuYSijoLFMyKZ
 X9v9Jp09fef0JVJiKf5rwZLtgN+k+4B14w1RQD0qS8cLZPKxHS3ULBIhUCJ/QG+fSpze
 I71JnFaX/hjoQsXf4O7PQ6p8u4BelyoJsr5IuKr/Berx4JNttfJvaCKtzRLJHjoG0HHu
 DSH+qzfRUH7LQr4ODgP2TeWHXBoJhDBWiFE4A2WbF59l6vCZZJC9nmy1Y+TYigEygOdA
 cdb58TQ0+SfWDyCYYpZEIriXa7mlYz5bBGrR2poKk9ToK62dCcooaoA71ejbqCu9JvaB
 CRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHRJn3HeD8IJU2kEBHlBE7mssbK+pfVkIEgT2l1YUTM=;
 b=T2zW7Dv8bAsYX6Nf968TflIn2HsUaDFgsD55XtVBkrscGcWxSPPZUx60mzbQDu+IM4
 8W2VUDhAzc8irIOux7/o86RknuQWP4FRalKEtfDuiWm8JMy89o6JL53gc6vrEhlnAd2e
 2wn34/bp7V0cwHvBMxtARdY3PCIvlH+CnILMrtC2Uvf2eA5LS5zSZuVYUBgQUpJqZLuv
 Mt+mUg7KyuvPXRw7iYxITogOjYuCXR4p3gJT3jZPMFX6YER86YEb/nh7R3GdaS6asthH
 /3BJrItYDq4la/PmPjB/uNtk0xpLOqeMw3Tjf+kDqz1gBWXJfDn6dRZGbJawEJgw+R9s
 NiWA==
X-Gm-Message-State: AOAM531fdTPve37eMGzouiL1FYU40nxqIZ+0xgmdAfNnTOxrlloi6ALO
 Pa17EVbkrki7JwVD9FKlp7CQmQ==
X-Google-Smtp-Source: ABdhPJyVRmXnobLh21+0UZoLstd0UTYvuDgQT5sp6teUqBtBlDADaY3Q6uDvRmbOqLK4Uh4jE4EWZQ==
X-Received: by 2002:a2e:b0d4:: with SMTP id g20mr2400673ljl.127.1616598039471; 
 Wed, 24 Mar 2021 08:00:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:10 +0300
Message-Id: <20210324150024.2768215-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 07/21] drm/msm/dpu: drop unused lm_max_width
 from RM
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

No code uses lm_max_width from resource manager, so drop it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7792dff60bcd..dbcf4929810b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -134,18 +134,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			goto fail;
 		}
 		rm->mixer_blks[lm->id - LM_0] = &hw->base;
-
-		if (!rm->lm_max_width) {
-			rm->lm_max_width = lm->sblk->maxwidth;
-		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
-			/*
-			 * Don't expect to have hw where lm max widths differ.
-			 * If found, take the min.
-			 */
-			DPU_ERROR("unsupported: lm maxwidth differs\n");
-			if (rm->lm_max_width > lm->sblk->maxwidth)
-				rm->lm_max_width = lm->sblk->maxwidth;
-		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index a618c0ef43db..3f68a1c0dc1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,15 +18,11 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-
-	uint32_t lm_max_width;
 };
 
 struct dpu_kms;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
