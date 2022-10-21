Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12F9607F05
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 21:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6910E0D0;
	Fri, 21 Oct 2022 19:26:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D52D10E66F
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 19:26:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id m23so5075700lji.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cwaXIne9/tESZg17OSM+CaHqqM5h7/O7wHnlJa8eBxQ=;
 b=fRhXofGb9cOnPhQS9hLIzMl+L60HxccZ+eZsKCY+f1ulBEflyP7axwksg4YImuwdZG
 2I2tm/a2749Ob92vwTjhmSGMhvxpkxWxzXBmA4e5hJrfDjqRaXesyBLCQeQPXAgKzOfm
 oaLTHsvetaybCZ1HwULDh6o8q5Mex7KKeli6PE439Lll3mh+I+wXKpqIZLf22fsH4srr
 7j/1dZGwmmj2WP7Thr3P7iS8htuSEO63KMJ67RRNzv+KSussjDS7sdlRc0HXeQXdxnKk
 uS1D7V8kytITGW4Q23M126eKMRkqAb7maykTtPE0ocYEA9iog5e4IXnVUljTgR8zKL3A
 z20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwaXIne9/tESZg17OSM+CaHqqM5h7/O7wHnlJa8eBxQ=;
 b=4+YMUmQGsWMJCKpz2hT2h+IFWHuBDH+m/8rJMAtnUComEoC874uIqfgJRm1gzHPyV4
 WOKTJxtcKgLDEE08UcNOasuO4MPGiNSuDiLSbH84oqrfHRRnFja5K9DLz9voaPKKBEOn
 1q0fAYw3YeQexBzoTeVrWoL04yyZTKOBuC5iM0ge24HLxFrduU5KT4TBBVZTfWO7GYfg
 TjbDX6CVZy5Q++3v29cdec8fSWDCHis1Z+LQ/lT/1CnH5TNetmj5Js79Q/INj5qTsE9o
 SMc0M6VegYxsArNlWx2fr9G9vc7tdCuMF0u9xBJOZK2RnS02xLHhDrBV6inm1TnEPrAk
 hiwA==
X-Gm-Message-State: ACrzQf14xmtwEShFKGf9P2RYDnHBY6xGcfUQfPbRozR6KkIKOdPdhaIt
 lgXiuklKbJxyF6T0VCjrqBvZ6Q==
X-Google-Smtp-Source: AMsMyM4URcKjhKDfjJeEk40K9eZOqmBNKS2DZOrzlHrnPBm/rYl5u6eIXMDc4mYJ0b1qm9YdbduYqQ==
X-Received: by 2002:a2e:b8c9:0:b0:26f:e171:1bf with SMTP id
 s9-20020a2eb8c9000000b0026fe17101bfmr7063691ljp.460.1666380402545; 
 Fri, 21 Oct 2022 12:26:42 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a056512368c00b00497a41b3a42sm3278341lfs.88.2022.10.21.12.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 12:26:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 21 Oct 2022 22:26:41 +0300
Message-Id: <20221021192641.2423237-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/mdp5: stop overriding drvdata
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

The rest of the code expects that master's device drvdata is the
struct msm_drm_private instance. Do not override the mdp5's drvdata.

Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
Abhinav, Rob, please pick this for -fixes.

This is an updated version of [1]. Fixed the read_mdp_hw_revision()
function. PM runtime isn't available at the moment, as priv->kms is not
set.

[1] https://patchwork.freedesktop.org/patch/490326/?series=105392&rev=1

---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 37 ++++++++++++++----------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b0d21838a134..506c64940972 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_destroy(struct platform_device *pdev);
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
@@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	}
 
 	mdp_kms_destroy(&mdp5_kms->base);
-	mdp5_destroy(mdp5_kms->pdev);
+	mdp5_destroy(mdp5_kms);
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -519,9 +519,15 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
 	struct device *dev = &mdp5_kms->pdev->dev;
 	u32 version;
 
-	pm_runtime_get_sync(dev);
+	/* Manually enable the MDP5, as pm runtime isn't usable yet */
+	if (mdp5_enable(mdp5_kms)) {
+		*major = 0;
+		*minor = 0;
+		return;
+	}
+
 	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
-	pm_runtime_put_sync(dev);
+	mdp5_disable(mdp5_kms);
 
 	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
 	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
@@ -559,6 +565,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	int irq, i, ret;
 
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
+	if (ret)
+		return ret;
 
 	/* priv->kms would have been populated by the MDP5 driver */
 	kms = priv->kms;
@@ -632,9 +640,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static void mdp5_destroy(struct platform_device *pdev)
+static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
 	int i;
 
 	if (mdp5_kms->ctlm)
@@ -648,7 +655,7 @@ static void mdp5_destroy(struct platform_device *pdev)
 		kfree(mdp5_kms->intfs[i]);
 
 	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
@@ -797,8 +804,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
-	platform_set_drvdata(pdev, mdp5_kms);
-
 	spin_lock_init(&mdp5_kms->resource_lock);
 
 	mdp5_kms->dev = dev;
@@ -839,9 +844,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
-	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
-
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
 	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
@@ -893,10 +895,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	/* set uninit-ed kms */
 	priv->kms = &mdp5_kms->base.base;
 
+	pm_runtime_enable(&pdev->dev);
+	mdp5_kms->rpm_enabled = true;
+
 	return 0;
 fail:
 	if (mdp5_kms)
-		mdp5_destroy(pdev);
+		mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
@@ -953,7 +958,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
@@ -963,7 +969,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 
 	DBG("");
 
-- 
2.35.1

