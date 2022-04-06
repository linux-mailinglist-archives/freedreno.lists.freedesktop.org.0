Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3024F5A7D
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 12:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312CE10E480;
	Wed,  6 Apr 2022 10:12:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFE10E354
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 10:12:51 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 5so3269842lfp.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
 b=lBMNDe7gQCC4ebFNFGkC26gogyipiwJpnq+UUgho6W5FDPVtZBBJ2TbdeFuD8Iyws+
 0Cmjjd3a0qkYR7ffYMxGZTDCCyCDSyC1fD/L9e0WpxuJ/9lOOSu3wvby4164Vt0A5v82
 wgr+U7vIb9Vn39TSzE7EnXeyutb87PFKKZn1aKLpZrB2o7WsbZX4IMOba2V2z9wEq5Ul
 pxNRKtcTzfWjzg8AmtL4Kne50qx+kWZuFgjqDD8gYEdD/q4tCCfnxKaVDShJcHtEKYd7
 CJh6PIa+skjqafUh/UJqNC/lxBCWT1ZoW78W2NnC/9J4AqKabCf62PtwBx1Tv4HJAssl
 RdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
 b=I+PHOJ1nuVa3XGGjvquP81r6B77Nmk6dKL9+BtP6J/HuW1lq2KFz8xdRrYwLa0/gAU
 txk6QhKYcpbbJMVDuyNM6Mpk2l/DaMn+di1WmWrvBt4+gBdvTi6g+Lcz+uT6x6VwVZi1
 HHYPGA6zOeLb0AV/R9b8VYAt8/3wUO475ldW/Ku15SAVfp6BVBG1TZrtL81dHxN0c4So
 +1OmDLtCe+22xdX8L3j9LTa7cHxGc6ecngeLxPzH78oXFMZ9BxohGV09wPgoZ4rk6Edt
 dfBD1TGe+Rcp8jPZQbJdN9C0vGPsENWvNhdqbfCby7XNwH4uu8HByf1wxWBB0Ytl/p6Z
 nq0g==
X-Gm-Message-State: AOAM533ztM/oIT6wBwGpw3AfE6PalSSi1cEKf4Qsw9kZZeArNPwn5WAz
 PElsBcryKLyB0515DrbmDwqASw==
X-Google-Smtp-Source: ABdhPJyLBSnTtkWo/vQTUbP0vBJBZvPflYJTgehBeZ456ZJrkY0WQK6Nu1zweHG/3EPRSjO68Tok4w==
X-Received: by 2002:a19:7501:0:b0:44a:2f6f:3ae8 with SMTP id
 y1-20020a197501000000b0044a2f6f3ae8mr5430428lfe.143.1649239969985; 
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 13:12:45 +0300
Message-Id: <20220406101247.483649-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dpu: remove manual destruction
 of DRM objects
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

Remove manual removal of DRM modesetting objects, it is done anyway by
the drm_mode_config_cleanup() called from msm_drm_uninit(). Other
MSM display drivers (MDP4, MDP5) do not manually destroy objects and
trust generic code to do it's work.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++----------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..d0525a9ea92b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -675,30 +675,6 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
-static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
-{
-	struct msm_drm_private *priv;
-	int i;
-
-	priv = dpu_kms->dev->dev_private;
-
-	for (i = 0; i < priv->num_crtcs; i++)
-		priv->crtcs[i]->funcs->destroy(priv->crtcs[i]);
-	priv->num_crtcs = 0;
-
-	for (i = 0; i < priv->num_planes; i++)
-		priv->planes[i]->funcs->destroy(priv->planes[i]);
-	priv->num_planes = 0;
-
-	for (i = 0; i < priv->num_connectors; i++)
-		priv->connectors[i]->funcs->destroy(priv->connectors[i]);
-	priv->num_connectors = 0;
-
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->funcs->destroy(priv->encoders[i]);
-	priv->num_encoders = 0;
-}
-
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -721,7 +697,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	 */
 	ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
 	if (ret)
-		goto fail;
+		return ret;
 
 	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
 
@@ -746,7 +722,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-			goto fail;
+			return ret;
 		}
 		priv->planes[priv->num_planes++] = plane;
 
@@ -763,7 +739,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
-			goto fail;
+			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
 	}
@@ -773,9 +749,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
-fail:
-	_dpu_kms_drm_obj_destroy(dpu_kms);
-	return ret;
 }
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
-- 
2.35.1

