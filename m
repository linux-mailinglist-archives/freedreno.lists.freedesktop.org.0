Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D584AF841
	for <lists+freedreno@lfdr.de>; Wed,  9 Feb 2022 18:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0C210E4EE;
	Wed,  9 Feb 2022 17:25:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FC710E4EE
 for <freedreno@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f18so5496462lfj.12
 for <freedreno@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zscC5lsPDSIUC6EIflLZwP0Y4/X7Lz0x0KN68AEWQMk=;
 b=QdWHP8/Jdki2lNNzdtGCQvLFL4SXOXshlqCxTM20bK7p+s1RSUDy1VHaAU7bBnSVuW
 oKq4s2h2UkO2nScV0h7MciS2lQABo9gmuSfI7W5J84gmWZMPijZoEgih8gpXyxsD9Zi7
 5shvEtZ2HsbohQWFMPWEgRHO11n+RHNOTc0xbDlYkg1+uQuj0a0PqAboGmBAS3vPIonW
 2sWMkk4qV7zxb6L211whh/ZknaxF6ahfbkFvl+ADmwQ6JtEBjuMULgB2jZB6GHaZmrYR
 q6gp5T9uabXckj4zx9Fx9svIxpwOvTIUPJe/2WYo2OZ23KXsaElTSbX+Pik3uXZ4/Hnj
 fEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zscC5lsPDSIUC6EIflLZwP0Y4/X7Lz0x0KN68AEWQMk=;
 b=SzTpUYP90Jak5TKXZml/LJYdXft+s7SAJxbdI/cnI5XG7tziXcRt4kA5kEXagYGyXu
 164kGg23RCJunhjrCPo/5eQ0FXak+rOQTDsDZhk0hf8Brm8lOXNdTrxXqKsHch1Ijsw8
 GI2taGRJNpG1wFKvSZA0pcy2VRT/MZGXCVrOnuMV8Di8BwXU2bVXDiE8ISrwF0UxzMlW
 fs3B8d3fB6Uz1/TG7yHXQqoTaAQGqrQzURhmH1y4zB1CvYPUlvgxXAo2il/g+d0vR74q
 h43tTprtQmei7qJBm+01yNiyhwiSMUa8aR8qlDGCbfRX9Wtwd7HoqT42mZ+LTU+Itsww
 r/tw==
X-Gm-Message-State: AOAM533xAwj28ROCJLfoTIJC02aVwHS8082Nj75hHFVxjz3b4USs40o6
 BD6P1utaBQZttioTIopA0dqgbA==
X-Google-Smtp-Source: ABdhPJzkZXFPBFN2hKc8oso+UxgdZ4tDXH2HyH2lU8xqTax0xsSLhLo3+Fax23zqexzS1tkZYKjxFQ==
X-Received: by 2002:a05:6512:3dab:: with SMTP id
 k43mr2258606lfv.385.1644427544191; 
 Wed, 09 Feb 2022 09:25:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  9 Feb 2022 20:25:16 +0300
Message-Id: <20220209172520.3719906-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 21/25] drm/msm/dpu: simplify
 dpu_plane_validate_src()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since the driver uses clipped src coordinates, there is no need to check
against the fb coordinates. Remove corresponding checks and inline
dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 863aedcda66e..37810948ffe6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -874,25 +874,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 	msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace);
 }
 
-static bool dpu_plane_validate_src(struct drm_rect *src,
-				   struct drm_rect *fb_rect,
-				   uint32_t min_src_size)
-{
-	/* Ensure fb size is supported */
-	if (drm_rect_width(fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(fb_rect) > MAX_IMG_HEIGHT)
-		return false;
-
-	/* Ensure src rect is above the minimum size */
-	if (drm_rect_width(src) < min_src_size ||
-	    drm_rect_height(src) < min_src_size)
-		return false;
-
-	/* Ensure src is fully encapsulated in fb */
-	return drm_rect_intersect(fb_rect, src) &&
-		drm_rect_equals(fb_rect, src);
-}
-
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -947,6 +928,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
+	/* Ensure fb size is supported */
+	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&fb_rect));
+		return -E2BIG;
+	}
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
@@ -961,7 +950,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.34.1

