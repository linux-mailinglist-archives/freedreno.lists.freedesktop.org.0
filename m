Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E5485C15
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C924A10E31C;
	Wed,  5 Jan 2022 23:10:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7336910E1F6
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id g13so1218871ljj.10
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZJITrHaLDqpoh1LNoc2hiD4lg0tjTAyUfAgifRM0rA=;
 b=aWlYI8u5TkFDy9J3NQZpPP1kEduIY16PN4bV+28QLWeW/s80oujo6boD1wFVVrgxaJ
 RcnObfrAj1bKygsHLrtLBC/j6LAtEK6FKgZ9Rm0FqGu6cS/B92r/gY+hM/nHJ+XDk9Ab
 Vc1QIqgx9t8xrAl8HKUlGaKW8AXLVjqte0C+x3kGufiUzxsHm/Q982tyO9G+dd45KWdu
 kDJznTWLZnukUkmpaTPQZeXbr4p54IPaDpCyh+2X2SjF7MVZEMODU4JKuVcgBuYe5N8I
 FFNVFlnA+GP3w/zKEE+Th0uLUAHv8hVUmgZg5mQ0coHCMSfJ9egILAq4Lc5CjmnfQDXj
 WQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZJITrHaLDqpoh1LNoc2hiD4lg0tjTAyUfAgifRM0rA=;
 b=8J98/Wi8pSDAB2PulHgtkshflPwRQs5U5BsQgHACBll3CkvJqtAqPbdIsTVmn6D62l
 l2rHp54h/EmEPhGVP0mP9RmuAvT43DA/6roO/Cp0oSW1K9Qcp9VHjhuJDbIl6mfAb1BA
 kP1g7Zg9GCv8OeMwv76//JG5Eilm3DhUyYoPlX45ph5DzU/3ZEDzj+rFs8E9NgYzl2P+
 NJ/QV38fY5fiLO18gSo4XoVUto29D/smAKz+NFP7H1LM98ocRbrkv1JC87loFUNnvfEt
 dNS+jtgivP4NAf6dQVbYOekG0oa/DarNYAL+YLZxrvMYplkQ9vCk+pwU+7U8bi5oYPo7
 du+w==
X-Gm-Message-State: AOAM531QDgAmnCK9nHr0O/Xrfn0ZMUxU/3M8/Oboo4w7257csjhGQk0R
 9fWqB2V4pWdhAZdKJO2qxcN4JQ==
X-Google-Smtp-Source: ABdhPJzQ4kzJ088Zo6a/PFh9lMAchUeaTYe2GTieSHAbMdDXUgGyneYXdop+ugmVuAwoDp2567qo6w==
X-Received: by 2002:a2e:2e18:: with SMTP id u24mr19424312lju.492.1641424235679; 
 Wed, 05 Jan 2022 15:10:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  6 Jan 2022 02:10:27 +0300
Message-Id: <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/5] drm/msm/dpu: drop unused lm_max_width
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
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
index f9c83d6e427a..b5b1ea1e4de6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -114,18 +114,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
index 1f12c8d5b8aa..0f27759211b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -20,8 +20,6 @@ struct dpu_global_state;
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -30,8 +28,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
-
-	uint32_t lm_max_width;
 };
 
 /**
-- 
2.34.1

