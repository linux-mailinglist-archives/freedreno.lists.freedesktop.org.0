Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0BA4C485
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A89F10E45D;
	Mon,  3 Mar 2025 15:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mb4QrlPL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6DD10E45C
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:23 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22185cddbffso93797435ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014923; x=1741619723; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=Mb4QrlPLqlh3yyl7+MFhTyPDCtZ9D3Z6lnN7D9jALafacJ/KriVom289FPnAcZ1+VW
 TTugWkfhA7Y8PAM45jDz50kMGvzH4A7OQxjvJbyZ4E98f26Sb0kMGPHp3se1VeyAcsui
 zUXhl+d0ZKI9Du2IkUxUpBNhl3/yYjYK5pFxpUKmqEGVhM9gMNrBmupAtC3gp2mCqglV
 iiHx3bDit+JH30/1Pdze+5NEZtPaTN4EfyR9FwcDWEjxOd1eZox7UKAaU8HRFANwY8lZ
 bQEVaWADfY1TsayWFa8p+y1PS1BDsQ7mXx+607YxF+RQMXaPcy967+OnTaRI9My2iYYG
 OTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014923; x=1741619723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
 b=BErq5HeNBVqJHGNLZpK1x11pq6AOLAj1P616GrTr5REapOX3uOmsdZX42NV2ukB4RG
 dlroP3qHenq7cHMJNbbiNxdo3soLdeJXyVdwxAepQsObUz4e3EqESpJK9LT6P4Vv6Y8L
 9k5oy3z8jw67xmy1l7aZWLH2EOv5kOtMVmPiXU8UubzWbWH6ez9lyY8KkPF/y4ULd69H
 eHnBqpEPYUsOi3QPEhMwlUSK6uSTXKW+GPzELYRO8d5Q8hWNMide9dVtfrV9u/k5V+B4
 /Pn9c+/DyfOZpVQZng/zBqHq9a20ZdzOE4tBe/9kWbsQmqkVo8WgIzZagZWdaN5rvanm
 iyQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS7snKMR9U8AlXoeGULQHsnQdUWGrkV/xr14TLsdKrk9Qpn51uExTAB2mA2Fy4WEZ/uAj8qaJJtdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9s+K+NGMLzbWR2XjSPDLZgeXL/lXaL/JHw2QB/iUIT+V2/Ps1
 9bFftgBSAvo3NUhWUOW8PvJUoXhwiVXdKoibyP0quBDLCqzzJIMsZ7PebCtZ2yo=
X-Gm-Gg: ASbGncsg6nFbg0qCvuEUeV6BQCwPSMUgFkASiSowCRU/gVTBvuYM9oucvYNULn7hCgU
 h0nYANU52/Q8c8pavMDFi3Tl5SOKvAlJrbGXYGDrxy48rEw858rFAzj2/QCQOA+MsNdZP51y43d
 k9zqL/jX3LxsdmtrVxxgh6cgMa73L0JBS5IcqFDEtPIUXNHe/x9RQcrXcDFyyY9Ntfhs1xoj5jd
 W2zrRHBF0maxHY4E0lrgUUFZzmeMZdQ2xrk/6QtWYeLaJDybMHbXp160tzRM+I4o5l1CG0d8lhh
 NUHo4i9v61Ot4INqgz6MZ4CBit2kraffw4P5dkhfnQ==
X-Google-Smtp-Source: AGHT+IH8ciiBAiPz51W2tR23I7EbaKEiqHRlhwb3pmWcoE72Do5A2AxJD4u+8qKk0YjyQanKYtbzqw==
X-Received: by 2002:a05:6a00:1310:b0:727:39a4:30cc with SMTP id
 d2e1a72fcca58-7349d1a73e0mr28617699b3a.1.1741014923366; 
 Mon, 03 Mar 2025 07:15:23 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:34 +0800
Subject: [PATCH v8 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-5-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=0UvNk46EPZ4R1btXvQ5qsC6M/xPiIKiZt74mBiD/8nGd1TCcQLFWDWnxpVruAaubbFg3jMisl
 7JN9ORSQifZDKqYz0JrteTdbTxfJa1MxXbP6jYP/s4c7/Fji7JTh7T9
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

