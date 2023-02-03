Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE068A1C9
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3894410E884;
	Fri,  3 Feb 2023 18:22:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825A410E872
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:58 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id q19so6034135edd.2
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAOkpQZBJYrBaVkKcS88f22lgVA7f+R2bKYgUh9S0rE=;
 b=HY0q76U2tQlTaepnNsYUTnllZq7G7PN3m5ogkGata/SS9FydvY4NK1YMzUwTPfDFhv
 DSSQZ+rcw645q+OpCq9IPWBkP+hnOBbKIEzbO2TL1gVYYqiaNPl6H8BtM2YCJMSa2ezh
 J+b4ZYXI2s0LmNkU4bvD+K0j8I/nMedRjOg7/dFrgwsX3+gIY2jOgsrRj9Y6h59Y1aFs
 dT3Ctn+iqJbSwz6oXflLwsbrpq6ZFFKk/5HXM5C7aLnp4y3fbb8a+gf94Kpsn7Vi02u4
 DyEWEEXoFclXhBTY/cK5MIFZU7KAnxtDZqrxj6E/dUrc8D73JIRBW7nosYWRxpp6GGOA
 J14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SAOkpQZBJYrBaVkKcS88f22lgVA7f+R2bKYgUh9S0rE=;
 b=eBn0dn2qIpbd8RPdAwbtxT+6kjMeQzttbPBjHTOQpIL2+eGAoEvkI6CSAf0Gn5JqOF
 MRZaVIfUqqsBAjXIx/+gXaKOR1DNahft8Unh33Nu2vY6EFRNbYKOKjpdks/gwcYJQrf2
 np8wWxdpbTlfY2reGUBC7drSOkEnoWn5L6oL8Lcdsbc0YLGb0AcP4kFxpgBvzEb6sjlg
 wfmZKIflk6oSkEh1uFdKErlnY8tuvOSAgVr4bu4qupD3bg6Dos1abTlW1ki0qcs+ajzj
 4TCvdp5M2sicNxqYDFJ63GkgX2rF/hDXW+y9TF4FuGCiAXiZF7OZtHQ5HLOaHIHcTFM1
 MiRw==
X-Gm-Message-State: AO0yUKVbPKjmyLMBA+kWDsUMuI/19zq95YI+cweieB8hw14ib4VCEeZi
 7PkySM6MPYCtWRLOFQSaO5WkCg==
X-Google-Smtp-Source: AK7set8jBmIN6QF6DFzq0VCjNkvIPdlLJ5QBziNeM6WaL251VvM8H2vatq9uJnSbOwuZsYUP1FZitg==
X-Received: by 2002:a05:6402:134b:b0:4a2:2e8a:14d8 with SMTP id
 y11-20020a056402134b00b004a22e8a14d8mr10379187edw.30.1675448518134; 
 Fri, 03 Feb 2023 10:21:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:26 +0200
Message-Id: <20230203182132.1307834-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 21/27] drm/msm/dpu: simplify
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

Since the driver uses clipped src coordinates, there is no need to check
against the fb coordinates. Remove corresponding checks and inline
dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ecf5402ab61a..0986e740b978 100644
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
2.39.1

