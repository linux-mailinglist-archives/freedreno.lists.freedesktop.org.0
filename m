Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E59F761A
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF4810ECA5;
	Thu, 19 Dec 2024 07:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YJmc2ENs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA7A10ECA3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:49:57 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21670dce0a7so5443325ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594597; x=1735199397; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
 b=YJmc2ENsAGp3EcuiOA70FOgQzDgp18dJ/wnOueo+Y46BvnUfdoqAXbfP+ICUfJuotw
 eEIRNrJjVGQnT839czc3UL+J4V1p2FSxIX+uRY6UlH+rLtXRYa2m93c8FxjV0U40kb5w
 2SQyBCRrrnwcIFE/aMuO/szTKfPAxI7Bx5EF6iRaGCBFdMaCgkX65+Z1P7east73y1vk
 FFFJJrl/3Y6dbPLpmcbfGKwOA08SOU10m2HmsFC+13qO5n3s/hLGDWcUW+E3GMtqaWjf
 xEFncvbHJYT6lN3eWYZ6cgxS+Hin5ttODLWQmqNF/9oBTRP9/G5QNLDIZymhdxGx6xXv
 i1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594597; x=1735199397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
 b=iGECLp85KL1kzQbGYxIlQCrbqKjbkyzxJuLhKAZeVN5LDchLDDavNxGKuuRDcGmtWE
 vgvD3hwKp/QlPQTzrWYy/bqOHJj9gKekDJMGKVGcSD/Ytz6Q2XwGISI7cR/S90epScBL
 +Jmd9z90NdiorFP4+DaYjSSmPq/3ecxiLTnM4lf8YduLqPQ7UIXZckWME0swEJ4qvtiF
 6mCFo3em2PeJ7nTjjG9HFbox+jIGcgCOg4EcdgWR+uzeH/0YHTOtWeKjPT8is7KwewLo
 g0KA/bN7arMHW5lzmHV8KTD+96R5Bl6XN8m1RxmzJSwsWXe9HiS95Gak17cZWQPdEQts
 vIoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXplxIwNjGu3ttkmKXq0Aj95B9qv+FM1f1F94nTCjAaJ0Yhxd4K6ySoU04F5yns34EoXNb24ond2nM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiGmC68ZA3r07lIFyWusfanBBzeksZAXhDKfxhstn3+O6yZ0LV
 CaPh5MuKATwiRW9y3FGKSo2Vbs6okt02T026mBMnSotrQw3kb4JzCzbI8Zs/mqU=
X-Gm-Gg: ASbGncsazkaCE6s0ELc/LeZfSaSVFn6Mxsv4CtgijSv86nPdF9VbJ3jaziQlmA2u3ue
 RsgDsIeVTecGdE3xht/2F/BqxV7QYOdU3SRAsOfX8rwLVpzbMdC4UW7Sr0BO9BSnMyU7+xlicVT
 UvN15iFNjb4ErUIrTDG4LOutR93P9hIpbd3FOHvQ15kqDTYA/atN32FscBdvCz1ye/pEMulnj6X
 cOv8iNEd2al2XThHpyn4Xk1Gpi2xShEdHr0Ut8qt7fMEJ9mt0jy6Q==
X-Google-Smtp-Source: AGHT+IEIuQm8BM3R5VmAdsk7F2I4BPZS0vz/z5taFEvNb6zAXkyIxwrf4C4EqP7xNztbzEzQR/bRgw==
X-Received: by 2002:a17:903:2b0c:b0:205:6a9b:7e3e with SMTP id
 d9443c01a7336-219d9901901mr40917305ad.56.1734594597497; 
 Wed, 18 Dec 2024 23:49:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:49:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:22 +0800
Subject: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SPyiBgL3hfMVngEeCufF2JBzxfqk/rbHqElyh4UjDxo=;
 b=pXN0nYxNuCAd3few9qkZw0NaAGt1iWhzQs66UXTaamXatgEGLwTZGiI8Z767QZ3Inz+g1Cy5J
 +a46j5hy40OC+6jLhxP11YqtKClm8L+DXz2Iar2rUdv0mCjmJ+T+eZ/
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
index 7191b1a6d41b3..41c9d3e3e3c7c 100644
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

