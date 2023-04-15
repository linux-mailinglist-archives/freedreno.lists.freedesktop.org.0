Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC936E32DC
	for <lists+freedreno@lfdr.de>; Sat, 15 Apr 2023 19:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A107D10E12E;
	Sat, 15 Apr 2023 17:19:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633810E09F
 for <freedreno@lists.freedesktop.org>; Sat, 15 Apr 2023 17:19:30 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a8bca69e8bso1202491fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 15 Apr 2023 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681579169; x=1684171169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djjH6l6gWHD/7tLVc7hCppYHxE7ISqbQiXi67Zk2lWc=;
 b=WyfTEnceCWvXAOA4xmBaowOmv8LLibekgh39seiVGdn6NkGaqnNvUiL/YWkw9RwfmI
 4FXzZgUF84y8sqdMOGa9KQfswxsvZQnGRuxDZMgSw/HSzi/+hUqOKiMgk8RJlHI/iHIT
 0hM3hJYSWR9loOoK1s183qrW7mHUNOGaCVow++2puylaOIXNfZTTjvzB4atKGZVrQBB9
 1qR7d9eUa6QbnTLtnB7WZurEGmT2eoHB/bA76BB7H3eOWLkbvD73qgcT673Tixn9WLib
 soWmAEbSrzu8KVXhu3RlEWn45CrLF7WTWZtU+0S9tJaKF40A4BZYXsgyG0iw0xXdQnRa
 yiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681579169; x=1684171169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djjH6l6gWHD/7tLVc7hCppYHxE7ISqbQiXi67Zk2lWc=;
 b=kENb/bQBKc/+Eh5QAMPKuogWzjTbOjpd1OMqduATLS9to3FMuLUJLtJeEz4CRn0F1B
 wzaETGIQD1dM8pxAfUAbNcXZNurSDCOdy22JwORe+puAXnDQ7d18T4Dj1HuAwQe864FF
 b//3B5H+0U5gOczHIq+y7f3QIRMpnEbfO3PovpQDo8hRkQzCbQ1Tm03GBbBHGFSu7vlP
 SG+tXtz7R9ML2sB2MvhTkQBF1eAh3ajO0wmLI8ShoX8RsNTS+rmhpNGVXs0YXXHS3Ce9
 1IYwRi31Cal2Mcjmw0UiMSc3mPe4o0WFl5UZYMBz09lrLCv3LQNj2BU5lpGKOPVzCuog
 h5lg==
X-Gm-Message-State: AAQBX9cPCo2Qtc0Fqk30vtuamsL20Csh37zbmq35HyVhFZrqZOyImUV/
 v36qmuakWskRR77+hVMgjjzr2A==
X-Google-Smtp-Source: AKy350YABuA42xlTHmFtNWFpe1wFIwkJlIlQ5Vkfr1Wo5Ylmhiy0/D/7i280gsoBPLyqRSxIWMF4Bg==
X-Received: by 2002:ac2:4186:0:b0:4dd:ac8d:671f with SMTP id
 z6-20020ac24186000000b004ddac8d671fmr688379lfh.34.1681579169145; 
 Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 10:19:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 15 Apr 2023 20:19:26 +0300
Message-Id: <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] drm/msm/dpu: add HDMI output support
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

MSM8998 and the older Qualcomm platforms support HDMI outputs. Now as
DPU encoder is ready, add support for using INTF_HDMI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e85e3721d2c7..65cce59163a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -617,6 +617,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	return 0;
 }
 
+static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
+				    struct msm_drm_private *priv,
+				    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
+	int rc;
+	int i;
+
+	if (!priv->hdmi)
+		return 0;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for HDMI display\n");
+		return PTR_ERR(encoder);
+	}
+
+	memset(&info, 0, sizeof(info));
+	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	info.num_of_h_tiles = 1;
+	info.h_tile_instance[0] = i;
+	info.intf_type = INTF_HDMI;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc) {
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
 		const u32 *wb_formats, int n_formats)
@@ -683,6 +722,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
+		return rc;
+	}
+
 	/* Since WB isn't a driver check the catalog before initializing */
 	if (dpu_kms->catalog->wb_count) {
 		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
-- 
2.30.2

