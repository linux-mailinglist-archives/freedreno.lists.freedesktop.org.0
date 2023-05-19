Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73147709B8C
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 17:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367DB10E123;
	Fri, 19 May 2023 15:47:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98610E123
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 15:47:54 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af177f12a5so23210231fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684511272; x=1687103272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
 b=s0CIF4xac2UjPTjKEWMM0G6/B2lENalmioR9Q4NkHtFTABLRxyqehVYi1JyEEO4+kw
 nhGLIGwAEn5IDCIvifqghwSbbiR/SMLBrxVqd5WIS8UeRnPM/2vocAPo8sFvzDV2xkW8
 g6Entek4hEj4yS0mYpDWltB/77MbguOGHopq/W9i1NRKOwoG133Kpq8BaReFKD5Gcj1D
 F4M/xaSV/AkagYGnjAVzX2ZawA771ESTeQybj6XWaCAiq89qts1AMAfHbtd64c196F81
 O16e2ex9Mv5bpA6odCx70JVP5eSgoau8CzXuoRqj+DdXLc+AY91c+x6rB6LFvWAX89am
 b99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684511272; x=1687103272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZH+xIBGRFydG8VrF7CTkUuT849ThU7IR5DwJqTeGGlA=;
 b=T3ib9uzF7lfYlYXDt2VjD+ZESkFQoQmh+RWbF1Sj0675+fsyBFbSel0KksteC+qe2t
 /8aC8z+r9sbOl1m7zEfL56wN6SjNZuD+p9a8Jl67LLbJ/CuivMy/vY0O4C7/bMuIaltm
 te604FFE9bDA5c+EX9CXSAjjo6l0NJf1nDX/MtPO6kOsHpsUN06qiaR8751+Y9uU8nbi
 sJtaPzwSYgUOvkzgWlV+sgzpTzXcKt5u8qWLBRrhtoWuXzCJoh0d1EAUA2iODlzS1nnj
 fXSg0EVWpdHeyt5Gn+hMozlWV12BJxj7OFFSCdgMxsEKB1Cqo2TuejZ8NaDIKJbKPLBD
 yaaQ==
X-Gm-Message-State: AC+VfDyteXjGUcZLWdgMBW0mWG6mB3r/pwY5orRjGvX0q+atLOIepRtX
 V1JgwGE76LCeybaVjkv9Zmqruw==
X-Google-Smtp-Source: ACHHUZ4dNslyhs4728y0dczzHjTqXB2vGatckk9r6zkGxqoPE6J1j+KDU6zjLeuy4hyUAecv4FR6NA==
X-Received: by 2002:ac2:5321:0:b0:4ef:eb86:b9c7 with SMTP id
 f1-20020ac25321000000b004efeb86b9c7mr873357lfh.49.1684511272191; 
 Fri, 19 May 2023 08:47:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d19-20020ac25453000000b004eff1163c37sm633949lfn.308.2023.05.19.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 08:47:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 18:47:48 +0300
Message-Id: <20230519154750.3929813-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519154750.3929813-1-dmitry.baryshkov@linaro.org>
References: <20230519154750.3929813-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/4] drm/msm/dpu: move resource allocation to
 the _probe function
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

To let the probe function bail early if any of the resources is
unavailable, move resource allocattion from kms_init directly to the
probe callback. While we are at it, replace irq_of_parse_and_map() with
platform_get_irq().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 64 ++++++++++++-------------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ec6fb8634196..23f0dbd2dfa1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1159,33 +1159,11 @@ static int dpu_kms_init(struct drm_device *ddev)
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct device *dev = ddev->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms;
-	int irq;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct dev_pm_opp *opp;
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
-	if (!dpu_kms)
-		return -ENOMEM;
-
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
-
-	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
-	if (ret < 0) {
-		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
-	}
-	dpu_kms->num_clocks = ret;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1203,21 +1181,41 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
-	priv->kms = &dpu_kms->base;
-
-	irq = irq_of_parse_and_map(dpu_kms->pdev->dev.of_node, 0);
-	if (!irq) {
-		DPU_ERROR("failed to get irq\n");
-		return -EINVAL;
-	}
-	dpu_kms->base.irq = irq;
-
 	return 0;
 }
 
 static int dpu_dev_probe(struct platform_device *pdev)
 {
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, NULL);
+	struct device *dev = &pdev->dev;
+	struct dpu_kms *dpu_kms;
+	int irq;
+	int ret = 0;
+
+	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms)
+		return -ENOMEM;
+
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &dpu_kms->clocks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to parse clocks\n");
+
+	dpu_kms->num_clocks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(dev, irq, "failed to get irq\n");
+
+	dpu_kms->base.irq = irq;
+
+	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
 }
 
 static int dpu_dev_remove(struct platform_device *pdev)
-- 
2.39.2

