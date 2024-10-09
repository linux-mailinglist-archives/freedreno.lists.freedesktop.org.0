Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533D9963BE
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2024 10:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAD10E69C;
	Wed,  9 Oct 2024 08:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W9oq2YUV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57D210E69B
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:34 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e109539aedso5474150a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463834; x=1729068634; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rQUSJNvwZ/PY6GUH9AC1To+F9Rww7eBYxG8hGTmYBHA=;
 b=W9oq2YUVQAM9BPEPb9foUI2PTqSc8hKYywxYgErfPsK3BJjzSaEx+PoEcjOd1CLrg8
 usLO3dsdY5QW0+P0QzElXF4VFEQP9qPwMcO8zsY9YGqnBjTFIgxWJ5fjt6J/P/AIqu4F
 BIx1QTPVtRZMkkfvCL0nO8hp+xeqChHaWWB4p67GKBHZ4GMZerXUOJck8xa+dDuwoNEe
 Qy6KgtFkDlL6m7ALHbh/8Npp+sHP4nGE1uCwRdNQxqHzi6sFR1xeDI9GrA1D68TVZSBp
 47iQ/UzmUSK/0dG9umKgaGW2ctPuuWd/j1bLYegAwCYpwyglAlqUOQEaoRmVGms+vCYp
 udMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463834; x=1729068634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQUSJNvwZ/PY6GUH9AC1To+F9Rww7eBYxG8hGTmYBHA=;
 b=e4SsIl/WoUuFH1ZYGdIM/6ah+7voi+tqbDwR+UDXy8can3aXTMRXWeTWp5yhM1TyLC
 kEDmYaoKVFOF/ce83QWJrz5PtKM/zbRDiKtFryiRj5DRjxbzp6RiUQVKr6rNO/MNFTo1
 ztkRmTG310KK4YW6Qq8eyS8O9/L5WisO1ChmjWHf8cfuiJHGqkASrFUgkkvYXlNFclOq
 cSNpLqjL5yQEiP4UvQneMH5YW0C8AEdCpwf6g+4RnD97EiKo1n4ZmuzhZpivu98wGO4f
 X4HTDNFnCwBcLfG95NEPemZ2oF3egsWYF7Tt4TlvuLSdpNwgz7WYLY18NhBRZW0RpXpI
 gjxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt7a7XOwTimesNcXcwgzfz7zNsHOUkJCyR2T0NVZJoQFAm6zo5ErjOcMRIe/MrOW+dz83pP8z23sA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRsJrQ/SkoC18qbDPkdSN/daloxWwad8j6iR0JNypbARRwEqZi
 UKZamSs+QFF54Z3WId5+hgvgone4t4rrPcKSuiZ5nBDQXxA/ivFw+pU0juGKrwQ=
X-Google-Smtp-Source: AGHT+IELZNGpZl+o9brSMTMV2R5qjLAQnLo4r4MZsTmntvKCuRTaaBljTAzcdiFMnYwOHsV1z7J9Aw==
X-Received: by 2002:a17:90b:1104:b0:2e2:9522:279e with SMTP id
 98e67ed59e1d1-2e2a25247e0mr2199871a91.31.1728463834283; 
 Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:34 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:15 +0800
Subject: [PATCH v2 02/14] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-2-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VkIAGwnZaBvIGk9O/Pd26yOaUH9F6U5Y+Vxq/wNMgsM=;
 b=aojPxprQ0psdASS4m8/E0MCuQj6okV8Fejiw7zVz4jm03ih52aCBaafWdJ/sa3xxRnZyuiX6W
 CVGfU1DgFG7D5QOSOi+332+U+ccsaaKBjtPHPV9UyH4D/pH/Nk9Dih0
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

decide right side of a pair per last bit, in case of multiple
mixer pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7d0fff9472441..3e0e6e9757da5 100644
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

