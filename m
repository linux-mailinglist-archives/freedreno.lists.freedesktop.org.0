Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6472CDFE
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 20:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5E310E2BD;
	Mon, 12 Jun 2023 18:25:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0AD10E2BE
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 18:25:37 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso5454214e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686594335; x=1689186335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmlZ3LfPcxfpnDiDYgpCM3PVTuzAQsiG4BBuQYBs540=;
 b=xk7wZx06nIV5fczb9HNWO2lfpb+vzO93udN9wM3kfHOXMowEZOC80TUxYnveb/KalX
 KoS3X3HpKoSmFVc9gzLMA/k9q2K7WoDj4mwBBn43OHGAj+fE+75Ig/K25hZmG2aGfa9Z
 Ax8VqQ3owduub4dHAZdyDBv/m934BwEaiKCwDJWLzZlXHinqKYCWMMvWVCQEshIKBJzz
 EC3HIb4HmQ0bHfwx4v7CxTXFDi2aDkSlc0TE4XxRUlJfMwZhComSJcHzW8a4A/2PJv0Z
 E9gliyWrXUikwKXglXIJA0HPE04Itlz4gU+CGuqwrnpqWiBt5KpUGL+JYjb9kXcJNZBL
 vvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594335; x=1689186335;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmlZ3LfPcxfpnDiDYgpCM3PVTuzAQsiG4BBuQYBs540=;
 b=UrV3amBENI4Er6s01jeZK902Ucl5Zg+RL5w7zFtDSTLcQgf9pGi6k2oZ0MtEJtPBOM
 nURTkM5nYgPJrsqBPCgDBl9I29+ix0imlSWBAezpmaZ0wCIvCymjjvo8NGaqAES1SLzi
 cNKJ2KfBarhv2kUa5pqaHirNsUNi3m9ICBI/WxZp19haJJrUGdhZ1CujWJDFs7ZGkBr1
 MCE4s1I3gEXGqBDTV5F1ziI6z5fxWqMYb1bBpsl40VdX9BOYIyVLio07k9MYzEa22xjz
 X7ODzOeGCiJl30YbIRdqXjn1EN6i7nQcO/7nrj32PXeajIkoUX+92TUacPoMb6codkyo
 1Vtw==
X-Gm-Message-State: AC+VfDyWhSjfw5WSTLpZX16f3dzq5f+c3y+cjNIq2pFqvz/b3iyZScOG
 mR7Y0j1ADL0k+OEOeN9JVzoUCA==
X-Google-Smtp-Source: ACHHUZ4XZxIQ/c4uNWvhPciEQKRbkt895So16/iuJ0rYLPeiNyMovPgByOeciUoH8a2eiCz7jqAs/w==
X-Received: by 2002:a19:f207:0:b0:4f6:3677:54e with SMTP id
 q7-20020a19f207000000b004f63677054emr4082354lfh.36.1686594335462; 
 Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v16-20020ac25930000000b004f63dd1dab0sm1503396lfi.98.2023.06.12.11.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:25:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 12 Jun 2023 21:25:33 +0300
Message-Id: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: do not enable color-management
 if DSPPs are not available
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
 Stephen Boyd <swboyd@chromium.org>, Yongqin Liu <yongqin.liu@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We can not support color management without DSPP blocks being provided
in the HW catalog. Do not enable color management for CRTCs if num_dspps
is 0.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6e684a7b49a1..1edf2b6b0a26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				struct drm_plane *cursor)
 {
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i, ret;
@@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	if (dpu_kms->catalog->dspp_count)
+		drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
-- 
2.39.2

