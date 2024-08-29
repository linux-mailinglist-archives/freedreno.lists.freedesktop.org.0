Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E9964146
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8A110E60C;
	Thu, 29 Aug 2024 10:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="revnX/8K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9E10E60C
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:20:07 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-715c160e231so419617b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926807; x=1725531607; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sCM9+J5N4G47yHA+9svPJMNmtm7ygy8LRAS3AKbj6g8=;
 b=revnX/8KemsuzmIArY0mZp2OVEkE4NrlcmkBgyqlbABY5pXs+klmoif2LmMQUTf6eI
 5mdXU8QRolE0tutOzlCu1t2AHEl4x85rZ1RxxwBKrllnzVfszo62+dszsUxrS3B9mK8+
 gCL9/bS5KWutcZQoDi6ZMJhf2sHTp7NIvevQlav3h5+NEVOJBZslenp/0IZUDofY4p5A
 6BGj/aFJXv3Yfh7DNPgxzsm+Ew2x93xav+4lWdlBh3xY8isSuxCJUrEwPNTdlstxtYVQ
 O8Q8QVhJI65xRm1Hqwv9Mi+Vv+n5UiTvP3AY0zJV6SGlCmG7NxZCy29ES3kC1kpL29Bx
 TPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926807; x=1725531607;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCM9+J5N4G47yHA+9svPJMNmtm7ygy8LRAS3AKbj6g8=;
 b=QqfQGjbUIcfq0ZIDMEz1aCmpqLOOHxmDM0QpqHMtx2v6p8Fm3se+HWefymui9QZAw9
 VCWtuDk6pMLHEgMM6Ha39LQv3jml2ILP9CtCRKWvk98jyNdT5UG2aL1ALqYS/ZDkXI+b
 CZJDjhCoZkqSDMfuhYUWz2/tpP7M1XWb+lWg7y36hx8EwiuvC1SxskX/XNGhtWv88XlK
 5pc99YmWdLnwKE2OtQNzy/er2XdL2goUSlFtYnFX7EIHz3NTsadL+RAkZ7tPK5Nkm6MZ
 C3Ht3QB1arBZH2YoPR1mwoxKOp2X5ddIZBTKr8/ZSUOAWF/QtL9YJwyOZFZHSj1JtF+3
 50hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6D/oUaR4LtRN6lyLLYaVMefCW4utv0NLSoE/K/Zp7v4yUsTv5nt08ah6SAvIeNlGHn+FQGUgufg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRycQxtgSIwWp2rUFI2LwKEhDDszV+cVfNHcScMz3YZoSojnhi
 WbhZXx6vmMamJ6aAVoY3FNtchA7jgwz7Dit8Bwap2+UpM+MiDE6QoShsY3/1kJM=
X-Google-Smtp-Source: AGHT+IFo6JqACOpnth0fo0ebIHz2s0TbrVB7OHz+muTbyPW6Oj8OzQXal3TuFyZ8y86blnUcHVs4ag==
X-Received: by 2002:a05:6a20:43a0:b0:1c6:ed5e:24f with SMTP id
 adf61e73a8af0-1cce1021453mr2687410637.23.1724926807471; 
 Thu, 29 Aug 2024 03:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:20:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:36 +0800
Subject: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=921;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0yy1liVIVVcBNaGfsGh4eMYqZcgCYhVFKjgWT8Yk1d0=;
 b=PwOW3rRew35aIX4xRyng/9JjRkID8/gLpZS+9EYNgSES93anR/gwegVFnq/E8Gu6stEEFpRH/
 CqB8AK/26+2AOcc8A0fnpWAoCQs3VSmafagyoRBeq9Xe8yckQ/TJZpN
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

Do not assume DSC number as 2. Because there are 4 DSC in
quad pipe case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6bdd9c21ff3ed..05b203be2a9bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
+	/* DSC and mixer are mapped 1:1, so reuse the mixer number */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_crtc_get_lm_num(drm_enc->crtc->state);
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }

-- 
2.34.1

