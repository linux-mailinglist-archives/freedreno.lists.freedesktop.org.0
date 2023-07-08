Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044B74BAC8
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81610E633;
	Sat,  8 Jul 2023 01:04:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C591010E1A0
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:17 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso39809641fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
 b=vj5PfahW28Im1lZ0vTFaFlu7Umhyqg3iCSlOaDS8k71IIhB1GZSrJg+c4K6+enjnfl
 dgBPf+NLFQxVuV7KrbmNnk9eq44WhovgAFRiCdS4fJC9Vq8yPrym8vvbxZcxvA/igfPA
 8zpNyW+ushWolMOSyiMGHnqPGmCzsRet2Pbmk3DV38NSarDX6F/kjBsQsLwmsRDWaRf5
 yzj4lbQsxaLaScfsQnBQoRK/O42wlwgq+0A9TqeqndlG5F46A5hTIBrct1SvLPc/4QN4
 ghSCrv3wkt6RKud+OzoQryZWymibgvPJZhRZhVy4Dwi1RJe7/qH3462XUkJbr74LFK0d
 acKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778256; x=1691370256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
 b=fTmGYO8lZlAddcWPG9ZFAYkfStGPtVgHQzQe7qE1T+S8im0Ejxg7Hu6TdSgKMHGT/N
 nyrY4UoWAJTzp+/fmIz8Lbw4roVSpmyKRui2suoYj39F/6NGhOwMSIvQgFba9Q2PwyDv
 87pns5ic+vU/fMVFYmfUEiw/vsnyHi2ep/xGuKWwxgUkf99/pBgmgPrHIWbfcS6dBsFC
 odfMREFWKVz4COxOos9qTcVuRwVGam5qyupvb+L906ZNr/X8PR1LnuYXDABHlpgcwO6F
 XtYGTpqQw8hUBSiPC1Xkox1AmRu1pv161hheWhGi+XMl2PxUbG15KkLmRd9oeAxtArkK
 gWMw==
X-Gm-Message-State: ABy/qLZhiWRrcl/lLmlHcGz8W4/mTXXqd7yyYnvGaULOls0oVbLm/M/7
 khiP33oOYvgih7xiJ9Ou58pENw==
X-Google-Smtp-Source: APBJJlG0kajx57KenGJOCjZPD7CvtA81GcxS6VxCtq7C2DZCC5UbaybVopoQ7PdMjLL2U15AzqjOPA==
X-Received: by 2002:a2e:9b44:0:b0:2b7:a64:91bd with SMTP id
 o4-20020a2e9b44000000b002b70a6491bdmr4427171ljj.35.1688778255736; 
 Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:04:00 +0300
Message-Id: <20230708010407.3871346-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/17] drm/msm/mdp5: use drmm-managed allocation
 for mdp5_plane
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

Change struct mdp5_plane allocation to use drmm_plane_alloc(). This
removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 40 ++++------------------
 1 file changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..177fc1a56aad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -17,9 +17,6 @@
 
 struct mdp5_plane {
 	struct drm_plane base;
-
-	uint32_t nformats;
-	uint32_t formats[32];
 };
 #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
 
@@ -38,15 +35,6 @@ static bool plane_enabled(struct drm_plane_state *state)
 	return state->visible;
 }
 
-static void mdp5_plane_destroy(struct drm_plane *plane)
-{
-	struct mdp5_plane *mdp5_plane = to_mdp5_plane(plane);
-
-	drm_plane_cleanup(plane);
-
-	kfree(mdp5_plane);
-}
-
 /* helper to install properties which are common to planes and crtcs */
 static void mdp5_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
@@ -139,7 +127,6 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 static const struct drm_plane_funcs mdp5_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = mdp5_plane_destroy,
 		.reset = mdp5_plane_reset,
 		.atomic_duplicate_state = mdp5_plane_duplicate_state,
 		.atomic_destroy_state = mdp5_plane_destroy_state,
@@ -1014,25 +1001,16 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 {
 	struct drm_plane *plane = NULL;
 	struct mdp5_plane *mdp5_plane;
-	int ret;
 
-	mdp5_plane = kzalloc(sizeof(*mdp5_plane), GFP_KERNEL);
-	if (!mdp5_plane) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_plane = drmm_universal_plane_alloc(dev, struct mdp5_plane, base,
+						0xff, &mdp5_plane_funcs,
+						mdp_rgb_yuv_formats, mdp_rgb_yuv_num_formats,
+						NULL, type, NULL);
+	if (IS_ERR(mdp5_plane))
+		return ERR_CAST(mdp5_plane);
 
 	plane = &mdp5_plane->base;
 
-	mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
-		ARRAY_SIZE(mdp5_plane->formats), false);
-
-	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
-			mdp5_plane->formats, mdp5_plane->nformats,
-			NULL, type, NULL);
-	if (ret)
-		goto fail;
-
 	drm_plane_helper_add(plane, &mdp5_plane_helper_funcs);
 
 	mdp5_plane_install_properties(plane, &plane->base);
@@ -1040,10 +1018,4 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
-
-fail:
-	if (plane)
-		mdp5_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

