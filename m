Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21388D785C
	for <lists+freedreno@lfdr.de>; Sun,  2 Jun 2024 23:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19A10E094;
	Sun,  2 Jun 2024 21:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YRM/SSxi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B194C10E094
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:57 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e719bab882so40297931fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364396; x=1717969196; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
 b=YRM/SSxivLp3CJbt+JViMHeOkpwAgPXYPQf89YvCM/wiJwRv7AA4Z0kXutQAS8rzT+
 Yj8LGXa0ZehLmPov7Z78wSQ4hx+5RdH75FPRBkxnZiAyeqT54jITwoFlDNth4jQlwEoK
 Z3n7tbxNN4i6KDTOJmPNsYxgzJ57ObSYboGLjOy1YONHo8OUdzzN2k7JrGaSQeWZjIvd
 +YF94oPeqz89UxaClJKPr5JnrosKwOYeO1WWMG8TZ0HU8W1ILCTmXcJ/Eqphcebhjy53
 e/Nhdw1qbwybd2GBpjPVOJa7PuqDMzyu32124c4rQAqUlOPdUN8HmB4SlzJV1PMI71i3
 ri1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364396; x=1717969196;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phfbeBe/wHZzaldGp3CTSm4jkvtTaBdaWvDYoOuNwVE=;
 b=sKkRB77uwVjtnL5ZP0que3iL42omDPZfiZn/Gz4PovN2Pk1Bsta8qm7wc6X5r9GAzQ
 Ts8lgfSgwFpSURKQFMsDVmfN0a4nYfbBQFGDsJJzoMlEgpERPBcoQjYaLdYxH/Gbr1zZ
 GHtznjm5hNhkPJJBaB3DjieY8axYY4xDmXQ6loYX33FNkyNO2EY96xQuTixlYJXpggF1
 b3Nfgc6Jm5faYXDgjvvd1E214UCch4wR4uAFZVkdX81F+wVTqDZuZfvUgnpygVY4e9BJ
 f29qoPYA+mUqbkFObgk9T9PjArNUZEHkgDfrB7LEIy+3HgMnSWdz9jlT+nnu+/UTIbVo
 pcDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXchuK+u/RZIZz7D8DYY3rjH+0vFaC4Rbgz+F3CyRmQwclhcWDhYhhQYYfqV29jLVINfAWzoJFoR6CXI73VYlSM3CRps11cpFVVsc3zhuGg
X-Gm-Message-State: AOJu0YxmPzzbaXxEXD7YSt0WkPsehwdG/jIzwDTq7nYGhaeORhu+hsRd
 W26lkz7jIF168taQmxaS6+ymHl6kVSPtGVs/MSZcDUJfLBCOd6HxGrwL7mQLXPI=
X-Google-Smtp-Source: AGHT+IGxRw+MhZXwLFb5hrNZP2u+vz4lRcl9eHFkm0LNpEaolt2v0LY1NkMZg/P1qibIuuIkHVUuAA==
X-Received: by 2002:a19:7403:0:b0:523:b272:c73 with SMTP id
 2adb3069b0e04-52b89569542mr4347003e87.7.1717364395710; 
 Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:52 +0300
Subject: [PATCH v2 6/9] drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds
 from atomic_begin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-6-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7R5XEZiZYJZfV3EIl1ZYgtEVpBJ16B4QkvSZSHsPzGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOalI8O2Gf9SxPwCXo1gr5Krf6S3U1zjqsmVd
 jLGSJZ+Jm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1fOEB/4g7Qy70gGV6VTyC8hNhK+NYtc6tOoGcIm0WmQZhwToK8OfvQ9J4VMZn0xxqYJvKLLrGt4
 9zfYGnpuYD8LKcpDlqmi70GSz/E49iYgwoh4IjJWAg+rxSUikIkWyJjDfFRY0KTtMUxzXrToRni
 R6EcAlwQnPscsCRBjgsOIRTwS7F4czKxDMnRAWoMUkQF5oGN8wG6oRTUvAn+VTQaS5D9947SX7s
 kauLgM5n5CwnXNCFChuvJRxxcNKu01o0e6z3RhErUr4SOF7p5UJ3eJCvd5vgH5TCC9+1iq7MOsB
 NEXyWBfv7jBiO30j+QlkPqtd7uqNmrfWMfwk8zg5Wrr4rm0V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The dpu_crtc_atomic_check() already calls _dpu_crtc_setup_lm_bounds().
There is no need to call it from dpu_crtc_atomic_begin().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..e3b1e5f55a92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -803,8 +803,6 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
-
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);

-- 
2.39.2

