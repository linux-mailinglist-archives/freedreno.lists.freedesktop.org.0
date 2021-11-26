Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5E45E46B
	for <lists+freedreno@lfdr.de>; Fri, 26 Nov 2021 03:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCBD6E4A5;
	Fri, 26 Nov 2021 02:26:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730586E49B
 for <freedreno@lists.freedesktop.org>; Fri, 26 Nov 2021 02:26:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n12so20555110lfe.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjvwkpUPVxTN10HZUyOLDN4iEgATg5pex/yAH6C4wmk=;
 b=bE6gsDYcf3HpAMDe676F6s2AZyX7DtcqPXEUlAEp6XnSdElSjkBnJBq0zqFDuut5NT
 /+PV5yNx84b/VA0JbKoPCRepkemTp0gswj7w4CVkUkVVpwSuI9VNwvu3lYRMVLSKPSab
 tE/wAy9BNwefirBNHBpaaHUXFi0sL7f4zP4DVm2M+SmdzsDqqbkyv1fyf61GiEJPk09e
 b8bKM6lmldKzdrmHIm05TZmjvKTq8OFJ3FVAubMxvnIWrn/+vY8ZgZwMnRE0k7igRDy4
 l7BbKxTXTiMM5676Xj9eDn7vUgVIeBQHLE46ZNKlElFKGiHdTs2tiVYYLO1axY41Jtiw
 44AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjvwkpUPVxTN10HZUyOLDN4iEgATg5pex/yAH6C4wmk=;
 b=MhzLkcVQ3dsKj9UQvwbKeP+7NgJeG9MLsTeL79j5YBoj7BPx5Uy7z5EJ1ZfV2i3CwR
 HxOrGAUYiX50bXrPVE+ntU0I5caG7Gk03jlFwMccpU1RxWDzptZZQfE10IKDaEB8BQ6u
 nrwGPf9Q96l4tGG9DmiZ6mPjP2ytGzFM/nhvb31AK4VCrHCn+pZwphCmqvu07/eZPMNk
 rMMD4cbCkphh3au8G2b7WXAjb4CE24NocMwYeNe/OiDLem5PAXaYmUYUvu1Tgm6k7cxv
 ByUVX6X6MgPwxNUNHjKojtfAgDfCwXn0As5Nli5iaHrfr/KZfSAXuSaJvfo4BMBEa363
 zt1Q==
X-Gm-Message-State: AOAM530Htv8prXHxPM2yLrvZDajjD+uNurm4a6kJTGAu68L6DaLdR8dq
 ELu1tq9cC+vUxrZJ+9z8Mk/y/w==
X-Google-Smtp-Source: ABdhPJyTq01BCevqYgd11aZ7SMNHpgd8O2RjgI/kfKWHlAz3ukSgwwEOOc/AYXFug6yZJQog/3qh1w==
X-Received: by 2002:a05:6512:3f86:: with SMTP id
 x6mr26665606lfa.616.1637893606803; 
 Thu, 25 Nov 2021 18:26:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:26:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 26 Nov 2021 05:26:42 +0300
Message-Id: <20211126022642.1105979-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
References: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/3] drm/msm/dpu: drop unused lm_max_width
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

No code uses lm_max_width from resource manager, so drop it. Instead of
calculating the lm_max_width, code can use max_mixer_width field from
the hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d8d3f87a0ed2..bb69dcf2c13a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -105,18 +105,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
 
 	for (i = 0; i < cat->merge_3d_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 27afe55f1f55..90f5d1d9844f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -19,8 +19,6 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @dspp_blks: array of dspp hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -28,8 +26,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
-
-	uint32_t lm_max_width;
 };
 
 /**
-- 
2.33.0

