Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D667FB13B1B
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 15:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B726F10E511;
	Mon, 28 Jul 2025 13:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wl4RHOCO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E867010E510
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso5036909b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708495; x=1754313295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=wl4RHOCOPC9Hg44FKL6U3wWU6sbnrnvnjbRF1CQSM0ODQM4z73gk7FyIcO6UGzQCNz
 Emg9FTLY1XO9JfbdjK7LTjFU3QIy3ks+wFzrds7EylWXXbt6giYYoBXYspc5uNCDGc7K
 f/4pn4mpeZCYyvO/0iVueW2dxQ5nekAF6iDHf75uMFN2gGzWtLSeY+R1QwhxmkdZMd7g
 uTm9t58qR+X0BiMhluiQ6Q0tKHaQnt5vF70gDZAWYg5DP6WuKIMpSsH87k5CUhtqX0Ul
 QPF+ejDIXKfV4fADt1rFUXxPydhp/xICwY/kGgaBWJh+/6RsmaW0EyVdvIL+QchVMqoX
 G+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708495; x=1754313295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
 b=K4hMYjBG1XGAffGYxGbtqSymk++7Zzo0OZOS6HheXg+049x3nZlf1iBuCJA6LF9zif
 F1rZRL+0ZPdfRcYYK1InNNloa08EZlT0Qh6GkD2CxxOPHBTs4935jr/BVfV/aIZDq/Ni
 tx0O2DWiXhqqp+tlX3nnZW3M7oPXBe7iBDocLt7NiRwzLBQ/spmYys69bALPw4pkAJq+
 IVbORY6srReBKDWS2ZdtpsAR6M/6Wc4dpeAtdL/YwGdr3B+I9n/AvXP5PGH8AsOhY2Kz
 n+WR8v5i1mcYV8mSfzRSXARjdnK7OllLKLoa3ftsXFEHROqIe4O1glba/y5gzlyaf+Jr
 aEdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYxS0gjKJp7bpZSwCyy2KoUjKu8Kd5YzYnUsObRIAlN6BbWdva7mpbgWFcS+XwDgTqieSCDxoJ0ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEu+XiLivZpG+Ta9SnhshMTrW4In3wnXFbvwsC4tDvQ8Jy43h1
 v7DOROvaORhRCeDm2pewzSjN0wzGG5jsjCgg5ndaU46FgKPwxE2B6+LJAyrwdA0KLt0=
X-Gm-Gg: ASbGncvWtv3tkj4Wvp20VUCypaontw8ooLI8jNZEKidegnHMU3cnKzXun5LjDXZnG1V
 RK3FulCABwfcucepE6EbMg5uo/+d3M/EUuyMgas3GN/pZMyvHk13oQIu2m2eHs/HlD84TCPhRgo
 kT1Ezlhcn6CDqpLcFBr9xFfeYvZ2f4dFIVFNfNJQAoyMsxzNgxPxqrvonLK3htcZ4KEhX/9dMrh
 /7wDpDR5DExo5FQ4YbtNRfOv8DMc9Lkd97eBlNCYwEzEMsERdxWuoxyd3ihFWlFUb3mH+fIqren
 cjF0+VQDT7jRbJNRlfQAbl7gxahwESbWo3bpdgtYkH6Mp26HC+abm/zMYNUR1D8qVzVsgKI9lCE
 fl5yfDM7G7hcyFwVw7Q==
X-Google-Smtp-Source: AGHT+IG/D20ljLwf5AcuzW3YqgNM4owFJUcPZ3fslmNc2hdmZkKFoi04pLcGuW1KmbQW5dWUBibnNw==
X-Received: by 2002:a05:6a00:190d:b0:756:d026:10a7 with SMTP id
 d2e1a72fcca58-763379f0131mr18993904b3a.21.1753708495406; 
 Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:26 +0800
Subject: [PATCH v13 02/12] drm/msm/dpu: decide right side per last bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-2-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=ZmJJ2xnajYYZ10cD4MTxNnsob6Z2eKXOrG0hOMYC3PDZkQlNWn7dslvtXy+0zhgHpER50XAor
 EIFkXa35K7fAnUdjUnJ25DdlJ3xkpoimu8Hm2MxCMUMfW7WgWHvZg5r
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

