Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E74A385C5
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 15:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634E810E4CD;
	Mon, 17 Feb 2025 14:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SAQg2K3E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D2210E4CD
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:10 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so90426895ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801830; x=1740406630; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=SAQg2K3EPB/xr/iL2e/2WCOG1ErnioRuyVOufaLhH6FzdPIDJwo/7y2fQeQBHnYfo5
 4mudiU8Zsl9xsCfFOb6uwuVIAS5ms3BoN3WWuK2alXcJ2wcZqtVTMEkuGu5dVbPbWgEG
 w6GJZNHEWiyxJXIUET7UAuJ9bq6i5HeINX+izSpLVBcBMNLySuDyHTB70pK4ctizcz5h
 Q7fIf7UXOkrdFHlRMEp7C59ovS75cE9be8fkNkSBCRKij7ytJgxlwJcfxW6Q0Iy7Q2yl
 Soqq9TuWpkqRDDpBKemiWyEAcJXKqziiXILdbeeCoLYo8txK5ria57PK53sMKOh0uw47
 woVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801830; x=1740406630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=ZVt1O7RQp8aLd7rO3q43ygn/XWE3MKV6LV2wEODvzRPBmKaKo0ljyZnngsivsMrt7i
 EXZqpGZrCsEv2jHtg7U0M2KSFvQSOQQFOzmMH2CUtv7rAGdymZveGYuURT6jnacqC1ct
 O/h4rX+qyNiYCifxlMBaS3RPmhfhXCzo/yxsLdzZr/Zwlgq4UEk4NrFCjnsZvd8xD1kC
 i9evWX1Ac3zJAdYyfmci0rJ2vuMWRdIakR5+AaJx6nDKZuym35i/ixmmMUx8xR4ltEGp
 coH+h5sMCkNg2CNXQOq4pUG1DKS7ft98j6fiRqqeQ1K68JHjQVJeHIvleT/NRuBRmk25
 irEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwh8J7abHiwinYSv6Be+SCOTgnA+kIPotNEXvdFjB2lfBCUq3tHODH7AVTjWxxOfpaDWKLQGBHpak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQMPuooVUpGuk0vDVTC3wMKDthuy4O33d+pxcgNl5JHiR6VUNl
 3/Rcn5yF//XB2Thf1dd2pcrRnaTFsHTXDLGPkpT7tDX65GNiJuM78u8bqHggVx0=
X-Gm-Gg: ASbGnct8cjOZpB/ZxvW3GIOQWsD5q2ax9RkM0IppwNlvBVhna89ftb9Iqbf1UztTsMG
 FjstHXv6F8hIwGNADMHE6stE9JrZTWaqREnd5JC52hd9c62SP1PxN1we6Xoqe44pp2XD6HJgdZu
 oboQcQlYPH+mG2AkHm1+WrsWvQ7gAglhe2eKoqUySJ56JDbdHTeezxb68w4bmxYXy6QtRx116Tm
 upr30mHo+hdeGEuIHzuaZpRLAkpFJSX5hb0JKfPZ7WMAapK/awGa1RmTLoXijMnibZkHte8L6rM
 bengyL0Ixkts
X-Google-Smtp-Source: AGHT+IE9VGK9EgU1CxOnB42kWoFCngkyiKxATWGlwXIJ1zEtEGlL0r8wzHMxqCOdBQTbkw6fFe4mgA==
X-Received: by 2002:a17:903:28c:b0:220:f030:376b with SMTP id
 d9443c01a7336-22104057e3amr166616685ad.21.1739801830048; 
 Mon, 17 Feb 2025 06:17:10 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:09 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:54 +0800
Subject: [PATCH v6 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-5-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=ndip+BiznQsCLk3gFRiHk2aOU+/6Y0wWrn1S88SeHOm2qcGPMaxjsFB0wWvmm9AhF3VwCkouo
 jobG/vDz4dhD4siduIn5Zlp9SCqd/s42zjGoVLwDm7AnDuDb+ikuCak
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
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97 100644
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

