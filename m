Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD46A13454
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA44510E8C6;
	Thu, 16 Jan 2025 07:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BOu25DpI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6F10E8C6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:44 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-216634dd574so5881705ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012464; x=1737617264; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Cu15j2NJTtLjV9+MVFGzHMBk+ND2a5wSao3sFlDFfjM=;
 b=BOu25DpIJ5q5FSZyWazRLblo+x0E8DAPTbEdae2WC+VodGIMIbu/zR2e+GhqJFZW69
 rit+GfwcIlMCqORSh8ZTFIlseNctbsstv7wVLtIBEFTJ1nGAB2kLGCvl2ebFO85a3OrG
 IFGT3DG/iqFnXzZoIDRtliLE3c9GAaEnBz3Z9ScU4ouMUbIFLW2CR5KhVRV8tE/ODBd9
 Om9wfC4B5Sx6XyzdGa0Os4qn02BjnRq2zEJJI5E5YNnD63u7fjyKrGv1qR5YBC0Exyo7
 TmowElfxQEw2CEUyWcl8Bd2YrqE/5s+CtevmvaC1Exy2qrOn6VPBHiGxFd/PhsqbV42j
 O7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012464; x=1737617264;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu15j2NJTtLjV9+MVFGzHMBk+ND2a5wSao3sFlDFfjM=;
 b=Pno6w1EVuOu+965ZRznWkhzXP7HO1vIpcJqj84/FThpvv/yJZ5F0Yxu77XSJpsGNbO
 RvHntNLWXCJ5jthh0XxvXWbCUjU5HpA6ne4hCmdyY8anzvLv9Jy87PphZTG/Frh6o5R2
 GadUW6+6PPnMFUNMEg5S52VPqEpblBjJ+0RHNcUF/bpF/oK2tXjg0ijyWoeAvcJY0nW3
 T2p1HB9vGWWC2KKOQUKGsO7tcXgjgO2MAmlQah9hDjSUu49ha3SZqo1Z7HI5M50XteXk
 V2bDOs19OmL+jngiRl/ZIh8gGfmv9+5neEJoYt326b0LUmVji9YDgkkuMJQ95ATl7Jw6
 dmWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5jKiOWUG7htNpuXTEVdEtfFMfDs8XI5wFLHtTo5CEmLpfEoQ5WD4iXqXebQLiSHMRDdO71aOHRaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytm7Bxvx6OF4Bjwnm0VGeXvXqwcgIo8bGIOLw6+DdleiSj+jB0
 k8kP5mVhPNli+iqMzF79uuJm7PA7cKejpzrlCdvFD8tIZNeuOBe9zgP3oNzy7VI=
X-Gm-Gg: ASbGnctp2fnHURiBCIuBdKghz9INrvPRLrjOevn2ORe050V1SUGT27gjuY3EP4dHzQR
 7BiX21YLZBnbT0LI6bxGaqu7YSo3uLvw1TerxQKkCwxj76ZJYsPEhpc+qwK+8M3xY/yxpeg7icL
 SbDwW0qCGUxW4cL++RY/HVnvTnNUlK5kk5kEZuZ71Shs7xRvsAYgs9t2ZiQwD/+6NJiPWLAKmee
 vZu/xKcHM5Vtw1B7RiqQomNgny6W0FIoVxNd0tEdQyG3heW3Lo1BA==
X-Google-Smtp-Source: AGHT+IFm84hxYMVEr0+ywyZZl87XBL/i+rgyjayVVPS3fcbervFdbTiM7rDGmDOi8kZxi6bOUnUopw==
X-Received: by 2002:a05:6a21:2c15:b0:1e0:9cc2:84b1 with SMTP id
 adf61e73a8af0-1e88d09e13emr58284163637.30.1737012463853; 
 Wed, 15 Jan 2025 23:27:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:27:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:04 +0800
Subject: [PATCH v4 15/16] drm/msm/dpu: Disable SSPP multi-rect mode for
 every pair
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-15-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1058;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=a64yZUVbmjveaxw7MvfAQcSIf9K7WyhFoHvJmze3ZhI=;
 b=LoRxm2CbOnuyS1YwLYTxXBpcl8r2bdQkUNXgYvF+hft9P5kfaGuNni01PeJrfTD4ZqL9BRGpw
 br3iGNDQUQeBxgmEr7nhgvZ5pnPUIL5foVNY1SR8XTgMkoKii2K+cWc
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

Currently, 2 pipes are supported at most. It is enough to check id to
know which pipe is in multi-rect mode and disable it. Multiple pairs
are used and need to check multirect_index to decide what pipes are in
multi-rect mode to disable them.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d96f4405a4c26..d2e0fcfbc30cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1480,7 +1480,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 		 * clear multirect for the right pipe so that the SSPP
 		 * can be further reused in the solo mode
 		 */
-		if (pipe->sspp && i == 1) {
+		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
 

-- 
2.34.1

