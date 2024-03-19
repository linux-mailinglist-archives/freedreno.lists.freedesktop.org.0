Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11E87FE9E
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 14:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016F310FAB4;
	Tue, 19 Mar 2024 13:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uyH7ziGK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEAE10FAB3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so73609371fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854530; x=1711459330; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pkrnYls3X1MuXQKYwYx/PX2IVbZAosNiMpQA/toIkE0=;
 b=uyH7ziGK7BYZ8kIGOVeFSf+yzdHac1ONZqKK3dCaXtR/y13lexnq+fYjcytXUAKNW1
 Kl0/Z/7FuVCH6/nu38EGfkshJ1Q2LU0pv8GXhIKaZf0cn6OrpKHFIJQwlAx5SAlANYTW
 ssV+vqC/vtc/4W33YCl0zBOBoYpha4y8CUnZT9B9gwTN7wMSnuyQNBvtFPtw+5+Sk0FK
 5AG0dzG1TBtzW+syRiVi79P3yRPxiEtcnOq/IXaVHUJcArDahTB00wFNGNKyvrJASzJD
 LOo2XPtd+ABDXdLpjKYhqILWAOTUHVCt8Y4bW0gjGE+E0XCvk7UMLxOYq0ilxTGoNT5x
 UFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854530; x=1711459330;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkrnYls3X1MuXQKYwYx/PX2IVbZAosNiMpQA/toIkE0=;
 b=A7HULrTjdzlLZYYe5jpybM/mVnL6CD1xEifKidL0UxuiR6rqkvfgJFfdcT/bKSUui4
 yXcwPwHr6OQmk3KRFOrb4L5tcmlxbvhPGnHvAF1oVtGJXtMX/VXeKIJHwwUbDnItn+Z6
 A0bpKoA8+xAGR6D7sC6FvswHccyfKwMWx8PYmRrJOi8AFuXtPH/KfydchMycMNO2wIdT
 z5nifLXK4dxTS3NxAgqbRP4FEDRK5DR/8Og/tuhiP3+zh5jyGLasV9gd1svsrcWAdZNe
 rJtmEg0xUu5hORilJYpKce7Q75nO1YCWKRpdqT1wDPf+MkqkymKWtGg+0FlcJAjVXDyE
 sfmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlto8Iba+hrHVxzgiLaNmIsbNHaWBYQ/+io2aFYBk7a5SeQ2LRy7kIIwD/vrTPUpIWHe3oQ5XDkUQyV8wEoe5/0A817wIPKPliN/4L9d0/
X-Gm-Message-State: AOJu0YydHrVann8hzJprMxgVTiKo23CRbcx8VNL0Oze6u4cEyHEjOcRG
 k2MD1RO9ycetyicFqoQIhz6mGSGOBTFfKAuqsJ7RGynFLM8gzpUTXsdTJ5yvLZc1c2ztZe4aUAl
 f
X-Google-Smtp-Source: AGHT+IH3Rc/XI4TCoZJ2aVcx9dY4AFFvKMOie4KcwqoIxGI63sY/eHg5FBhC+JvKF70OPM+12743MA==
X-Received: by 2002:a2e:99c5:0:b0:2d4:ad34:8599 with SMTP id
 l5-20020a2e99c5000000b002d4ad348599mr3773601ljj.26.1710854530243; 
 Tue, 19 Mar 2024 06:22:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:07 +0200
Subject: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l+jS/WeU6+WV+iPnXjTwcbP9FrWycJdv5uX5JuvRCbw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF48jjHdnqclv3m6b2iEXob/wnXebX/T4gSc
 WerEdykzqaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1XsLCACqOS4AAV7mN5wqLWszjF1ylp1xJHg4rTIsuZmrqJCCMTqf/blfZ3H+Lzkch2/kf7okxrI
 m0h+HJu4Zey/tb8fdNUybFPcBikIYjJDHN2D+3XVtMmg43rELHH+c0IW2g/eBjyMWwCtEpR/LYG
 roN1TvrdcMal+szi9HBVBknWC2W1YeLyWlyxYDCPqgzFv4w/ZBvdvmV3hqGhOl0TD/9WB68nZoz
 chXWfS/U69MwxLhlBpnB/SxiAH9wS1ijl7TsyJtbFhvcASJKH9tmYodvsBjwPiZxlH9i6AHsZSK
 9957jQ+68GMk1f9C1AvSE8/G9nSfQH69b8T0g0NsAy81gFOZ
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

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7257ac4020d8..e7dda9eca466 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2

