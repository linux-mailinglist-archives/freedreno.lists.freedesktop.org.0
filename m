Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA27BB940
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 15:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0ED10E4ED;
	Fri,  6 Oct 2023 13:37:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9CB10E4F8
 for <freedreno@lists.freedesktop.org>; Fri,  6 Oct 2023 13:37:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5042bfb4fe9so2707594e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Oct 2023 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696599444; x=1697204244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UsG04MB61AcPFLo9jh85AgVd9+bf4jS79HdCjouk2Ig=;
 b=HJfW1rasgQscHXxQHS0P1nULxYUw+TPxLOVzU6nPSsbhFuAJe6qtjQaWqLc6C7E2Qs
 Xv61FQehkKLiHwvn3mLzFYoIx2K3T5XdPkxxB3zSr7ORUza75vpMeY9r6QSgNylyZy6s
 lBjnGIpVTSanP9ZylQDEqPZxcJwqTTMvm0nf1anc2O/CG+TXYr2/FpMidXbSYdbLBlIf
 P+fgKcY/btKt3jVqVFoc+vnpxDbilKmskUUH7fxfdWJcyyJLfFPtjwL7Hr8dnygWdvyK
 Y+GwEx9YjjJ6BNSFAGAee4L04ivp5s9pRMxfC7bDCyMO9Jl7H6XmR7Ni/pepgYN5tPfQ
 S2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599444; x=1697204244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UsG04MB61AcPFLo9jh85AgVd9+bf4jS79HdCjouk2Ig=;
 b=jEmglDYaGuHg8bXkfNcfvUJ9gk6ARyGd0sDqkVRMXDj9O4pN8x/aAxemyr4GzZoKur
 mAMW1GvxaXXEiaeJtNk5k0Eic+XvBAHvkpZPJRl4Ohh3U8tz9ZYO8CY/bfiVJmYCbqho
 oS84gSZ6HSwjWvplqqt1BZIqbUlii+9FxHBiCQH3BZmrUBdJJpG4Lrr1TTnk9FADpkVT
 F9u87zfOTKftqyJOmlxxGxziauPL3j7awsy/9k2xaXJtDKYXYF+OJdEMpPqD6NclRD5w
 /3OpwomMEf0QfDtOB8T/Xtusa1UEuv469P3qQiB9KI9FE+JuXnmUUD5TvRham1WvLgBr
 OaNw==
X-Gm-Message-State: AOJu0YwqA97Qatni450Ycmk4crL/KqkDpAnBCqydzVVDbNvTl6rse69d
 uUJL8VjrCIScT7YuW0gnEVYvCg==
X-Google-Smtp-Source: AGHT+IHmMFllJQ4Gbd55HIJP4+c8nrE8MPtqw2WnmqQGRVe1tEgur/O5cwtZSYRjwhgBTc+hljL8zg==
X-Received: by 2002:a05:6512:39c8:b0:4f8:7513:8cac with SMTP id
 k8-20020a05651239c800b004f875138cacmr9392174lfu.48.1696599444442; 
 Fri, 06 Oct 2023 06:37:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056512015b00b0050567cdb8f6sm303534lfo.239.2023.10.06.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:37:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 16:37:18 +0300
Message-Id: <20231006133720.2471770-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
References: <20231006133720.2471770-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/5] drm/msm: add a kernel param to select
 between MDP5 and DPU drivers
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

For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
possible to support this platform via the DPU driver (e.g. to provide
support for DP, multirect, etc). Add a modparam to be able to switch
between these two drivers.

All platforms supported by both drivers are by default handled by the
MDP5 driver. To let them be handled by the DPU driver pass the
`msm.prefer_mdp5=false` kernel param.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 20ba03e9c936..c8d85a64e16c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1351,6 +1351,9 @@ static int dpu_kms_init(struct drm_device *ddev)
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	return msm_drv_probe(&pdev->dev, dpu_kms_init);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 8a7b44376bc6..b37ebb068dce 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -935,6 +935,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	ret = mdp5_setup_interconnect(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 05fe32c3a4b4..3f6d884c90e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1186,6 +1186,37 @@ static int add_components_mdp(struct device *master_dev,
 	return 0;
 }
 
+#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
+bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+#else
+
+static bool prefer_mdp5 = true;
+MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
+module_param(prefer_mdp5, bool, 0444);
+
+/* list all platforms supported by both mdp5 and dpu drivers */
+static const char *const msm_mdp5_dpu_migration[] = {
+	NULL,
+};
+
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If it is not an MDP5 device, do not try MDP5 driver */
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
+		return dpu_driver;
+
+	/* If it is not in the migration list, use MDP5 */
+	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
+		return !dpu_driver;
+
+	return prefer_mdp5 ? !dpu_driver : dpu_driver;
+}
+#endif
+
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6eeb3517c3e4..4fee19549cc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -571,5 +571,6 @@ int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev));
 void msm_drv_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */
-- 
2.39.2

