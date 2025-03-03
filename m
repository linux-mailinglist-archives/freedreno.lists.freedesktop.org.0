Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40765A4C48D
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 16:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FFA10E460;
	Mon,  3 Mar 2025 15:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hMQfknQX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0911F10E460
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:45 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2234e4b079cso82398035ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014944; x=1741619744; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=hMQfknQXgAXlSRq54NzEHt19ORXaYqfDEywU+hcenE63F74I/cDn7i6RZCE4/5Uxqb
 0Y/A2uWS2QKN0E6LkcHFoH3+2gWr//EDbmIaCbrhkP8jkoHeOBakpHqAa9u0jdPFq3wi
 yvnHZ/qTYTWQE4f2t2tABCuYUkpESLVmESVZYbGwHA4oCSTGua7B4TqnTXMBU47nLnJU
 8wiXZkXKhF/DOqVA7enhOpCpyDoiQcTprRQEtwK8eru3GisSus4i9VOyXQdvCr7E8G4v
 A1dvVlGho3dqKVjnvDphmPs64T0CoFjaY9digq/D/HOjEKS8zQVF7ojFMeYmWbDpmvGH
 nr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014944; x=1741619744;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=FPkmPV+WPBgJ35Dc3ZAPmyYIAyLoKaSHk7+94s40akNUa373Nu+3s50vHBVzSIedCs
 7p65qcRDsRPm1DiIMMnsONgNxz3bGdV4Rz4ThdAX1XKFm7PM0fB6DSJwg7fJVlC5wd84
 Vmx4H7Tb4FykQY1qXxk1UiotggqKXgpdqKqHsuURqq418V2r3bVkAKChFMIIZX3alTm8
 /in2xhY7l6ZNAAVafFkBEMLycsMtuOdZBMmbzDLa35Qle9SwYJmveLDE7bilq2QsT0b9
 RwLJbfe0D9jVG61ScJmnLGTSEJN1gLmw8T+7/RcGLZFaHpTg6CQi+jwZ+/3saPeuZBu3
 DQeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzbcgkwuAJ9fYQS/3qXJG7eIK2j5jpHPQI8t0wK1/zwlFsghM0OAZrv93Ln/o8duB3b1tFjiQfrgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Asw7JxIk+v9ARLlzNUb+kuE7c20WkyBWLrpNjQi+SUdRqpLh
 Qc2MG+qZdo9GRUfI3VOSwhNvbRAFrbKwdYNEfd2grVczj+rB4WG7zbBgBR15oOw=
X-Gm-Gg: ASbGnctq1jdezCY9BJ1nghMmgBc200dKAgvAFDsxPJoGbh3X4adRPwEV1pGeW+ZK1Xn
 5Y+OKFjB4bQZ1g5+huLAsyZwOTD5kMhQAivXdQEqSgLIOxAM2x549RnYi1DXvkOQbsX1nEyqkFl
 u2V8ALxXtOZNr6xdcLcI/sjDMNSKRC9uq8CCXQQA66MsMtjkjrE9pC/y+QEdiC3q2Uglul4uoAJ
 bCcFcWY/bli1SaPWee3qgMD/IX8DRzhs/dD4bKrSQgeyU+xqfN4RyUQMkEk0MDRp6SrPFH2xloP
 4zI8JA5zwMDsqxZzaFxYSSpQKulweuXkorH31DVxYA==
X-Google-Smtp-Source: AGHT+IEg2m/fKRl8NuF/bQLQAXhw1TZ3bcnJihpWao2bd3w+quxqO/hplTobUUaPhbEXNNJOs4bH+g==
X-Received: by 2002:a05:6a00:2346:b0:736:5486:7820 with SMTP id
 d2e1a72fcca58-73654867d3dmr5458326b3a.13.1741014944577; 
 Mon, 03 Mar 2025 07:15:44 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:44 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:37 +0800
Subject: [PATCH v8 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-8-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1833;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=abNbpRlXHuZ7m2O+VGB/4vwIlVmkocNUGdti7LPWNjc=;
 b=jmcI05kD0Lk55iTgw8b3SeomPl6ldCeoX+Rk6l2P1K3v+BKRthZHHQ2JcIv06DE/dVpNXjvLF
 OVaG1qKQ/OwC09PlvpYg7YF4oR0vFjOaDInuHZJPj9sRa+Uu280nXTY
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
index 018a1a49ca7d152fddcce7ffa1a0a5d54eb615af..c89a5da0fa8321e9082d5aee304fa16402bb4ad9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1220,7 +1220,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1275,11 +1275,17 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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
 		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

