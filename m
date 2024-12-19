Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0B9F7622
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6707910ECA8;
	Thu, 19 Dec 2024 07:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hAkHRwgX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D95610ECAA
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:50:19 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2156e078563so4357995ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594618; x=1735199418; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lli+5tH2X+U8aWpWoMo1klotVHUOV8UtSv6HuUwkGTQ=;
 b=hAkHRwgXQDHQ0uMJUuqKHCD/JLC9vjegHlX62iZ9W+g57wooJy2CnjVoSElDTgU/5G
 xCcUyxDXnkVWcBsxCC1EIeuvlh1Bt/UN4MSC52mJJnhdLQauYQF12142fiykMrR0o6c2
 iu5uSO7cnDTdYUSpTMqR8honIDMjMx13F/KYBLnOXUEP9RuUUHVI/6iNoeQ/5vhsL6lx
 pBYvNzK84roVUvro7dFXNBKtdGlFEWrUvwQeVpuIVDAkXX9C/QtwwqE+LspSSYoUToRY
 NNHDWFbHOrj6rLIHShVXNl6q+i61NzB3e8TSBuAZDHAPVsonJJjLXlRIbcelluGLkpyS
 nhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594618; x=1735199418;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lli+5tH2X+U8aWpWoMo1klotVHUOV8UtSv6HuUwkGTQ=;
 b=bK5629qSBaBdni54pSNr6cvVWAhfvXy88W4RKWQ6RlaD6/jAl15ezzGuqalc6i1OCH
 dJn9YH5qQ4HVJSKso1YJnGhP/MRzBNx5HEE9r9eEyU/BRhrj5r1rSXNN8VYvgLUSZH7i
 IaeHOXr1ii9D+geqzftZxRkKDgarl1XLctwVab1uajKUaLPr1o4cBNyiP8tje/3sbv8r
 QgA54DsTQ7xkTYXXbgJG+DqolG2Wfsw7ZLe3q35yH9mE7Awmk/6y1uSIrm820x6/4y5b
 EADqC14VW7BHkqKGjdpUDCWrH5HOHUzWnGdixq1DVgL2CSiUgb8rzoKR7R+GSLNEZLiu
 jMLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1iLz+oNivK/2mHGqoIcoj/Di9Boh5ZOFmg8Z4G2YdresGdCxxC/LtbUbmW0fn+q4Y/KjN7nZEa/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/mXJNd+fxFgrS2PyBOBggIOXQ/7iFCKCotEvCfZNNk+AqGcli
 BZBevdlQos39WbWEeS8yQWNDdTNaIHOWCouWWIheakFBtogXmNqZWtmwC+mjjBU=
X-Gm-Gg: ASbGncvbK/EKw1YTxljCZyi5h1gV28m+CHfINWIN/Rhu4H6i5UWLAB6OM0c3mwVgxwo
 N5HXvvhKNH5NWZmnVIiz6Bb97Hxg22T4QiIg0YxvB/oKhYvPqWYTZFybhH/p5cjKUHd1P64epml
 1s6zpz4Ilptdsa3ULMO/f1CI2p7iaAaPLLbee0sBkprPm6kwHw2KOlYbHlHKl31lpkbYc1zBCFq
 orvWkaJRK7rBORqPNn4u6Eqf6AQYcv+LMOM6RrZ4D3eJEr9sOYMHQ==
X-Google-Smtp-Source: AGHT+IEQSTniNO//F/A9g+Zys4CYNcQ3vYbwx5b3wwx5Lzn1nZuhKfyiY+QWxw8KJsSb8lhBnthlDw==
X-Received: by 2002:a17:902:e881:b0:215:96bc:b670 with SMTP id
 d9443c01a7336-218d7216b9emr76595075ad.18.1734594618593; 
 Wed, 18 Dec 2024 23:50:18 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:50:18 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:25 +0800
Subject: [PATCH v3 07/15] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-7-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1925;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=1P83PCfCS2lfs0H8yVBLl5bdtpLcjuxoQO6Bi/oLzx4=;
 b=0illn173nHN5yDx+5A36VQEy2DoORmhhY2O/tudk2pDLuA4TxygTKgNARKLN3M3jphyKuTD7U
 z62ZZKZDsBLCufkl1g9MZTldnP3NvxVSY/YwSMcYS3pe0CCTv0WWqUN
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index fd32ef468d5f9..96d06db3e4be5 100644
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

