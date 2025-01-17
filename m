Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA26A15372
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 17:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10010EB2A;
	Fri, 17 Jan 2025 16:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vefQ/Fm+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4010EB2B
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 16:01:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2161eb95317so45753585ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129717; x=1737734517; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SZbaIR7dHDMQxC8I7mjGoC4nrZcQfmrWgKlzRdb53M8=;
 b=vefQ/Fm+gFrzOjiwTM/rN8PQc4SyrptuzXnRT6nYlzKPS4cJdYdX7dsxRdV2dbq1jx
 XEtDApFegB0TNI/r+iJc/h2jqFge4xtPwrjdUg54ZXI8WEnHlJBOInYVU3l7nPYI+cQt
 m8U0jUNTCKLLr4UJ8Iqm+3bsSiVgwclJy9E7iv7Oi3NIv7O8sngg888Q0Y2Zi8LW2GU+
 q9tFfF1Ci9IJCRrEa7iA98Q3lsyqHddwTrsjbWOfjYsGVo1IKCqe09acDcvvBPy7IEHS
 lNjwsPgfqjCGLetG/Sulxz7zoS1H6rWzPKXxeaaCfogRJyp5ArNt2PrVoDkX9rdhqKET
 m6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129717; x=1737734517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZbaIR7dHDMQxC8I7mjGoC4nrZcQfmrWgKlzRdb53M8=;
 b=NfZxyAojy/IS7bd1H49kqjayJ6rdLGN7U7IpT/zZDhiiROL9QtSvVjjxmn0byEBs9e
 aDwd0ie1SQVilN2vTdyB2Tfo174Ra61F6zCCuOb9Fm/oAm8zxP/wU7CCEJf34FgE4lfU
 r0WX3hrQiFLlZ3WkKh0KH5pKmqXMRw/Hx4tsHXBtormLHSOBhlJ3gxcbsXuRb/vApXu5
 zEghE62RFFylxi9HklkfyKEnIGHwFSmBCp/dYdjfTP1Lot7/7vA/vv8iWntsybeBIYr8
 Q8tcCrVWry+APbd9olI8lBrf74lQsUR/NoRWjw80qd02WQLBP3g9hmt42yAVQg57n6FW
 /zrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeeBGUVxTsbmtUJkqZ2e0Du0q9WeBlzcuObH7T7dyriyIEW+d72wQqo4Ef9V8nFnUsW9YYKs+1mlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfluoZZzSZNygxAy01zSS92vOYjjQZQXPNLVdbZ9wFk8kEoL8E
 +gvvcEX2p/D8Vvbh4SADuk/Q9GssA58a4M+EhDr0SyK+UOCzFwSavPmmwdpekD0=
X-Gm-Gg: ASbGnct/KwgvuiT+/TOmHVZLMo3XcoTj1tVsPkQR1uVbIfvcDdMsu4Fhbx8CVRNd46n
 CCNDnJjZsI239nTcvPcawtGU1IGPQtgkAYMmJ/+8IMDA2JK6DpDR6ur8BjzRiMqsuGdnugHcWkk
 yu8IfaVjtBThK4g9CJ2WlH99FaDAUM/o9u7GKH3y04fWqWCwcKAP1Vss/eJFqsJZ5UV0S7vIvKO
 raDmmKtwpKxdFO7eg7YsZDYZtPawN+OkoAk0U3gR8X+tYilGKixHw==
X-Google-Smtp-Source: AGHT+IEqfxn9M0Bkr9IIjKNJ3t+p3GPzFAxf9/DgDBJqoL9FSnKZWDfy04Ym5dEVVUO6v9oNSWKIMg==
X-Received: by 2002:a17:902:d4c2:b0:216:7cbf:951f with SMTP id
 d9443c01a7336-21c3540c3c2mr47309965ad.21.1737129716777; 
 Fri, 17 Jan 2025 08:01:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:51 +0800
Subject: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1981;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=+L3JP4kGTgA7oWcgBMKBnBfyN25l5TyBF/5a7fjKJKI=;
 b=0+AO/2TIyjXQZ7DebGP/1DwvnxFLkVSvS6LmdE+M6efu/7XGM5JwpSXrrpKpA1i/s7V3O6TKX
 7Dz1TQ+06noBbYYPZS7tLiEta13cRDhYaLEmFs7PFBj4pDBENMi8xcP
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
index 018a1a49ca7d1..b0cab3ccbb57c 100644
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

