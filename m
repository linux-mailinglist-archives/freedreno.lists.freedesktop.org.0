Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45957BE89F
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 19:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2F110E11D;
	Mon,  9 Oct 2023 17:48:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600910E0BA
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 17:48:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50435a9f800so6189534e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696873722; x=1697478522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlYbk6g0gAefPGbcQivRxmqfi2ql12k9T1RkVVQzLsk=;
 b=Hbo9x/tav4Oj3NjzxU187eL/+IGM1qnN51FSGoDj1DveG4eHeJG6ZnHtC7O16rINpV
 NWFopbcsPZ/9ySg1Wy8lzyGbk/OGVHRZEeGK0v1CiwYcMG8nCtO2ENJtLQKMp5DHB8Ti
 3OfSsT/+auzHNh3CU9M9AewUEG85bSkNvIQVs8FECqB3b7wXGYWto6A4ChCN+HIr6N/p
 t4FMPpRIpPfBs6K+vlmqK3VTzp57symFajJLOCoj7X4dwZgfy0h9KRLnUUH8dYGcZf2q
 Z18gEvzBzqI82uvRoB8u8Vc8yNFi0+HSTSks4hLP9qEUz85XCWwlLzdF8VjqKvbQRm6y
 3E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873722; x=1697478522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UlYbk6g0gAefPGbcQivRxmqfi2ql12k9T1RkVVQzLsk=;
 b=FdUYnycm/3TBwbjuwCDJs+dzPyrKfRPGGtPv7OzYHfqcYjTFmnT9Lo9qoOpSGiuB6i
 J6tXwzYyzc4lJCYLDgXUu79FL11pi59C1cX0MT6RJLRr2+be4B3OB7jIIn5IQsKDXzM6
 8o0W9IrzPNC5IMLtl/fWe6m1++Z0TZwB7pYs76J5u5XcX2gzSuXZC+KK15zTzsNLJk+M
 G1ePOGfkWoINRLolFKhQukp9Xj5cII8fQbxf3TzX0v8cgd3fL5FiWA+CxrMKqE3h+WaX
 +FfsvruYLkm191oDtq+Pn2d24r9NRktKE7WluNfW37v0ZWpc6jKY/ui2Q6Gy7kbAz9mm
 qJUw==
X-Gm-Message-State: AOJu0YxKkDLq0gqypiXa0F05MSl4Su8zb3fKJqSy+YgZSOajUekV6R/w
 WjjrRuHnuM7oF2qS9pEIsfSABQ==
X-Google-Smtp-Source: AGHT+IH/hncJAjs0exJ606ysnzBOGRdclhS/V041ZHGFLQXXbdfXp/WrKRLrsvtd/Bw12hYMgY+Dgg==
X-Received: by 2002:ac2:4f09:0:b0:500:b553:c09e with SMTP id
 k9-20020ac24f09000000b00500b553c09emr16975761lfr.32.1696873722086; 
 Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:48:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 20:48:37 +0300
Message-Id: <20231009174840.2726861-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
References: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 1/4] drm/msm: allow passing struct msm_kms to
 msm_drv_probe()
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

In preparation of moving resource allocation to the probe time, allow
MSM KMS drivers to pass struct msm_kms pointer via msm_drv_probe().

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 6 ++++--
 drivers/gpu/drm/msm/msm_drv.h            | 3 ++-
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 82381d12414d..41bd57597381 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1299,7 +1299,7 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init);
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
 }
 
 static void dpu_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index e5012fa6771f..807ca3961c5f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -557,7 +557,7 @@ static const struct dev_pm_ops mdp4_pm_ops = {
 
 static int mdp4_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
 }
 
 static void mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8a7b44376bc6..436e76e2fc04 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -939,7 +939,7 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init);
+	return msm_drv_probe(&pdev->dev, mdp5_kms_init, NULL);
 }
 
 static void mdp5_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 05fe32c3a4b4..5b937c3879af 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1232,7 +1232,8 @@ const struct component_master_ops msm_drm_ops = {
 };
 
 int msm_drv_probe(struct device *master_dev,
-	int (*kms_init)(struct drm_device *dev))
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct component_match *match = NULL;
@@ -1242,6 +1243,7 @@ int msm_drv_probe(struct device *master_dev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->kms = kms;
 	priv->kms_init = kms_init;
 	dev_set_drvdata(master_dev, priv);
 
@@ -1277,7 +1279,7 @@ int msm_drv_probe(struct device *master_dev,
 
 static int msm_pdev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, NULL);
+	return msm_drv_probe(&pdev->dev, NULL, NULL);
 }
 
 static void msm_pdev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index af834980d73a..80085d644c1e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -570,7 +570,8 @@ int msm_pm_prepare(struct device *dev);
 void msm_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
-	int (*kms_init)(struct drm_device *dev));
+	int (*kms_init)(struct drm_device *dev),
+	struct msm_kms *kms);
 void msm_drv_shutdown(struct platform_device *pdev);
 
 
-- 
2.39.2

