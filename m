Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF3A45F31
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 13:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F8910E21D;
	Wed, 26 Feb 2025 12:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WJ+Uh744";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76810E21D
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 12:33:16 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fe8c35b6cbso502710a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740573196; x=1741177996; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=WJ+Uh744bCjThgUC5A5Ixlbm5wAEfyTcqIsiW7XJDzktUkEMS8tsNmzcdnjTmB6NAL
 iKMbtBWceLkA2kAV3K4QfL8+CyxXZcvcxwareKi38ZDOhqBvrdtbCXv3mpZkOeXb0OES
 JyjQmxwkX/OtgboER+bquB6fRHkBSHxwEfiyJxGKHSPMxtLCJoyGJ+efxGnIn3w23t7f
 Yw5lQ17iKp4TGfs5hs4orRyyl9H+coCYSgBDcbU4BKX1+PtXQ6v0C0vHuAWvai/7Av5Q
 pxC7f3td2844X/hJY10AGeGHuypTT3nkk/GBP59g7zXNFqu20Zl28MkeihuB9ujYMFU7
 knbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740573196; x=1741177996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=eGrCqJfkBdwqhLcd34kGO6oexvZGP8ZGDJ1tmdN9Zj4RdscgaC160Q/Bc1hdCoTbrn
 iZhei3ZuhH+xLkOOrerLYWsNBSr3Hy0KpphtMh8ZXGIRKqFPGcS3GW+NsU0vtWpMXXyS
 jEhHt6lSZxBr9mN1257LEA5a0+QoT81BqcxvzEcoVxfoUzP/anP1i/E+e5q0XCqkCSCz
 RiQCHBBHPJXGse7vVXPVcOgITv0JWP2PqGJKhe1GMKPl8IkuyTZcypjpcvBKzstg2AC8
 le3/5s9qpzRnuzrf316eaXe2tThmUr3/Ejs1M/tY7QK/EPLW3ymlHgpsiIwt2qXDDagm
 KJgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZ7almOBRrw1T7ozJcwYIx3y+jaAgweJspnqoFTPB2FhV9QOe8Nr/44MUYjE89rdSBi90ga/GnF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF5F50DdtNWbjM0GcW1/hcFhaweGMdmISIjiQI/yusWdrgftpu
 3li1ZcglqDNE8xOtCluc0JI3Bi1uTrm4ru84RmRbKOHqAZMfh5IFCBf1S2iuQbM=
X-Gm-Gg: ASbGncuG2o/6JmR8iHO2fk/DPSMyVETkm+lS9i3id6dRaS6jwl/vvPiPrdoUc+GsmiD
 H53hT4Ys6mkM7qsp3jMLvxp0INLNmiiT3i3WkZTsv5tWCyqLtPcffie19nG17bVUdi2/b9BlGhY
 G4R8PPMj0nNMtg5hsySOP//26Hkys3DsEpAqZ3d67UhEKvOs9tmdSNUMpqDW7bmqGLBQtpTXWrO
 ZLBabjNl1CDkRH04zcj4zZNrHyOqVeQQTwl3zld7by3sC2cutLGGZFpMww5bNhPEbzwknuyqM6G
 d0ACJD0pIiDaAh/t9CWfNg4=
X-Google-Smtp-Source: AGHT+IHVv0yrikMvgAdx6REBH3QlKkyvnv9uRabQC7gUyZETLFWKVH2v2BHNQD7OyE2I/nvYWl70Fw==
X-Received: by 2002:a17:90b:524f:b0:2f4:49d8:e6f6 with SMTP id
 98e67ed59e1d1-2fce76a2737mr30710402a91.3.1740573195748; 
 Wed, 26 Feb 2025 04:33:15 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:33:15 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:57 +0800
Subject: [PATCH v7 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-8-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1833;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=abNbpRlXHuZ7m2O+VGB/4vwIlVmkocNUGdti7LPWNjc=;
 b=hA+IxnJICm08UCSRxQOh06pxVkrGrtaSNApnAb3JQQyQvCd3NOS6U73IhMSqgG+XEVNrBI7+8
 t+uMzOcT7mMAf60gBGpFYydkYgt9vwpSV9fsZbbQVhF9jqnpmz/aKjT
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

