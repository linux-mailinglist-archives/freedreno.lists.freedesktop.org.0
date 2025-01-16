Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31CA133BE
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBC610E8CC;
	Thu, 16 Jan 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ypuETJdv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1B410E8CA
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:57 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21670dce0a7so12551915ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012417; x=1737617217; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
 b=ypuETJdvEyuvrdbB39UHsyweMi0/IoL+BobmW3zONyYRZzmJauivnsHWDNVqhn+2K1
 qkCQX7EGQVISqlKtYjutqKTnFT3xfQfTYODcRK3F7c/7tHMOHwuwmd4J28AMiSIyfh+T
 sWJqOATQGNX4nIxtf+h1D75w91LIF6JDGtM1CstvZzQHBwXdiupNj3kyS4hti8psvj4h
 A9Hgqzc9I37OciH0Hl3fNvhCjR1Px3RM8PAnwjK/w51pInqx4MFLplcJaZu6X9qTN9kR
 Spz9nEUBEeoCRyqTeax97HeFf6pgJeMQtNEnTfaT7XRu7wo1UTxgscK8YEtluvMibbCy
 dhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012417; x=1737617217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dz3TwZBuqS+A85PwaZAckZmjEANP7y/gVyTC1yHyCV4=;
 b=ptFyjQA3abSSwxlhzuEP41qQiPLmNgYXA81x5SNRyv3ce2dt1NBtDId7ad4rgV5zO1
 QRKb1hfug7dS7EJGnO1g6YavGWsHO08djuQVnlxw3n+scggJhmParPCwIIut7+JuY66x
 2lEzh9Rl+JI8L8eDa59j20oFS/QsxVqR878RgBDT/k823017BzO4Qxgcfp7qEBa6l59U
 WUQst1z5+HO4jinSE0cED+rRNomd9X1+NG71Y2e8o3rmkIetwLZMq8OOmll4oS8TbM02
 42nWU2mvtMqjvUsSOWgBXS0LdktgCbz+e8CGJsrsKtt+6rj+I/6fNgwC3/wX7BsJ3dC7
 pN1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVox98h5RrQvpk2awseYx+lxCT6RE7Cyg0gJUxt8RZ8nEFLAGpnIs5RGpC2JKzYylVjGVx0y9uOuvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcrLKKA2Qd4g1J5+az7gFRf+ZGi9VguX/WK7PoqFjLUTyXMSJ3
 rV/uu2kP9P9mcnzXc5QsMeZ70aStgzDAHC0Bxsy6GZMgApYqvPRAJEnSjQD+i6Jmrt/ll0WMeHY
 OoTq4xA==
X-Gm-Gg: ASbGncvMqYXVK2cj3xC7vUOLptGfYQgGSK/l52qqVWIVJInt64D6py7nfF183XIXWtT
 E3uqCjgYJI0lIcVi9zBfpgIAnikR6pEUp36eBEVu29i2mF5jgx217V815V7hx2K5czLAEtW6Q0r
 D2uPVP104zzl33gDe47Nb9OQm2/hr3eCPgHu5gsazXa4GILH/I4SWbDzcoZ8TNHZpPXeEQUV6Y1
 KWdvf0Eztg4Z2SEwWX20KG+Qaf01T1igraE//IfKp+bUpxrWXDg3w==
X-Google-Smtp-Source: AGHT+IGtMdMvQChRYDu6ipGP81wNRXfxlja92a5bcTceBrSH3LTru10XcvFatgNuBJMIKEk3mvL9KA==
X-Received: by 2002:a05:6a00:e83:b0:725:b7dd:e668 with SMTP id
 d2e1a72fcca58-72d2201700cmr41671382b3a.17.1737012417519; 
 Wed, 15 Jan 2025 23:26:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:57 +0800
Subject: [PATCH v4 08/16] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-8-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1981;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fkwBKTtkClcI8zzn1B9oiPX8S9btYMX+2rqgtJiEZXE=;
 b=80/re1ViVNpyAQG3L20/2X75joL5lrM9EVkvlA8YAUQBWQimA7nvNtD3KQVN0iYfWhEtLtu48
 w9oiV09z4p7Ax1m/RcCwDtdvkkhyvZL6zeMtSGUKAGlnIhfbXByaNMe
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 42aa685e421c7..1f3054792a228 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+
+
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
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

