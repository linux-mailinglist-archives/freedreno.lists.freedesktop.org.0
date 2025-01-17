Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B508AA1536C
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 17:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2510EB26;
	Fri, 17 Jan 2025 16:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ql8k4v3A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE6210EB26
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 16:01:37 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-216728b1836so41964555ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129697; x=1737734497; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
 b=Ql8k4v3Acqfaen0bOpSsi+rE4GeLmaacMOJ1RyrRLieWb/vwaIfLjfe6CBC2k6uCDT
 xp5YuYLVTEZjBQa3+x5yNP4EmYB4KdS9LMmtYE2BtOdv/t84HB7fAOymZLvQwnDmCWZY
 Ktb+H/LgRn2QBh8kdna0DWJkw3/lHhF+g48g7rplNg4jq8q4Vjznl0X+WjXcuifCxKQM
 OOe3Gpnd/6U6e7DMt6Si2iCSjVmpiHNRTp5RQQblIKpWG1CyOwfIzzyS28bD874dTYWQ
 ftWsUNM+PNzX1i4pp8F4/g61DzBV0bDT4ysn6IRDCVrJ9urH09fffEj+TUZqRqgiUpke
 9ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129697; x=1737734497;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3yunoLlxWRJhy60D0YWe6I34aii3wtHTN9FRAZaIpc=;
 b=pQcAA7sOF4E6kMHvK73qQafCNQtPp6+Qq2Yg0cZzMroUsEmxL87TpnozWelME/RXKr
 p3/dAYfIf1morirCF44WM+aZhU9x8E3iVz0pYuhsV0g1FzMmPkYGbBTpRId48nBDVPkm
 oP4BFQboYVZy3gDWYc5x0dL+3Zg09uonnfQb5IXdozajldEkfNR0I3M9zXmfSdJ4DDKG
 tB14vcAlV7QQ2coEcVd+uLr75FN2t8f+VJ3JoBKkUGRhTs93whk+s1J550iYVgssF/+3
 sf63noxfoe0J62Fn+BG6LAM+9lCB8+2UGiTdmY+gI5xMzTISf3xGxajjjilABqbNQ2bL
 dZNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8tzdAjFWsIbBk123CpbGYbvJLF4O/rAW1gPbq0V41Wqzukm483YiLuEQtSv54jTEbKOB1vrko8I0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHlEBmapbRDf3x3yQLeL/rIJK118+WQ4s64zaX8cEIvQIFG4Ui
 FJ2P+pX3wVwKw66SXvzavbrW60U76GWx40x63d5wcxN2BQaYQ+8+b3P7rYzGG7d/DXywxZqZAlj
 qDNllrQ==
X-Gm-Gg: ASbGncskPFR6SyusxqO+9MhFR17lhKTVy9ab8FX53faYCO9N52UkWO/kteji4M5jYYZ
 VbWKugYZxXQaxAepDL2FJ+st5sFCdDpAgA+97Vq0vqrViMy9OIYWNQq5XnMND/1WCzoYikhBQz7
 LAgFco1DkKU+gr9gghd1+CkkAJWbpPFPvpnLPOaAN7zgiVZ9pWFXyvQGnwfMSGADPZkjmoXRDSB
 Ur2MLImcjVGW9KuTk9C+gUukAsaOqhqQozHFeu2j2XaplaSbD1NVg==
X-Google-Smtp-Source: AGHT+IHqJfGxJvCiAv1ftPN3BjOhgudESdN0Zw8GWxYpwMLaLfxmL+8riiyZMGiCbXS9vMyovccAhw==
X-Received: by 2002:a17:903:120a:b0:215:9f5a:a236 with SMTP id
 d9443c01a7336-21c351cfb3dmr35013005ad.6.1737129697086; 
 Fri, 17 Jan 2025 08:01:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:36 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:48 +0800
Subject: [PATCH v5 05/15] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-5-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=omFb8tC5BYgDB/DLsxGi5hvIkUiuwMAxXfTrryE65M4=;
 b=+PHLNBv4YKhyEsM/qQVuxxt94qq2IbjBKjJH4LJFXf/Nz2dVkh8zYljG1h8J2fPBZThfV6rt5
 xMwCi7Yrhu5CaTsFjVKn/HX3fJx7CVmZetg2lR6ArDl61jdsFuAyGnd
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

