Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665D80343B
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 14:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2E110E25E;
	Mon,  4 Dec 2023 13:16:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B910E1C8
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-50bf3efe2cbso1218940e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695699; x=1702300499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aeReGTEh9WdazCjVx3s9wY0Guvu7IN3fugZ3Sd5wrus=;
 b=XV+z025oOOF5pP4AcXL043TyCTEYw4cjl5jyJj88nOyq7OrW323T+aiU5DzyhhZocv
 ucShhzlYfHfbW0CT0bzZw8vmh2ELu/8m73/t574wNJnQ6FLChIyeeoVLnOmRyf8fncC5
 DR0N+TAkvT/To7FoUGcJOgk9g/fd9OhIVt1kEl878pnOLlzU+4CZubZeb8a9ulZTwTV4
 eQ/69FvhF2QHoLW5swCkWihVSG5oDEL5e+wrHlUB8MRvzZB+kHmFPc4jbuOyKpkO0CYb
 JlUpLNdcHxiUlWu4M4wC+5S8sodfbbUBnADafyDJUjIUT1gJoBpf2fBTbV3z6LO8x1nh
 Lsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695699; x=1702300499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aeReGTEh9WdazCjVx3s9wY0Guvu7IN3fugZ3Sd5wrus=;
 b=wxiKg0j09jZUnlUC+RZ1F62TrqQZtaBDIT1yR6v9ueOLDdx4/S0Og+Ipn44Jp13VzL
 dIhk1H9tCF24vIjS7T+42SpSwnGLr5j1Gn9c3kydRYWRR4z46AEnUJ8xeavkwLydToU+
 Jhsgt8No141QP7Za31fTgU2VJNxstOvQCN6M9Gz4nIyX7zshnUOiwQkfQhFTq1e6uAAq
 FDgS/r6jSKNg7tWBdRIXzNNyt7Jo2/+6xtsZPFO5UZU8Ld+ywfRi+gmfuMY4+setSbYi
 mHMKPOsRb2LvT1NY3MJpFk/1B/JclPH/GwYJU+HJde3fICTltlIMBgMvFeBag1T+H0rr
 sYzA==
X-Gm-Message-State: AOJu0Yzci2Akay17O5wTFt+irLjnvzqlkqkcoprDXCO3Z5NTKGYMU2rP
 TkgqIr+ZfLGsDid5lNHNu9ScGQ==
X-Google-Smtp-Source: AGHT+IFJ6iOY8OeeHShhkf14uV3ednojj/zd1MnXRsPIVojuWFZfWrMoJV0tGRwuLlo3iG4L8wnh7w==
X-Received: by 2002:ac2:521c:0:b0:50b:ef9b:bde5 with SMTP id
 a28-20020ac2521c000000b0050bef9bbde5mr482316lfl.150.1701695699509; 
 Mon, 04 Dec 2023 05:14:59 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon,  4 Dec 2023 15:13:51 +0200
Message-ID: <20231204131455.19023-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/7] Revert "drm/atomic: Add pixel source to
 plane state dump"
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This reverts commit 8283ac7871a959848e09fc6593b8c12b8febfee6.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        | 1 -
 drivers/gpu/drm/drm_blend.c         | 1 -
 drivers/gpu/drm/drm_crtc_internal.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 02aa7df832cc..f1a503aafe5a 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -722,7 +722,6 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 
 	drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
-	drm_printf(p, "\tpixel-source=%s\n", drm_get_pixel_source_name(state->pixel_source));
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 9c1608f7c1df..37b31b7e5ce5 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -647,7 +647,6 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
 	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
-DRM_ENUM_NAME_FN(drm_get_pixel_source_name, drm_pixel_source_enum_list);
 
 /**
  * drm_plane_create_pixel_source_property - create a new pixel source property
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 4114675c0728..a514d5207e41 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -269,7 +269,6 @@ int drm_plane_check_pixel_format(struct drm_plane *plane,
 				 u32 format, u64 modifier);
 struct drm_mode_rect *
 __drm_plane_get_damage_clips(const struct drm_plane_state *state);
-const char *drm_get_pixel_source_name(int val);
 
 /* drm_bridge.c */
 void drm_bridge_detach(struct drm_bridge *bridge);
-- 
2.42.0

