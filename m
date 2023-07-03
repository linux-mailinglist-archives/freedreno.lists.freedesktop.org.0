Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B874534D
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69010E09B;
	Mon,  3 Jul 2023 00:37:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ABF10E176
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b5c2433134so48714861fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344674; x=1690936674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7G1CsCJ23zaCfQOQFeshNDkLCUSa7yYapmukMUdJ04U=;
 b=PBuB1pO7o603SkfIOeeA/WpLHfIMMzwz1dV2GHudNFtU2g7cqvtT1RBlHalGL0C0+2
 8f7Xfi0pPHM5LygP4S18yLatZQLAvcukvWI45cX167URHO2gN9jFMRTgWuyBj751iTrv
 nd3lti5NpZytzH95/XsY85cC2epdRU8sEMtm5xrOPU9uwUU9GHP/4UoEq91JUX0zTXX2
 Sb1ZIWxNDvwd/Ngank6BQOiT0WVHLCBDXmvs8AC7GBKT9y4X9Jl8TxQouuHsN0GMKwjB
 5jHvffSoX93IF9kuc6pm/zOJUm9QsW8M1l4cgtxZE0Y03kN3jLZcY+3j08rZet+k5/L6
 NPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344674; x=1690936674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7G1CsCJ23zaCfQOQFeshNDkLCUSa7yYapmukMUdJ04U=;
 b=NTF/kAphVEjy97tRblYvJAb7TZL43XPFrFLYI21wzqPBXjKRO9Qg7KOCM23qKe1g4g
 Jde0u027eN8tsx/fpp3NsSUpT5Brxaqr4xW3YUOjHwFkWqtVzShy1mQfskqMZHkvcLfR
 eIK/WNejWKhj/R6d8fSVuNdOOjDadaIdBcFC6a00M3cUnKEVIMQ/c7shfqUw6BF++HXn
 PfBk2Hw/l7gGu1dtO5RpV3ecxc1LsIJAKdat0D0+YzAehMJyYf3WVAr1POZdZ/IWDLN+
 ZiTKCOtlwdP8GvYrjaLFl1fexTz/zYhvDYtHhlmIaB23Nn1wWrExZsNqC+81MrDThOAA
 gtVw==
X-Gm-Message-State: AC+VfDw1ZF2uEhYpFNrSRk00lDV5maae0F8eFA4e2sRacBjuxogLy1Qs
 COTEmCYSfo+os29cSHWdiisXWw==
X-Google-Smtp-Source: ACHHUZ4QHiwmcxeXKRHyuXg/5wgfUeP3Y9/Fy/S1J4q/ljb2RH4oaJkmIv+syp6mKGIlTMDgk0unyg==
X-Received: by 2002:a2e:a453:0:b0:2b6:a570:1d5 with SMTP id
 v19-20020a2ea453000000b002b6a57001d5mr4493534ljn.10.1688344674337; 
 Sun, 02 Jul 2023 17:37:54 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:37:41 +0300
Message-Id: <20230703003745.34239-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/13] drm/msm: rename msm_drv_shutdown() to
 msm_kms_shutdown()
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

The msm_drv_shutdown function should only be used in the KMS case.
Rename it accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 2 +-
 drivers/gpu/drm/msm/msm_drv.h            | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8a5249907f53..993799c0945e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1320,7 +1320,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
 	.remove = dpu_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_dpu",
 		.of_match_table = dpu_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 302f3d10a464..e35d450492f1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -572,7 +572,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
 	.remove     = mdp4_remove,
-	.shutdown   = msm_drv_shutdown,
+	.shutdown   = msm_kms_shutdown,
 	.driver     = {
 		.name   = "mdp4",
 		.of_match_table = mdp4_dt_match,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7572e8616961..edd4e68b6e3a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -976,7 +976,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
 	.remove = mdp5_dev_remove,
-	.shutdown = msm_drv_shutdown,
+	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_mdp",
 		.of_match_table = mdp5_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 971c008e82cb..e929da9360e4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1281,7 +1281,7 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-void msm_drv_shutdown(struct platform_device *pdev)
+void msm_kms_shutdown(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 67450dccc5a6..17f22b283c30 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -561,7 +561,7 @@ void msm_kms_pm_complete(struct device *dev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);
-void msm_drv_shutdown(struct platform_device *pdev);
+void msm_kms_shutdown(struct platform_device *pdev);
 
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

