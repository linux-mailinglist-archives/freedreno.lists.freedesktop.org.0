Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA6AAAC9DC
	for <lists+freedreno@lfdr.de>; Tue,  6 May 2025 17:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940710E6DC;
	Tue,  6 May 2025 15:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SKak6r5Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4510E6E6
 for <freedreno@lists.freedesktop.org>; Tue,  6 May 2025 15:48:15 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so5570428a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 May 2025 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546495; x=1747151295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kCs6mQa6d6Sysv16lrw4i0rJKFis740t82vRQM3M2ps=;
 b=SKak6r5ZusN4/Nth3wHx3rKVu0aB0Y5FECL0Y8GgPj8+6+4wezBLEit/VUh96ZGj6y
 Y4kqVEtxXN4e/WetM9k8mEUU330Mb6nZr5Bf8Swvf13zB42Soy0zKnHqF66U0OAWrC1V
 eSN89YGmJbXSx/ebKBBthBVB5/HhhP7FK75UecwAInC8I1UIuZljKS7dlkjpb2P8bBRy
 JtbTmvC6aFWHY5RApgi4TKHf8GWwfBOEoHBdYRhoXXXtG0hxn2UOSyie8kwZJOG2OoRk
 Gj11wRrVaYmebt9g8mnn58eg7H6nCshsEau7Nu3XQMsu1WXGd0tjqdg3U+wlVyVfJgmL
 jvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546495; x=1747151295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCs6mQa6d6Sysv16lrw4i0rJKFis740t82vRQM3M2ps=;
 b=atreO5obT9/OYCUgVPV+307CKCqwqRANjYFszAwo0dSC8dyrFD88FuGqE1TQdYaWbr
 tvMUvTQJQCBgGE6ZK9fC0jM1A/lLtPKtTPTqljpgWGNtIibvVd4kUBj69pwyZuX9GtaE
 WMbD3vOdxzmYqVglTCidS/pj5ec81qHYVmCvklmZFzgefrUaCIQAVd3tVdMf0UTLZNoA
 ch7tFrx20Tr+zIp7lUHlODhUj9QuJtp9ps/pQx6Z4dFLy7MInYR9zK6kNVdzdrqQPXao
 G7xxUDvBM+2u4hY+Nd4kjOfTvcCzSrIak7SW6FU0gDKfX1ltpX8BhBLEnS0m8LHXyyRE
 T2Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYer+ooT4B95QIITDdLc9gyYxZSjAi4Llv7RKtE4ZjOG7PV+YwUhP+DdhcXHSd3oGUpEv5SQXwYy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw03zJULsF1oDntunN8ibZvSy2AGGbPWsISoiHpg7x8cNRcuoEs
 xZEUK8Ke8jNmnibZVjkv5zAj8exTde2k7vNjMzrJeCI5PqXDIEx93/hZyJKbljg=
X-Gm-Gg: ASbGncvxv9arJ6q/O4cWzOI7nCGU3+Z1qVWyEp6D5phRAOtW+yEnJOv0SNLa7Pv1/P8
 w1E0CaKZQAp5K8wQhWyQnt/K5lgSI+eOp3FRONM20DKFdJq0khUA9AYBo3SFGhRoyR78NbN18xK
 VwJ1EJBOR1WCIji4D2rH+RJOf3/YhthMI49YTTadzx7QAaot4lIi6fCy5Pa8rV+82oMxZIKbNAj
 wXyBosnjFbNUfsjHGTkaL5ESjO/yUruvPC3cr+u19hoDZa+1y71xcnvYoghcZpvXsAPyNzIMcXR
 ihqWRAhHNIIDLCB8i5p31RHSoiLwZu+UFU79wg==
X-Google-Smtp-Source: AGHT+IHaKwKEvXzLTqTr/1A7MQN4Me4XT0ed1TOsVVnu7pipcnmoLBioOA2O7sPAGBJ8Yn6aH3f1zw==
X-Received: by 2002:a17:90b:2741:b0:2fe:994d:613b with SMTP id
 98e67ed59e1d1-30a7feb391dmr4817890a91.35.1746546495150; 
 Tue, 06 May 2025 08:48:15 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:48:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:34 +0800
Subject: [PATCH v9 04/14] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-4-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ElZgntW6cVR9qnlks4TCWMj4wphRN+VzmR8acR2dHO0=;
 b=WurUww9qTP5NJzjw7DKmnANRtQuR6CmdKjbio9SjuZbzLSg6ZoBF98Mu+izvbv8VkWc+uLJRw
 /pltqUhwsF2CUO7V4/FlORBn3izCrvO6BXXtDHddEqkSkLhjfyvokQZ
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

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..b0ee89ed7053f940d01bb55a8ea8de8ec5bc3462 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

