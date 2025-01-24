Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62967A1B477
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 12:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1410E7F8;
	Fri, 24 Jan 2025 11:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nvbMfxbc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0433310E856
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30737db1ab1so17874661fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717275; x=1738322075; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0sacSme45d+zAHAZW9ym+kv+4dwtO/HOlcohR4MIv7o=;
 b=nvbMfxbci1KqrhwMlLRiNBeQHQyfUOh/A5/lJ+fDnVOIYxQuzeJuF1l7KaL0vc6Q0z
 yNOomkgSd1Bzh9p0Iw9cYhbjYy86VzGATT0HgQfe8K82lyvuRiqehmlSJ8gyEhoaudVS
 qErmMX9AYW2TOfTFD3LRY2wbVkdqJyA42Vr689Xe5VyCMM6VleQ5vy/nna4OI82NCpQE
 LTyf+faGhBVQYkLrzjVxgtWuxHmBDOIFQzoMfZU74+rD1Hhb/A7SJhxtaR7zMKX++mTc
 HsZt5VxmixgZg0HnC32NgaotdUKzqpf2w6I9v0n1KuXL1V6xn7hp/SODSndmE1o8u0Cm
 ifvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717275; x=1738322075;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0sacSme45d+zAHAZW9ym+kv+4dwtO/HOlcohR4MIv7o=;
 b=Qe5Ale05lyTYLPbJh5iXBsabugW/mw1HzIH024Ep1uMSoshLzt24vNaJxIo5jEy1Q1
 2M6AumwYMGmea4Sr3kMk0c7cH8fCp7C6fGlcZZaeG5l603TlIWYnSNeIlKnou3DweNup
 Qembz2d/pB0JOjrd2YZ18XEX1SFsxe+EOVKuEJJKA5i+khpo4E/HJRXu/x6fqNKZEliU
 jV2yfQXvPItE+NgnjWA4QklC7kxh0EuJ6pihcHWmz6q8HqqOATooTxU6+NLOXq1qW7S7
 K48GGhHY4RbeV1l2xh6GWs9F0H+n8uLGQItq23v5wIE1phfA4J90jb33Lpmo+ZS+sSrZ
 hbtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Gv8TdOxh4XyRUJgz31Qnj8/+JFjnyixS64HGkG/DAZfTTUsf1AISdtAVIrgLBWCELUgZ2Bw9QHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxeql/+FXzmKkZixUosKg7PCqEf1SiLZyxkNOymLWCIWMpPCYEU
 1U+1CK6BnFisHT/jku2PLLHPP31UW2JmPiuVNIpiMu02JhwkYxdfw8zYHXIz0bw=
X-Gm-Gg: ASbGncs2yynYJKjmZnHJfGrWEEFMzGSjEZARluhpUixbSabsTKQDr1qqrbrzcp3alw2
 FvjVxy/tM2nnpljHDXLozKVey0sjXwogGe6Ge9keFingsS3VmBesDbCFX2uRserUKiSNWkERl6e
 wCDc7pfq3ekaWlIK1wB5uNXs2Vr7hKne0mV3vKNKxKKxRSrZbZJrI5mMfUWW97V9t/wjRWjBdEu
 92g1Y2iZDX3IFrW42wjOlde48TJpxd9ZYhiOdesG+sYUWXm9cKVeK5IP42P5234BdrhiFBJlnm7
 3+az2BkHbfV6
X-Google-Smtp-Source: AGHT+IEKsI1FHKsU/oq63Owrwj/AxIolbDVcCg9fk2AcSbkPZFLWwNFBfl+vzCRP0IAnp1mAghhfXQ==
X-Received: by 2002:a2e:a901:0:b0:2ff:cfbb:c893 with SMTP id
 38308e7fff4ca-3072ca60a30mr114304741fa.6.1737717275242; 
 Fri, 24 Jan 2025 03:14:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:20 +0200
Subject: [PATCH 2/6] drm/mgag200: move format check to
 drm_plane_helper.atomic_needs_modeset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-2-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwmtWNrqDVg2rI64aHz+boP7gTDUq9GICL0T2h/DMTk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YURWUWU01A6XqaUSIWW8FOy+qff+XjWYSkZ
 56VP0FXSWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FAAKCRCLPIo+Aiko
 1cFHB/4xZMU+AzbdxZr6M/tEKI3BPADtj3wkgUMr8+GsJt3pS5i0aL+uSRnAQ0w90ahY+xj1NGR
 ydwByJx+LU6dcZ9VBukcBNtjs+jW36FmNm4n2ATCuO7G1j7UtnUw446vYER8Y9XKYuMEL8YcUo+
 3OilKZKQLU3Is/wYwRtbcix/JeDmw34ZFQkpFSlOn95EopH6vBbOVDxz3k69cW1x1QFvMJYnYRH
 bBSgj/YBG+RkwVoBwxO/hgkj/MsUWdVdqp4mzFYQOnC49PetFw7e7kvpieLlz0C4X4CQy4jmyO3
 W3kgVzYd+wz73NA+9RiEMUfMwT3WubiRVFl9c+y+CzZ9qUqX
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

For the mgag200 driver if the format of the plane changes, then the PLL
rate needs to be changed. This requires performing a full CRTC modeset.
Current code sets drm_crtc_state.mode_changed from the plane's
atomic_check() callback and then doesn't call drm_atomic_helper_check()
again. It works for the mgag200 driver, but it breaks calling convention
of the drm_atomic_helper_check() function.

Move the check to the new atomic_needs_modeset() callback, removing the
need to set the flag in the atomic_check().

Note: this also checks the check to compare format to the
old_plane_state->fb->format instead of using plane->state->fb->format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 27 ++++++++++++++++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 0608fc63e588bb60f1b087d263a34cfd11624b52..42cf0826ed14e0e9e4ed1b7920486bda008a0f99 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -354,6 +354,8 @@ extern const uint32_t mgag200_primary_plane_formats[];
 extern const size_t   mgag200_primary_plane_formats_size;
 extern const uint64_t mgag200_primary_plane_fmtmods[];
 
+bool mgag200_primary_plane_helper_atomic_needs_modeset(struct drm_plane *plane,
+						       struct drm_atomic_state *new_state);
 int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *new_state);
 void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fb71658c3117b25311f19276d6f4ffdee157ac17..63285b356326a13b465387e5d7ac90ec9fe867cf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -463,12 +463,31 @@ const uint64_t mgag200_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+bool mgag200_primary_plane_helper_atomic_needs_modeset(struct drm_plane *plane,
+						       struct drm_atomic_state *new_state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(new_state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *fb = NULL;
+
+	if (old_plane_state)
+		fb = old_plane_state->fb;
+
+	if (!new_fb)
+		return false;
+
+	if (!fb || (fb->format != new_fb->format))
+		return true;
+
+	return false;
+}
+
 int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *new_state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
-	struct drm_framebuffer *fb = NULL;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct mgag200_crtc_state *new_mgag200_crtc_state;
@@ -486,12 +505,6 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	if (plane->state)
-		fb = plane->state->fb;
-
-	if (!fb || (fb->format != new_fb->format))
-		new_crtc_state->mode_changed = true; /* update PLL settings */
-
 	new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
 	new_mgag200_crtc_state->format = new_fb->format;
 

-- 
2.39.5

