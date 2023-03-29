Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEBB6CF660
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 00:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A62710EC4B;
	Wed, 29 Mar 2023 22:25:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A404F10E1A4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 22:25:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g19so9027342lfr.9
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 15:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680128702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvOicm7FSZsvoLM+I7eZyYxaJPBR6NHXblQQPNco0kQ=;
 b=wMNTntBtw3JbTujEgRlvIK1ugsDeViUl3qgk6tzLyCNzeOSCIpPdJlk4I4ZNDMthb/
 AOX3vvAr8/YUaGuvgou1JQShkvM+HTeh9Dlk5BK99T5N5VIENL0fP9By1KEgWziqA4N7
 JzOSptsOGmJwUe+TJyqdNisp45Z9JFoy8z0Vn6BhsVitIrn2STBQY8Rq93pOEjuJo/Mi
 MwxqYbpUW1uhvQ1a5R7vzHPBs0M49qyPDg0l8xTcotdc/jupwSQuhWwVs+POh5EOJYbP
 /TRYVXC7ToT1tP301fMTyzCk7qgy6AFW1JNDonwO9hyngBswFUUaooNEich/MQxDijYx
 v5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680128702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XvOicm7FSZsvoLM+I7eZyYxaJPBR6NHXblQQPNco0kQ=;
 b=oBMBeV6rBDcOnsfMT6Fsl3n+MC/oBtYAIOOUvv5qP/2wTHTla9E4tTeYqNewSVThQC
 YGF6m9wK7NsUkgDovDxEfiiXydDWHpPWxSCXEtxl/VGbkOoFU7+qJqFL/GV9m7pRGDn4
 RgGxIRQm9idOodSS34hoLz6vOOZaCvs4KoNnsowaXwPeLfwpx+bGIMOxqhRO5PoZB+RQ
 Irw8SSParT00C3OcjDUoZ3TFpk9gGkzhLnZWk3EGNq5Ee8KexMursTYRaDDTCMkdT/1v
 JhBJiqDVi4BGq7RsJsAffzrL4YIY5gxqV3K6dWTTvbiNRMp8wEMJ63iUqxxHtYV7OrgM
 YhXg==
X-Gm-Message-State: AAQBX9f9XoWSHOrPXp0/xbwrU07QWutGhwkvnI9tXK0Wj/jlY06hCM1L
 BfyD0K+VJusKhWbOtsrmhLSduQ==
X-Google-Smtp-Source: AKy350Yafz+44RhjayuM2tQER3bgUHCtIb4t+86yGSe52bNOnaGogVbbHxOlWGD5ykjwJGQWJoEEYg==
X-Received: by 2002:ac2:46d4:0:b0:4e8:200:132b with SMTP id
 p20-20020ac246d4000000b004e80200132bmr6084675lfo.62.1680128702692; 
 Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004e9b307d2c8sm4724226lfg.238.2023.03.29.15.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 15:25:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 30 Mar 2023 01:24:59 +0300
Message-Id: <20230329222500.1131836-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 2/3] drm/msm/a5xx: scale MX domain following
 the frequncy changes
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

For some a5xx Adrenos we have to specify both GX and MX power domains.
GX is used to power up the GPU clocks and logic. MX is used for scaling
voltage of memory cells.

In case the DT specifies several (GX, MX) power domains, none will be
bound by the core. We have to manage GX manually. Also make sure that
the MX domain is resumed and scaled to the proper performance state
following the desired frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 52 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 0372f8908202..36b3d11dd5b0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -8,6 +8,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_opp.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include "msm_gem.h"
 #include "msm_mmu.h"
@@ -1053,6 +1054,13 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 	}
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	if (a5xx_gpu->mx_link)
+		device_link_del(a5xx_gpu->mx_link);
+
+	if (a5xx_gpu->gxpd)
+		dev_pm_domain_detach(a5xx_gpu->gxpd, true);
+
 	kfree(a5xx_gpu);
 }
 
@@ -1339,8 +1347,15 @@ static void a5xx_dump(struct msm_gpu *gpu)
 static int a5xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	int ret;
 
+	if (a5xx_gpu->gxpd) {
+		ret = pm_runtime_resume_and_get(a5xx_gpu->gxpd);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Turn on the core power */
 	ret = msm_gpu_pm_resume(gpu);
 	if (ret)
@@ -1414,6 +1429,9 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
+	if (a5xx_gpu->gxpd)
+		pm_runtime_put(a5xx_gpu->gxpd);
+
 	if (a5xx_gpu->has_whereami)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a5xx_gpu->shadow[i] = 0;
@@ -1762,6 +1780,40 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
+	/*
+	 * If the device has several power domain (gx and mx), none are attached by the core.
+	 */
+	if (!pdev->dev.pm_domain) {
+		struct device **opp_virt_dev;
+		struct device *pd;
+
+		/* FIXME: add cpr once it is supported */
+		static const char *genpd_names[] = { "mx", NULL };
+
+		pd = dev_pm_domain_attach_by_name(&pdev->dev, "gx");
+		if (IS_ERR(pd))
+			return ERR_CAST(pd);
+
+		/* GX is required for GPU to function */
+		if (pd == NULL)
+			return ERR_PTR(-EINVAL);
+
+		a5xx_gpu->gxpd = pd;
+
+		ret = devm_pm_opp_attach_genpd(&pdev->dev, genpd_names, &opp_virt_dev);
+		if (ret) {
+			dev_pm_domain_detach(a5xx_gpu->gxpd, true);
+			return ERR_PTR(ret);
+		}
+
+		a5xx_gpu->mx_link = device_link_add(&pdev->dev, opp_virt_dev[0],
+						    DL_FLAG_RPM_ACTIVE |
+						    DL_FLAG_PM_RUNTIME |
+						    DL_FLAG_STATELESS);
+		if (!a5xx_gpu->mx_link)
+			return ERR_PTR(-ENODEV);
+	}
+
 	check_speed_bin(&pdev->dev);
 
 	nr_rings = 4;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index c7187bcc5e90..36e910397c14 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -44,6 +44,9 @@ struct a5xx_gpu {
 
 	/* True if the microcode supports the WHERE_AM_I opcode */
 	bool has_whereami;
+
+	struct device *gxpd;
+	struct device_link *mx_link;
 };
 
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
-- 
2.39.2

