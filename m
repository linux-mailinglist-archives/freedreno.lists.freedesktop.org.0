Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69C9F1868
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2071710F0F7;
	Fri, 13 Dec 2024 22:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oAMbS9SO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DF710F0EE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:56 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso19118371fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128094; x=1734732894; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=opYI+4K2DJJKwW+ZJQ9gJCluOKx+HHP7NZLtl3Vo64o=;
 b=oAMbS9SOdlZQP7YU8X/UfXppNYjat+d+Pzeb3vx3ctcFVnHEsS5M6MmE9v72xFTh/T
 fUKkGmNTPNe7Hk1HA9XDh6sH94gYcwqGuGcpmnQg5ChWpeh5seZzOPwnxFxb4/BHBNNK
 EGjn3VOZEdfcNxADPhERmgLkwer/k9KmOwtuzvuGHHJbDTWEMqsQx1hfi0W9Fd9abeHb
 Y+8z+eHrPF4G9+wSHUbMVPLbZ2ACFg016uK5jV2TNCm0ZwH5WYgD0YMlxezidVNPM49z
 6D+wnHANqRqxS5lKTfd1kjGdi1nxDZA4CAqa2CHunokPwYqMsNaKhec8xbujHc3LL9VR
 Chkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128094; x=1734732894;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opYI+4K2DJJKwW+ZJQ9gJCluOKx+HHP7NZLtl3Vo64o=;
 b=boJ0zSO5/fcDg/oRip2b2+oHocreQMkxD7x98idv3Qgm+tfAVAlP2HgQOtH/k7Nf7q
 IDqgd2ucw1qGpSJIZ9+lK4LzZNvKfc8y7LgDq9ZXC0zrC9W2aUCYZ4Jxqd8z4nDYUDXj
 Uh8J7Uerb4ZjpKS+uHmCw9Awip3KOcdF4XIVI/9fjQE/cCk/9dJMsIdU8UuRYvtMmrB7
 U2jdJ8uogL1YtwJ9hHqhGun8fqeBcjnc+zy8qgYIAr2xorMw8+manwzPZsHQ1kYLq4xk
 JC2BeUg7dLrwTlsUMIHPkLDH5cCZWuTtRwSdkfJi/eLQQUE0Kp04aEWr/J7/CRiKf8cw
 ON1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzUad8xZmMdpg29rl6BwiavJ1YxMXFuoXLqJnpusJ2Wn6lTTv7auBiRvydm7e86mxl8TpVI7YrsAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsrTV0UcSZjb3Pwcmf16P2z0epl9oufDQbEn+iQb85p6HXRGtz
 1C/FlFkWVhj7rXu13mYybWnayJq9VMnXc+Aw8CfrBIK/wspWfIfbAexN7gBopICCABXr1joCU06
 56svRDg==
X-Gm-Gg: ASbGncsIxktT6P5X/QCkNhZyqE9i8dHCVkBwwRenmIj3lIQQIrz/zDHb1DuKSWBlMeD
 hprqRBoI3qGjmotAoQGrbvyn97TSMFQb6bnSIIgm6LkdqeedlmqCPrQ0K4sbeSB8jKkUU7nF/Rw
 Ygmu+cn1INVVPd8JqDldJXJjf8oCu7CznXO3sanIZHdRyCAG3vHhrWuuzFBnwK90X4KkU9Anamn
 kcZwo05t6rE90089vf4qcorTLLR0+n4fAVG8WUojyOMqF2PEEAYq+29DGOk3fI9
X-Google-Smtp-Source: AGHT+IEKYmfLZkuO7EgUY1v4G1Iwhi9AGdgh/bx/sqa3CDhkR/s7AfQq3cx/0emmaMmMhC0mjhOvrg==
X-Received: by 2002:a2e:be23:0:b0:302:40ec:a1b4 with SMTP id
 38308e7fff4ca-302544b112cmr14661261fa.30.1734128094482; 
 Fri, 13 Dec 2024 14:14:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:24 +0200
Subject: [PATCH 08/35] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-8-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHFvYSehS5Tz24MK4MtF4NatfCHlTOnx1c2v
 TJMYwsSZs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxQAKCRCLPIo+Aiko
 1eL5B/9xEi4eRYyvweYAaE0ngSBTRPHVKpylfLocewX8Bn1P/5aWDfg4AT3MKwwLfbnt7tCJ24G
 k3pdQLmKQWVf7148LwG9yHljs51Zj6OzpoJf5aKMDfNQaAO0j/vUZRlOTIo7hn77UBXfnHl/drB
 Kk1q59YZ4Gt5k5Iz1o04iKUhu677KtDpt7K2mTtGLtzmypzkFUXfiEP21Rl74PWiRngvNsT1ktr
 Bxo11MKAqbaqvodCncIGSa+KRSTSuLvz6u/VcFY3FNxJ9AFjj5Jigg7249SIXoMM0AQtNDllZHx
 kLft3WQw/Z9i5v2VJe6Pq9SNNQUTE6buGe49Y8Cno/04aOTQ
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

