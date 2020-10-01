Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42327F6B2
	for <lists+freedreno@lfdr.de>; Thu,  1 Oct 2020 02:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D96E83D;
	Thu,  1 Oct 2020 00:28:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F876E83C
 for <freedreno@lists.freedesktop.org>; Thu,  1 Oct 2020 00:28:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c18so2955673qtw.5
 for <freedreno@lists.freedesktop.org>; Wed, 30 Sep 2020 17:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWObr22ksvrhZ9O40b17Fzoa2hTSNXx9/SjTN9dVo8k=;
 b=yPNOx4GpQBiFPPh+PQdDvQWjS5Xz2iVEXS/BFhbrNYOuHP2QY3xw7QbruNjJZLDjeM
 ouFhttsr3QDwLIG3V/O6rmwdBXY03GT4Wxcnex65pVCB21YDO9o0MRqAJUBon8aCN1jI
 moZE26Gzled0QULso6fEHiKxMWdpnhxl3qhGXCiZtTtYkGTAJA30A9YxgHYAthQa5vC5
 1zsT80azDrfrk4mCG3IZWhrMZhiCqhQIl9n6vJIZsKCRFJujzCQRpqZDJShg3x7vIR/o
 MXHtfC7Xuv7rQOahaln6rZRdToz6gmRKXTN19/rlQoyRuMoV1EBi9lZtPwsYtHPfq1C3
 FGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWObr22ksvrhZ9O40b17Fzoa2hTSNXx9/SjTN9dVo8k=;
 b=MJFjPhuow9kvssDWY9D7YdG7OG1/V2BSyy5rw+e+BZFjgMdUNVH0z1m8LYXgsRiZV3
 08DVinc1D0smrFk/N3vcW3t4Rnlue+eGMBdVs/sAt7NnZVKRL3qJjJOPFW0MwU6cOqlz
 V8cmbCdJ8KH3DI84gYHUyY21FQWNRLgnKAYzknuUVf9b1ooYiCMcd/5IbxKlxiWbgxI+
 chBQpZUIK4SgWCT/FVjSE+LWBWW4QrDy0humWpjccmSP4hCHNKOh3F+PSYbQ2g+UFLC1
 DB+HbwqNdOtJJIfHOURrHE6Zp9n+Vk0qelfIXjg56ix65nD82Sv3PxFBlXZ8+orxrRNr
 s9yw==
X-Gm-Message-State: AOAM533WQkPpXMVexKx6HKr9zYV1CDoPYdCrDKHNs/5dvupWKyQ6LDo1
 RUGWUqbKy20VEDy850txHCQLpBGfob42MjSg
X-Google-Smtp-Source: ABdhPJw1xbbmUE0uYgqAcoDIE0beNjdgLWS9VXi0OSqc4efGHwSsyirtn6p5iTR3hqYqwqkY0sdYfQ==
X-Received: by 2002:ac8:7b2b:: with SMTP id l11mr4900812qtu.126.1601512130987; 
 Wed, 30 Sep 2020 17:28:50 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 17:28:49 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Wed, 30 Sep 2020 20:27:04 -0400
Message-Id: <20201001002709.21361-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201001002709.21361-1-jonathan@marek.ca>
References: <20201001002709.21361-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/3] drm/msm: add MSM_BO_CACHED_COHERENT
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
Cc: AngeloGioacchino Del Regno <kholk11@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add a new cache mode for creating coherent host-cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/msm_drv.h              | 1 +
 drivers/gpu/drm/msm/msm_gem.c              | 8 ++++++++
 include/uapi/drm/msm_drm.h                 | 5 ++---
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9eeb46bf2a5d..2aa707546254 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -410,6 +410,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
+	priv->has_cached_coherent = config.rev.core >= 6;
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2c3225bc1794..6384844b1696 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -167,6 +167,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 	/* gpu is only set on open(), but we need this info earlier */
 	bool is_a2xx;
+	bool has_cached_coherent;
 
 	struct drm_fb_helper *fbdev;
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..ad9a627493ae 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -431,6 +431,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (msm_obj->flags & MSM_BO_MAP_PRIV)
 		prot |= IOMMU_PRIV;
 
+	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
+		prot |= IOMMU_CACHE;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
@@ -998,6 +1001,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
 		struct drm_gem_object **obj)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 
 	switch (flags & MSM_BO_CACHE_MASK) {
@@ -1005,6 +1009,10 @@ static int msm_gem_new_impl(struct drm_device *dev,
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
