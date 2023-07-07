Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FF74B9EF
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 01:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3EF10E62A;
	Fri,  7 Jul 2023 23:13:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7FE10E61A
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 23:13:01 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso4016546e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771579; x=1691363579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8cU+QrRCAzLPYrbUafgzrXMSnP1bTP1tkhr6YGb1ys=;
 b=j3w/DJyckkz8yOuaDAay61+2DNaDv7U9wdLV01OjJunqgLwBcAgJlFJh7+YzIRSKPp
 k2Y0MT21sPLBzb3YPsc8O42HwmhNGMdT4KTpPj6CQDP5qpI0IsBP5dfo94q+LF/Pe0Ln
 tCk/Lc2/qvWuisnUGD7tH6QC1JOP4xNg54cPcoxiOP8juvF1ox1YXsdJpNN1FY6GhKpJ
 xa9v+RfQMjLPoT/hIk5XLjTk/nTgvRjolYYWC/i/3LsGHh+lC1B+LBWH40HU54ZeYN+8
 N2l75cnZwkVVP5xRSFoXgz4Gd1aH2ZgjzcJUB1mVb06UXbfGBI1ObfBHMLecdSTOIGmv
 +PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771579; x=1691363579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8cU+QrRCAzLPYrbUafgzrXMSnP1bTP1tkhr6YGb1ys=;
 b=F8pyxzRK38JTtv8zboNqyQg/B0C+Ji3a9IsYs3pKeKQyW30zSuhs0lYSPpeiHE3CK2
 58YgrhizUsX5lCh1kX+7cXvN2l4LLHzjFrNItXEMZgWQ3cr2ysonIid/QvBB6i17d1zR
 HUAWEwTHBUObU5N8VDYsmqxHCQdJl+tftuv7rciyfw1KlDE76EH12GR8JMk14PQ1IbFl
 bLsx6gl+PSiMVKiWBAQbCZYTFA53Bg1hxp007SCMAJHvaLPqHkyDkeQwKm0LWQp4pok5
 HhcSE+wDhXOPJofztqMr2q66rk/rViVozjc4uO7vMr6iAuEnntLr59/5zG3w2x7KMyE3
 pnwA==
X-Gm-Message-State: ABy/qLZuJLECv7UFy7Mz38+8FftE6A9FpI/eIsxRdpmtPAAfZQXYnsth
 ck+6ikIeQAiP7X5w5S8qPup11w==
X-Google-Smtp-Source: APBJJlHX3yoSp03cZooYO9LLzSDB1zN5F3tfoZgSLcpjHxCzC1U5If5ZNmGIpETGbIVUNPI0xTCpbA==
X-Received: by 2002:a05:6512:4022:b0:4f9:6528:fb15 with SMTP id
 br34-20020a056512402200b004f96528fb15mr5631688lfb.12.1688771579808; 
 Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 02:12:48 +0300
Message-Id: <20230707231251.3849701-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 10/13] drm/msm/dpu: use drmm-managed
 allocation for dpu_crtc
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

Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
This removes the need to perform any actions on CRTC destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++-----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 214229d11e3e..a1fcb690c687 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void dpu_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	if (!crtc)
-		return;
-
-	drm_crtc_cleanup(crtc);
-	kfree(dpu_crtc);
-}
-
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1433,7 +1422,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = dpu_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
@@ -1467,9 +1455,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i, ret;
 
-	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
-	if (!dpu_crtc)
-		return ERR_PTR(-ENOMEM);
+	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
+					       plane, cursor,
+					       &dpu_crtc_funcs,
+					       NULL);
+
+	if (IS_ERR(dpu_crtc))
+		return ERR_CAST(dpu_crtc);
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
@@ -1489,9 +1481,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				dpu_crtc_frame_event_work);
 	}
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
-				NULL);
-
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
 	if (dpu_kms->catalog->dspp_count)
-- 
2.39.2

