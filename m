Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B9803432
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 14:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9C10E1C8;
	Mon,  4 Dec 2023 13:15:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35CD10E253
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 13:15:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bffb64178so105324e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701695700; x=1702300500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
 b=hWa8Mv/f7HVdWnqyUgNOSYojfKz1tu2UAGK38okgFCI26W8PHcgcfafKItZdpSiXv1
 08MS1z8LapCfvb5jicE5MXxQho5LILrRZbopfDcdR9IiS0EsRpwp1mRmHMw9WEidcGC9
 VHMXHWoweMSYrE5k9L4WWvbHs+7YsBa+Z6R6TTyl0s8r4SL4mi8qHAZJYqU1AC5TMAqv
 QtxW0j+RQSyLvbs3tts24Jyhf12OI4vSmV0eR/iQcu1NYCjbtq2jK0AnFtw4P2EIaOFx
 XmNCJb4T3hK39tr0hGYjIgWgkwkySbIA0AAE8IrrxgY9ON4VGZH3crkFkP+FqsIwhMCh
 f5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701695700; x=1702300500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMzxGsdhOYwtNdEG7l3DHCnll9vKNfEMYjXGBc92HI8=;
 b=NQQkSD7hx1pzBra/QOzknSkMk4XBOiDfQP5BFfHC1dGLwc+oIpkTIf5tQAPbl1F4Uj
 iJCorOfLUpYgr/khbmB4D0XsIE3QMSe5QU2vcjoX3UB34U1Q64Sd0TeKcH7ctaA6Hqyo
 8MAv4mT6WX7Cqb7ze0C5NxIH6Od5tktnwevikXP/8xjAnw8UY7CFHKAxDmYFuSf0M19+
 VXquA4hTQwKt1xXuUT9muXqVnTL3b6YtE1Fcza+xnzqRRBsmaqC0+BVfG9BLc5EouM8d
 yxEPKsCr7dMnkJ3LqU1B/w3V1INmSx3PMSg4eURZOv/NC5xvCZqDFmhMVOgI7KYq6c2c
 bPYg==
X-Gm-Message-State: AOJu0Yz5ix3jcYaNtK8cm7j1OcW1QOHpPeQeIytQMh9fTXkLJ0TT+b9n
 J7rf1S27uCxp1c+LzA5/Cj9/pw==
X-Google-Smtp-Source: AGHT+IGDRYksrIZYOlwzn0xx8ixTEo9STmmWtMePPWUDb7lGPmASc5VjLGKKYGaFagK6R+9iyaaIuQ==
X-Received: by 2002:ac2:4e06:0:b0:50b:e20c:e54e with SMTP id
 e6-20020ac24e06000000b0050be20ce54emr2561562lfr.115.1701695700202; 
 Mon, 04 Dec 2023 05:15:00 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 05:14:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon,  4 Dec 2023 15:13:52 +0200
Message-ID: <20231204131455.19023-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/7] Revert "drm: Add solid fill pixel source"
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

This reverts commit 4b64167042927531f4cfaf035b8f88c2f7a05f06.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_blend.c | 10 +---------
 include/drm/drm_plane.h     |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 37b31b7e5ce5..665c5d9b056f 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,9 +204,6 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
- *	"SOLID_FILL":
- *		Solid fill color source set by the "solid_fill" property.
- *
  * solid_fill:
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
@@ -645,7 +642,6 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
 static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
-	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
 
 /**
@@ -670,9 +666,6 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
  * "FB":
  *	Framebuffer pixel source
  *
- * "SOLID_FILL":
- * 	Solid fill color pixel source
- *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -682,8 +675,7 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
 	int i;
 
 	/* FB is supported by default */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 4b7af4381bbe..5bac644d4cc3 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,7 +43,6 @@ enum drm_scaling_filter {
 enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_NONE,
 	DRM_PLANE_PIXEL_SOURCE_FB,
-	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 
-- 
2.42.0

