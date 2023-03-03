Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4E6A9800
	for <lists+freedreno@lfdr.de>; Fri,  3 Mar 2023 13:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ABF10E623;
	Fri,  3 Mar 2023 12:57:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E2610E602
 for <freedreno@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:42 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h9so2240447ljq.2
 for <freedreno@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
 b=pLgAskMwSLOHvbGlkp3920Rvp6k7PQwShQp8X6sV+sMpWd0aXMpZiaTrancIpnZakH
 mjxsqd4tZ7rDgeHpbUmbqiUQFsCe8aJ+vTO5WCiYKVEaxiYd+Bia9gL08GDJw/X3T5WK
 /Tk5qvsHHzmQGAdkdhlswV3oUfm7416f2/hKDbcnOTjBw9q+6UNIhofls36ENSSKSSIf
 4SlIIyKsS1VjcnbYy9O8XlZ/DOwKJ0iicOMIy8z8tvXKo+Cb/+1N6+O+2Aewhgz4JOLm
 MEGyhNDs/gNP7XvvYITJm1PV1lChWcV0uUjlRODevTqe9+RChKm8wLgITNp+LUyuQWsN
 uKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
 b=RkToC9rQGUw9f0YDA3U7OlW9MHzPAxS1BqEN8AfIKi8zwTD3KRXq0T5TM0qi0Hzmqh
 xPJk2hGjrHwhGvtR7odB9cYWgLEU0IK7IE5wRW4ZcOIP/FKemq02Nna/BOzQANbBGmvm
 EWjNl2XDHD8sJux43Orc4d7WqKXiCMQV9kN+cJQ0itFw2RGZpDzCYsgI22QQC7k0eldR
 5UZi+OnAx4X4Jsz7D1HeJh9A/uUzCWsDUHbHywN7UeZlEuBRHf+VmFaRQZXjZJFGWNsQ
 tg/Jzir8S4Rmeb3Y2VHXeO2ErfpXJKMQyYdhzh/kzE6Dx/K4RUAXocqipHYRc5HScNrm
 gwOA==
X-Gm-Message-State: AO0yUKW1R/t+UVLayNPVE2oinD6+4uF0QY7nC4kFKax4/iSGWbcpCQAq
 iCJy9dxZ4yw8yNAez/9jx/kVUg==
X-Google-Smtp-Source: AK7set8ptLHioRKHlPEWMaeEZcNgJ9Pf97xTuWkvRShgA9+ob23HQPwp6+yWmS8mGU//lpyn2QxDGw==
X-Received: by 2002:a2e:b8d2:0:b0:293:5c72:b289 with SMTP id
 s18-20020a2eb8d2000000b002935c72b289mr688640ljp.4.1677848260307; 
 Fri, 03 Mar 2023 04:57:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Mar 2023 14:57:16 +0200
Message-Id: <20230303125725.3695011-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 21/30] drm/msm/dpu: simplify
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The plane's clipped coordinates has already been validated against FB
size in the drm_atomic_plane_check(). There is no need to check them
again. Remove corresponding checks and inline dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ba850e9feb9b..9c556ba9cb7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -894,25 +894,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 				old_pstate->needs_dirtyfb);
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
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 						const struct dpu_sspp_sub_blks *sblk,
 						struct drm_rect src, const struct dpu_format *fmt)
@@ -998,6 +979,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1012,7 +1001,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.39.2

