Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8677BE8F8
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2C910E2AF;
	Mon,  9 Oct 2023 18:10:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C2A10E2B4
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5041335fb9cso6074795e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875047; x=1697479847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifZolr8J8pRMC1MF21MdWDJqO8xHcFjEBmzDjHRBYUI=;
 b=jt4CEech9r92ePqmNWF6ybWxo/ZyjiPFfL1+3hNIrCd2n5x4wsf+uindrNUExtm9fA
 d8aViL+fubuqO0BZ6enEpNayXhogDWQdH/csmlAKa/39iLFdXRo3fT+IzTJGehZPj/OE
 Ss8aKOhcqlaFiPvCA/srxtVqMTnirhkxTHzoWo3B3GnnFcOmAAVc2YknMQDDBRuliWnr
 SzE31IYTCLwcAfXePCBFN94/xrjPkkU0Tostz1FS5FskmE/HcVrZAxM6SoX6BCXjTVau
 uBX6N6okHmJdfGIVCc8hFA5Z5hWn1b9ZIzadCjJHIa+H5zC33fSLqOdChVP+UGrWuYwk
 kaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875047; x=1697479847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifZolr8J8pRMC1MF21MdWDJqO8xHcFjEBmzDjHRBYUI=;
 b=GLDf8BaM/A3Qon1BeLx+FacEnz3xKM9JQgVH1qxw2GMFVTbMaEsW8HPz3nQnkUpHiF
 1kqEUpeseCE+JyUbTh41gBFiILi2QN4pIeIqk8mD2DHsAi66nP/RBHnBORTK6k+oelwx
 mAR4WpcXJ7LNsIxgoGm00FKx/9v6rojZoGV2mXStZ1pRPcDX2EKQ6LQchPE5IEMzDI2G
 F52ux76k6r2we2LGBcKGpdtxGIThzoarUdV4ci951SGyz5+/Qj4q0FiuyAg5pccEJWTB
 bTPVXN4zCeEDHC8QgFGqcKaALYIltgO5cGXRH/rctHCCqv4AyJ7c/2k8XRgbiU64o12c
 Lukg==
X-Gm-Message-State: AOJu0YwWhHvOz6AvxXzo6YK6frk9gVKHvINyNAf02drYwa4yFR+cOAuZ
 EWzTDeXqmfcna2G+GAZLrvosiJu8jiAkIB0fVOdxtg==
X-Google-Smtp-Source: AGHT+IETB9qHD6UMNe1JOlEW7KOoPOJKYdk0kJ8APv0qTfZQQEbMtXBZ0VbrfTht1hsJCagb4y0E/w==
X-Received: by 2002:ac2:4da8:0:b0:500:bffa:5b85 with SMTP id
 h8-20020ac24da8000000b00500bffa5b85mr12377982lfe.32.1696875047373; 
 Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:34 +0300
Message-Id: <20231009181040.2743847-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 07/13] drm/msm: rename
 msm_pm_prepare/complete to note the KMS nature
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

Rename the msm_pm_prepare() and msm_pm_complete() to
msm_kms_pm_prepare() and msm_kms_pm_complete() consequently.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++--
 drivers/gpu/drm/msm/msm_drv.c            | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 12d604b6b7e0..1f06c0c36533 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1342,8 +1342,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id dpu_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 18735bbaf798..386f61556789 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -501,8 +501,8 @@ static int mdp4_kms_init(struct drm_device *dev)
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static int mdp4_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 68fcfd85d250..d936b6b958d1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -960,8 +960,8 @@ static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id mdp5_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fe885bfd9742..76b69f605b9c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1100,7 +1100,7 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-int msm_pm_prepare(struct device *dev)
+int msm_kms_pm_prepare(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1111,7 +1111,7 @@ int msm_pm_prepare(struct device *dev)
 	return drm_mode_config_helper_suspend(ddev);
 }
 
-void msm_pm_complete(struct device *dev)
+void msm_kms_pm_complete(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a6a29093bbe5..a28d93c09492 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -563,8 +563,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 
 extern const struct component_master_ops msm_drm_ops;
 
-int msm_pm_prepare(struct device *dev);
-void msm_pm_complete(struct device *dev);
+int msm_kms_pm_prepare(struct device *dev);
+void msm_kms_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
-- 
2.39.2

