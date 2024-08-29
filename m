Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CAF964151
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484B10E622;
	Thu, 29 Aug 2024 10:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vzUG9GT/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BEA10E622
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:32 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-70943b07c2cso293564a34.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926831; x=1725531631; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3lbMpHi+idQrWBFT40ehkUCaBfcILsbcClLsstfOLPw=;
 b=vzUG9GT/4I4+e3SQLZKqdGyP1E1sXGq6JHF8SWPxvz3kOoa8OTUaBttpifpXo/PIlb
 WLYd6iChx2hoT8N3moSztC1ZFEs9cAlWC7djoRAe/iLeRHWmuvKdsCHlK2uqgH7rpCxB
 Vg+6iMHguU0T9L7MvNFEXdUWPeWo7gQiT/fLh+7wFSeXH96+AYIPxv5kgDUUppj9U1ly
 8jcet5me75ETnEfm8fV54+h0VvFlcEBUIhbkDLXcQKtDEJhV0H7ecTGVNx7eUOeVsHg8
 d4Did98eklm92NwCWWVtgELMKNeJ17uDrr3aQiuHNgf/Gu4bOs13vhnaSaPNCSRemRsc
 FacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926831; x=1725531631;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lbMpHi+idQrWBFT40ehkUCaBfcILsbcClLsstfOLPw=;
 b=G7WCbdhLQ3gK7qdC6W5d7PiaRB1Vp89t8UAXeI+P6CZo4PUzlNtNcw1RXvddYEr2gh
 vd49teKDkzwYG6r8fOZOmKB1z/JuiijXom9JOeHxCBtTvn5M7GWCX6zcKWbte/G9PXNP
 Drf6s75cpuBUMpqSPu6Yb/gGvaw8/5qELsGtDBXSgHTv/NNSqwRwycqP88QXGZyxkK5C
 DA8/0/LSYeN0+UUhAOdye+/g8YCQpM5uhEFa4SGapfM+6+ZIDDRx6tOz+9tkqdXWq1lz
 3KXAunIr3/xY3aEfKc27sXjYZdGcwMoeA8Fm6bksb+BA2+DLoxTXOZVkqbiXGmPpPmlc
 Ontg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhqHesDyDeBt9R4/v64ooZH5jKOIBdlNZRhong7dy3k2gcTlTW+Ed4MxcjvARUDP7wRmKHpqXvLPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3Up8FdZg4MRKnZApI0nFzE06ZA7b0vDauXl54GwTENORdp6vT
 9Vx7ESTX6HkBTVAW+U6L6KvViQAly2G5MhWibk9doniyFGw0C3Bae4D7bEaGmPI=
X-Google-Smtp-Source: AGHT+IFen9Jq7QnLTtz1M24pXV3owljduQ7AzBDQAdlqHW1BLOQlXouMHpCoA0U+fCxUk+qf1Qgf2Q==
X-Received: by 2002:a05:6358:b00f:b0:1b5:fc87:f023 with SMTP id
 e5c5f4694b2df-1b603c4372amr301108555d.13.1724926831326; 
 Thu, 29 Aug 2024 03:20:31 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:39 +0800
Subject: [PATCH 10/21] drm/msm/dpu: fix lm number counter for quad-pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2144;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=MuxQ5OVXyjEXNTRIAzTsA5+Nkr/OtZrXgpfu/qynNjo=;
 b=c5oycrwiyxCtgi1nfLY3vtWDhILufF21AgERHS7eIpJZlVfAkbuFpgeVC38YmR06XIUAU4YmN
 QxzQETH4WtaAYAC2NLpgo2dhnESjmYc43hBzPc03Wxklc0SUMHi6fmq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the case to reserve multiple pair mixer for high resolution

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 33cfd94badaba..f57725ad494d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -2029,8 +2029,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	memset(&mixer, 0, sizeof(mixer));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index e219d706610c2..77d7ff789346e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Clear the last bit to drop the previous primary mixer if
+		 * fail to find its peer.
+		 */
+		lm_count &= 0xfe;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
@@ -353,6 +357,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
+		DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]:%d for enc_id %d\n",
+			  i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i], enc_id);
 	}
 
 	return 0;

-- 
2.34.1

