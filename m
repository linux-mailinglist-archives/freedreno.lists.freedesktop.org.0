Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8162B2DD4
	for <lists+freedreno@lfdr.de>; Sat, 14 Nov 2020 16:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ABB6E928;
	Sat, 14 Nov 2020 15:21:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FFD6E928
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:07 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id q7so6478025qvt.12
 for <freedreno@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Had0NO1OldvzTy/dDlNqjQKg348W7mzmn4iytrp+oxQ=;
 b=aJpgxp0mgMgJ/Gf8GKsH9BrFPYl+5nN7VmiBnAJnCUvBaaREnJatyr+JpWaqIqf5Cp
 irTFN0+1B4awwp/1iwxvHqvzsRqHcxQsA+WbF/mROoBQQnlVVdX5gsnZaT6J90uPo07l
 8OQbbzA19WSYV4jOrC/LRSBxA3SbuwSLqCuHP1Hztdhnvuukqm+qicj1onWD8oRI4ZXp
 fCcCDkedMJQs7SxbojfFRs4JhJlncXOigoQj3+rnV1O215kAOI92XPVGPvWq9Tf4E6ss
 8AxUjqHjeT8ZRPj3sbfLNEuddr0sleKs9QApibxnly/W9c3vnR36wyX5ToCF4kLUSWos
 nqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Had0NO1OldvzTy/dDlNqjQKg348W7mzmn4iytrp+oxQ=;
 b=HvUY4oS8+H4IKTfm15c/kKibHnCsOBwuqrl0TqWuHqpjnZzI9AXPmBsogBxrYzRPZl
 ZI20N8NOHcXjyimCYiHrTMd8i+DohkTfhGGPk/2sdT7H+9gL+TA2dyt05QoNiaGcUiow
 g6NLrYBkznP64BkHMUKaIDF6SymGBPAxMmuD35zxsGlvGBMu0Ohmq1RuIX//okAXkRVr
 0oDnZn6mgeByDtb/T96nKZNivIW5JVcThOljGWHPwvQlOTNfW6dKSOQBM6e1PjeaGM3t
 udbK/DCfaVQe5uBYK37TP70Lxvxni2sMYGVLzhCbhD7knL2b8vdXlOfCxJ7WGaI4Iaef
 prxg==
X-Gm-Message-State: AOAM5306zuJOLwxmgPpYQXVoQlXhnbXr6mqXc5on+Nn/XL+lC5/jfcXh
 aihTF9rnkjo66K6CPq5ASPxTmD6rRjQkFxOWUTs=
X-Google-Smtp-Source: ABdhPJzxJ019I/egsMkQcdPxWg5A9PhW4/h3q71ud+MnfOX4UDcEfzJ4lpV2AMyz97W74oEetrE0Ig==
X-Received: by 2002:a0c:e608:: with SMTP id z8mr7620395qvm.2.1605367266263;
 Sat, 14 Nov 2020 07:21:06 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:05 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Date: Sat, 14 Nov 2020 10:17:09 -0500
Message-Id: <20201114151717.5369-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201114151717.5369-1-jonathan@marek.ca>
References: <20201114151717.5369-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND PATCH v2 1/5] drm/msm: add
 MSM_BO_CACHED_COHERENT
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawn.guo@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a new cache mode for creating coherent host-cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/msm_drv.h              | 1 +
 drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
 include/uapi/drm/msm_drm.h                 | 5 ++---
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 58e03b20e1c7..21c9bc954f38 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -410,6 +410,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f33281ac7913..22ebecb28349 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -168,6 +168,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
+	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 04be4cfcccc1..3d8254b5de16 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -420,6 +420,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
+	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
+		prot |= IOMMU_CACHE;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
@@ -1004,6 +1007,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1011,6 +1015,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	case MSM_BO_CACHED:
 	case MSM_BO_WC:
 		break;
+	case MSM_BO_CACHED_COHERENT:
+		if (priv->has_cached_coherent)
+			break;
+		/* fallthrough */
 	default:
 		DRM_DEV_ERROR(dev->dev, "invalid cache flag: %x\n",
 				(flags & MSM_BO_CACHE_MASK));
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index a6c1f3eb2623..474497e8743a 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -94,12 +94,11 @@ struct drm_msm_param {
 #define MSM_BO_CACHED        0x00010000
 #define MSM_BO_WC            0x00020000
 #define MSM_BO_UNCACHED      0x00040000
+#define MSM_BO_CACHED_COHERENT 0x080000
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
-                              MSM_BO_CACHED | \
-                              MSM_BO_WC | \
-                              MSM_BO_UNCACHED)
+                              MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
 	__u64 size;           /* in */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
