Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F680CEB8
	for <lists+freedreno@lfdr.de>; Mon, 11 Dec 2023 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BB210E053;
	Mon, 11 Dec 2023 14:54:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9736E10E053
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 14:54:43 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9f4bb2e5eso62379871fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702306482; x=1702911282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
 b=SC+zBsp8Fxivln8S9r1iUKs2lW2EU+msJ+4irgvJFZLIEEVS1nBZzDdYvXlcCD/+tr
 2X84oOMC1DGVYugmBdM8uSA3ZRp3a6p5GWrkpfhzs0ZjezcVUtEKjzDLl9a6fAJdTnf8
 lH49TNoTbcEQzvKV2HmHKbHDm55hTK5Jhx5pUcRvr5sdaOfAfHNIFmucVXhrWypgFxZk
 AmsyXgUL4eSBXfu6QGwk2hJiEbQlMQSGyZ+b1rGsu+jhTCkh+ud8MFk9xd3MPXu+25ci
 eaAVCW3wwLA3Tc4uP1yLhEHWORsr3nxs3eB3xKSIQ6AwHkdLrqKLRa070xWVz9erQPWk
 ODsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702306482; x=1702911282;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
 b=twuf2kSS+Jvj3NOMGSLRyzZIwITaCgmJvm7TkAjH+vL80W8Oc3FvoUPZ+YLPtNaHyu
 0DVBUO4UBDFOAIbhxf/qQ4f8cDAGFmVW7hh6mkVLXTMtocSapUBE0HZe473KLZ5ICdN8
 ykFQTw5kLL4vKumF1mgE+sAfL3sNN27XxA8fXSi+fsE6FVMnaECl2am3D6XrXUXwWCfk
 nfYpz4M6Nr5hJpdBYPJxqtEbamMj8lx5fb8F/TQXjqUdBdlP3ThFGai6Gj5DPppFq0CN
 7Pk6jeRNb9By5kT5fH9pUjT2+ZF4BHAevDQFLaIjVq9WkIKBaRb+CtnhFi1dRqE/p41M
 cukw==
X-Gm-Message-State: AOJu0YwOnI7POjWpNRHoeR5LOPV6Az8+cy0SimpLvPKZbSW//qZBT0tG
 5ZwY83S9iIn3ty7VIlZKxCEjRirjrV4n/zbtQ8mb/Xdq
X-Google-Smtp-Source: AGHT+IGr8J6w01NY5cbDlOuF4emsiRJ9tq/klXFYiGXVOl3b/5MMkmAtpWW7+TzLdyUHXnRrH7RA7w==
X-Received: by 2002:a05:651c:990:b0:2cc:1ea9:2b9d with SMTP id
 b16-20020a05651c099000b002cc1ea92b9dmr1735596ljq.48.1702306481659; 
 Mon, 11 Dec 2023 06:54:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a2e8ec5000000b002c9f1fdea4bsm1244272ljl.17.2023.12.11.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 06:54:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the error
 path
Date: Mon, 11 Dec 2023 17:54:40 +0300
Message-Id: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
extra drm_encoder_cleanup() calls.

Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dc24fe4bb3b0..d60edb93d4f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -586,7 +586,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-			drm_encoder_cleanup(encoder);
 			return rc;
 		}
 	}
@@ -619,7 +618,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
@@ -651,7 +649,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 			n_formats);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
-- 
2.39.2

