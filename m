Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC20A01E18
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBF610E56D;
	Mon,  6 Jan 2025 03:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiu21jCp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27B910E56D
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:14:03 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa696d3901bso1780420266b.1
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133182; x=1736737982; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
 b=hiu21jCpdWWUdtKD8pLACxQTlGENbI5Q41HOxMf21ghkFHTQO2ppy2ms26reDK6cTF
 rRtLu2DYbkx6ZJp0FkqD19bPzNBPrY+G8fTPmpn9D9n6T35Wk1Wjdp/mSL5Dg7RSOofh
 DodqWE7zDxFr+iBnechj4D7oNeyd0G8acHUJ2/l5MB/0QlfdgpEROyt4WvmKd47wmS+u
 IiFcITFQDbnQO/7tq8qqNNzK6z4uLJjo4UJYb4JMYQhMZKVXxTnJaQrJJMq+HtxEyRKy
 5zYFHFE1yZRZOYbXfRSxtx1hbOrEdqelJubK3XNIImGOGnFAFDMEMratGJZKa/euDBZ7
 BxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133182; x=1736737982;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
 b=Oah16jiSedW//FMP5lHn1lCxZzZAFc8o2G+Zh7gtGiY/eKaYZV+JIzXxcba2H/ko4t
 DK3UauwyQwUhWo+A/7AmRwi0Euch0KiP07uPqbWui+Z/8nnQGmMrqdRGE4nZjXguuVwb
 tqHpGAedyrCQOEGicSCwIs3Kqb3IKMb2ktZF/J41dzOlppca1r0X9sLxNZJunnu3fCmT
 oiSoqDBSCD3GajjRX4XlBfqy2jH3ZrQqeGL9SeqSk0lcF0qXJAPyvPRhsnrl7Pe6GD64
 jZGGL2pQ4syhJPWmIsuqdjJsua8RDfGC49bexdW11jo/NDTZC1tAJ9o0qFPoalbSE2Ww
 0Cnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHXwMmryfQXpn/25QAhwCfzyM8hcyJvwhKh/tLsF9uvFRkFLMVJfFh3fVUW4Zk+Gq6llAXNe/PhGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2WWupQtiIvaYnnNbsQwxXB4KYQ8jOUYa8kJvqvnA/m6dXP+EG
 eQQltRBTKCYsFmXDsgOMagdLSSPAhmnC/uswUKQe80hKE0Py4sNFWzW1qeeVuJjWDKjVbi+SbeH
 wJ8c=
X-Gm-Gg: ASbGncu0s++SMBEwuqw0h1/bAjmcCAN78tdYvdYgxyW+PGdbxS8ZiuK53Ts1XG8S299
 MywW8++VwaspQlE/ZrbtLVp8Y0zc/sGqAIJzOySequN1D9J2Kz3qN1kJtxygfSeq4sMyGVonS9r
 dQFsEDy2RxxuGLreJ6F5pDnGQaYD+Y8khj5YVRajS9B1fm4Q3P8fJU9nixlyMCMCqurWibgc5gm
 qU1SpW0iUc9Ucah3UlE6EaoGJt+wLWsjNNEYatYPKMg8j2eVlXwBgsSoPFFOokn
X-Google-Smtp-Source: AGHT+IGVNTbTo11ia3rI1vyhLprYs/ETfaR9ehq23gsHe9NwxJ01d9hxUtMjVjVfY/pmtpVerV1+Sw==
X-Received: by 2002:a05:6512:3e1e:b0:540:1d6c:f1bf with SMTP id
 2adb3069b0e04-542295254a0mr16112607e87.11.1736132869972; 
 Sun, 05 Jan 2025 19:07:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:38 +0200
Subject: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JMIpMFmUuSjIWpzC5uW4TfFD57Bcj868StpQVqk4CIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5yJtIKct8p9ZxKlcKTed0ff/2fXsxmYZkR
 cqjaLxugFmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1QJRB/91HLihkUTCkNJfedXqBJP7HeE1u9hlmhHKfhrQs34HNSx/8F3/rsHVSOHqMSkRKnvOGoG
 nLK6HfX8ZrPrRU7I3hD0nD4AGRkLsA9TjhY4xq3cG+icaLQAbt218LGaW7EyQmd/61/VkFY/Cu4
 iTEB7oMMawkw6Mh7PU6y0acf5owjOVOp4bRFJlm+sXdMwlevTKQIXHL62yYFA0HxfpivnfGuTai
 8Rs/rSfzKrHBJALsCt0IAS3jnkdtlnyfOVquR/lYPYiccngjOxzI5A2J5zWQW7Ww50csO1Y0qbq
 lrMwch96EW9kWy6TJ+aBv3oXAEz9az0/zppFJePMpF9NNuVF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The fix_core_ab_vote is an average bandwidth value, used for bandwidth
overrides in several cases. However there is an internal inconsistency:
fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
in Bps.

Fix that by changing the type of the variable to u32 and using * 1000ULL
multiplier when setting up the dpu_core_perf_params::bw_ctl value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
 		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
@@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -51,7 +51,7 @@ struct dpu_core_perf {
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
+	u32 fix_core_ab_vote;
 };
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,

-- 
2.39.5

