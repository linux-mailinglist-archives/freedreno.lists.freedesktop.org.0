Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43D7682DA
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA3610E23C;
	Sun, 30 Jul 2023 00:35:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EFC10E233
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:24 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9ab1725bbso50359201fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677322; x=1691282122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
 b=i1b/4elKekiFdllyB7yaCQosxADFk946gBfbH8whkJpNXH5nzwlYkAgHuw2viRxn/N
 vu8AkBAxS0l02DfmHkAIc2Pxe4NBuOkENZ7CB1cI0KIRlWWgysBc1h6+u5T/RpN2WXWP
 RO0VyCoxlcWrSV9pnSiK1zGiLLI9O6Sn6FqUbjP6AHJwHZ9u3jmy9OfBCrFl9V92J9A5
 26HzIP9qWVGYg2f2xPXwXeXvKZc7nCK88NJU+Ppy9trJbfN/ZmgF1GoeGApykBozyt1Z
 CiM40srzlpm578yMgc7clOjlWL7bN/cfWYs9FHEqmivGnJbtW5hlGz+JNE/2HO38lNON
 57IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677322; x=1691282122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
 b=f6dbrEv8WdM19VyERq1hVpu2X5iim/5nmWTgRAnBHpgEEZJhdSXQjKKvICK0ZcF8P2
 /0SbSzGxiCw/1CrIWX/Et4QsWjqowbpF1CpMMdDrPZfAoDesEJDRH8jp2pbFIsWElMDm
 4DFenfaKzH487Nen3nSPXm2ZA7GxC5337pcZOlZILJ13XolBXetoaEpAZqZK6+jaSf6F
 3zst2gbgQLFW93mWIsrtExpgFPChy1kU0KJjhQYkypnCfUlWvAqvpnrNHtAj0tQVCmsU
 iRkQnoXPIoveey08oHXE1oA9QyXXO0D4sGNiNU+J1s0mqZF7lpztbLJkAoNOdKKDU4qY
 S1xw==
X-Gm-Message-State: ABy/qLa6+GO16pfvfh9TYK8Yx9f0eNfZPpwpp9CWU/ZPbXXMM79PJkBd
 m/Csu3iHKKd5YFxlN+2LMt6gxQ==
X-Google-Smtp-Source: APBJJlEam35F/ytgrDAXFDexoo3mbj9BefEnZ6vWczKxROs1tw7pyLmJJYPr8cEvagNUEPisfr6wzQ==
X-Received: by 2002:a2e:b0d1:0:b0:2b9:acad:b4b2 with SMTP id
 g17-20020a2eb0d1000000b002b9acadb4b2mr4143778ljl.6.1690677322455; 
 Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:13 +0300
Message-Id: <20230730003518.349197-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE
 flag
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

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..c19dc70d4456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 945b88c5ab58..a6f8eee58b92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -145,8 +144,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

