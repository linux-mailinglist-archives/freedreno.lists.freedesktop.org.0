Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84942A385CF
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 15:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B6010E4EC;
	Mon, 17 Feb 2025 14:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uBPMlefc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF2610E4EC
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:32 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-220d398bea9so60606215ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801852; x=1740406652; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=uBPMlefcfrcxiDyS3j28H7DiOSe6eLx47uT5jnYG7CRS2IeokzjaLaMzLAbyg5vPoK
 sYFS7e6iehwPl6P9ZQbOJL/PLk1D58gO2ggdMvrWa+Y1qI8F3zercay34duI2SRLqUp7
 BMSpb7lU6HOK7baQrFXyz16b6yrSG8d09WSrj2VUau7CAhVwYbIkqJwjsxY/JkyDCIPI
 VjwshsANqf63R9V+ViPA6oxcAf4tH63O8MjU70mdVcMMcmWQ4fO+Ue6yYxScQHjqpb+p
 k/Te9MlRlEIoeKuCR87lp6PFonESlVmu7LXEJvObsl+wkVQMSJYhSUoMSWyElOGZJxX1
 1+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801852; x=1740406652;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CnxZo728cU6Bds36JLYqHT6x28HxQHbVwrzkHphwtQ=;
 b=rEQbouoP53UR79gvJw6iquZkR3e53qLKzhiwfhWLfUyEgJAHw+qH1RVw+LE+RhCfGU
 yQgU6giSJ5U7XS6oI5LRqUlTlihTyynumWAU22red3lS7hEkzLQ9J78n2kuedc0kp79Y
 ys9zZwIRk40ROjB2CNrUF4QkR+xMkhT+Dd9EnWP7nb3P4iU7FTpczVvSkoBH9NeO2Wz4
 5Gb1c8kq6QnCkHA09FMNVdWGa8rbcx1ylfaM7QWdeY2YyTXXS/ruh3+BNRfvkUbslIQg
 gYnwtr6BT4jbB+htb7OO6HmXsGdilm2PEz7HDPaDb9fJoW1KCWjJ8yX9E3m5cfPFVfko
 6fEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTGHM2yQvFu6Z4gz9ikoXWDSQR8MSLFFu6yEWm921lYHPSFiCaibe7/hyvfSgpGnk3u/3FPmlFhow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVDQk2qpht9zfdYUWt2C0aqlTpIDXrV+8nmZ4UMc1UP/9kdbpF
 /Qz8fvl3LgAJMZRVwpyuxyeNMfZVYBHhbGRD+ca3EM1wYrdiRYDbwvpkl7I9c1s=
X-Gm-Gg: ASbGncuenOy4FZR+tNtVigHYYiyLmka+VeulSU8txBpXyA0CADDHYFT5WIKnPCaDTGm
 n/O+asi6iqfZZGTAM3/OwAXrPibIgzuw11OjgNe5ATZHILk6z5FOxq0pQTxNqaiMMsAEkGheQES
 6CiOh6781T1TgJc/oMjl90cUrFgaQzvP9+s2Cm+DpdmxCun4+grNjwVqiqdNLDh400v9zGaGLpW
 jocDL0jYyjn5uu2t4Ea9td8Jzn1MB10kGjxfoI58cIM6q173dRJJ5UBlwI+986z1u8hbiSZWPVw
 Ufm5TXCHxBHF
X-Google-Smtp-Source: AGHT+IHaD53v+SPng3uYJPEofw88FIK9ZP+O2KcaexT7MncLnnkv/HcyrqrLBH/PoDwf8Tt8V7NBOA==
X-Received: by 2002:a17:902:f70e:b0:21f:3e2d:7d35 with SMTP id
 d9443c01a7336-22104025607mr142318155ad.15.1739801851724; 
 Mon, 17 Feb 2025 06:17:31 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:31 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:57 +0800
Subject: [PATCH v6 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-8-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1833;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=abNbpRlXHuZ7m2O+VGB/4vwIlVmkocNUGdti7LPWNjc=;
 b=eYSXAYvCkNz10FE2WbTG+bkySWvWHXeMrax77LxLcyhYt4QdlkAkkV+zY0DtldOxE3t6lxx8g
 9W8sUUL6/LUA+NmwVpaRy4xAkGnH9ITtveh8Gvpsxv3/SQaRfGy4BkD
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

