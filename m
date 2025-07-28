Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1AB13B22
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 15:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3B10E515;
	Mon, 28 Jul 2025 13:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W1lsL9tF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372D910E50F
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:10 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-75001b1bd76so2739379b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708510; x=1754313310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=W1lsL9tFEFT6Wmo95j/Od38AtRD6QcivmKasf/dENrNOfhf/3CP80i9ZVXeaCqtZPB
 oem1oDnEhOjqw8kxxNuwXQgprYLYdrNQbL97pK1I9lDwxQlGKP4Pk9u0f85XP0kEGVs4
 +ORcX5wWs25SXTELSirrVOoJ9IVitO095o2bTLbNLTWAhLNq+KyMXUTdZzorutGn7QZg
 WHj7tx6OBeAd7ZWhduFU0BfOiO/HtPdOfL15xyOFMn+d3bTq1RPScHBTjxr0WOI2OIhH
 ai2IP2pbbSecwNPcUvqXqULkDwDPVyeGgMBOL8WzIke522P+msmWjbpZ3W55mbE05GIL
 nBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708510; x=1754313310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=jRgv4UI0EnPNe6m2j0MX6UYvIx+QOdNqRd7BZse0koYcsVTjJjcSHz/iufQNrFlM97
 SIl6P/K8XHVC4cYbN0tfvRlikbYsRManSBV3cyyGOwXN2M7A78ieHlrw73EgU4xgMtie
 aAZpEfg6fAKB9mdsQnP2+uT9RnEHOC5VmkscuqPdVtjeeuxlg4B69KMu+nmJPFlCVSNB
 dpm1+HSAQN9vs0k+gkLY5rLP6/jrfyKceP3/a5FUpEE6ZU1tcwx/mHJbwgQADavc7w2M
 xBLGhBZnwvxrn35hJNNKmi7DWuKxfv73qyHUVx4BmaYBAR3Vw0mCQucLxiRxJ+hnmXOP
 9czQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/cGlP62u1/wc0o1mL23F+rJqvyBDMNJxgSzLk/6GYInD0pkBVKf6E7XVNFLWPMQNa5+Exg8mD3zQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGekT4VUsJeILWLqJoHP3IMxNziXUTbVe9fu4WFH7p81Zh0frl
 pxCmNaRThiuGDHzpu8PLSrx2qdoscc0Dub+vPZgeXAlvpcVCuYUFHEtIqAmPZi+zfKE=
X-Gm-Gg: ASbGncshBLMr3k0a0dkLAMfkraoCP4ihVwjwVmGY6Do7G6T1+fXy8b2/xmmTz07oFRB
 nlJKe/OxzWlZBxbhxwM7eueb8KWJ0tVcJV8zChwHbFQvAyrbKjnFjBAJX8HJUHh4Uv2oYBnuISc
 TXUWCjdyfeCzR2FjkH6G/0YIzhPYL+t/JfYwkwbHREIR0Q3wAHrB2WTjW68l04fb9TAEBLkDJij
 mLsc7wL8q+fiyxJE7SkbcNpFtj4+2/tqt4UrLC7azp2WY3iF3idvCYoXrv+LCQppP+NULHA937x
 0ujjwqJUHNgpxNW2dGyLHeTfi+McfhieURKhKF+YK8pAwWckMsUb1Sqo6QeW9BnnW0bI7MyfhBK
 5G3rgO89JD0RcvIjniCKfBfULcDHV
X-Google-Smtp-Source: AGHT+IG+JbwyDUG7pX0QI1BqFWP0lb0OYydB+BpasTxsom5LPqVzrzwiajyvHToI6cH2mOOlOZF3xw==
X-Received: by 2002:a05:6a00:10c6:b0:748:ff4d:b585 with SMTP id
 d2e1a72fcca58-763347bdacdmr17649834b3a.19.1753708509513; 
 Mon, 28 Jul 2025 06:15:09 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:09 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:28 +0800
Subject: [PATCH v13 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-4-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=Ze5paCQmaim3zJLE+SGSxm+xuFv+T0ykWoQxHFa9eh0exvmqLFyGEoTIgJBruGpU5h0dCU5bQ
 XzB2G6FTTm8APL+bSd7UT2Q3ACByObc4/Y7dSxbfgklxj9Ilef2hIEf
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

