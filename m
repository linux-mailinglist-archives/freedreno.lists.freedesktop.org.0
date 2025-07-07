Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C02AFAB95
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFC310E40B;
	Mon,  7 Jul 2025 06:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wUZOj7c+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD50C10E411
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:20 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-235ef62066eso43094625ad.3
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869100; x=1752473900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=wUZOj7c+9vZDYYwva52HHj5g+CSBQ/Vjxjo/YUYzpuilGI3U4KqW1NSnoNqi0JBM7B
 jQQOfY4/3W0mlLJOeb9Hn0EJTNzT4Q4KXa0+OYwXq8mMxil0r6FtppKRZlh0LDfs4yFL
 dYDF2XQn54c6oL9SfcpsWLWYF6nRb6byfF4N7kneasFeiLdN4n5wrVuF+SdpoIaF/sVM
 essw2AOwUA2rGyGT2iaVH8Y9rujWio0QcQJ48dW2DpHlKSa5oBgEuTyE5h8RqFRPcS6R
 +enRF2gdVoaPWYfTO3rhnEkTCvEZ9dqEAO3TE0/YyFiRRQNysOK7VhJLeV/apAete+aL
 4lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869100; x=1752473900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=uh5Yg7Xu40hAh0IR/ZzA9KsVOrNco3nZsd9entzT95URWijgfzqui10LlXeHqUMQcP
 1ErTdveKzOjCoRmUPRfI/xaE6Ka3qgTAcUV7ysGSIOqreANwDGrSbtOKsXf9wNozR8Nu
 H16GwD1RIAbYZ1G4I1qAlvIA+ZOByE3O7MdrO0+t9CaFRE9OwIFG/dTk7CMfF4qUlwN7
 0nWgC4IZVtAv/THVpUVDt6/kYHoNDUVkv7dwh7woSwpH3NfMhkO37vwGQw23siNwoiA2
 2QVggTZvw1e4D/DP+QWXIQ6HoozZ3Ecxz1EVUXgTRBm5ixd4J2sYFm6xerSzP5rQl20v
 dPcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9cRMaLgJQ6vvRSnaKhiSOcL5R9blDOoTK1qJeb6k/Z/QJ2vQIJCilMuUDdtUG5C6GItIgF1OM2mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxawFJFqNULd+NlatUOA2LL9qXymNf6MtnnFu/IQPVbmv+WiMA/
 nriqezbn6tdWIrQ8bawKdbLVNx73MFsJuOj3E65FFm+E3ts6SrdNzTrUtli0JwjlDza3x2gYnzY
 KI41L
X-Gm-Gg: ASbGncvg7DNqlYK2w7BQG+TAhZNhJ0u+EaN64WMkCYF5pbO77f2GB3Qb7/BxL59C/lY
 cS7xHClXpcRVa4AQ1xquAKIq+9R2dpz7gLU3k1vl1u+IauLVgjn0iYUIXl5W0K239bb71Hw9ZYQ
 xTmVepssmN3HT66RFl0cg5BA3QuZWJmIspmF9LVZucSvPcTKVOyt3HpTjwYIv+etD7xdn0Miuty
 RyoKefgq+JaTBt4OKxaXsbmwl5X4IArfjsTUU4Br6vDYUvGmtgfkY6Tw4cKZfwyMfOZG179D2GA
 Dfu9M81l21jTTATsL3FeX1enOhlGtBNNnv8hqmdhBAfRHW0FEh8o/7INMbk=
X-Google-Smtp-Source: AGHT+IHRRa1nd8EABRQU5wK9XzCGFikI9OJL8kdQbUK0WUMo87bOtO4uywAsrOfWnCd+HRjG6iJPtg==
X-Received: by 2002:a17:903:2304:b0:220:c164:6ee1 with SMTP id
 d9443c01a7336-23c90fc7b7bmr105932755ad.32.1751869100387; 
 Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:57 +0800
Subject: [PATCH v12 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-2-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=eVMLeIUgZqZLeZ6Ci2g5Ka64hLAyQjdFTZDLaC2dgeCYsGmozTC1kJqA/rBQTjoMdzD4RZrJq
 kdEp3oVl/uwAcz9bq09dQ8GU8HHKb8bWx8e6T5k+KSEV+cn4RO3kXWT
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
index d4b545448d74657aafc96e9042c7756654b4f0e7..9a40492e5aa961f7180ba4ac6c86e06fcccef8c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -377,11 +377,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
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
@@ -392,7 +391,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

