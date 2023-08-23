Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A10785860
	for <lists+freedreno@lfdr.de>; Wed, 23 Aug 2023 14:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532B10E430;
	Wed, 23 Aug 2023 12:56:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536A710E428
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bb97f2c99cso87115721fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795369; x=1693400169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Y6oXEiFgF1gxMyLmN/ZkCB3k4CvYtCIpVtWGO1XIK0=;
 b=y9EP5rhic1bMiTrjaOPVpN68n2uFckJv+/VCxX8kH2vdhYeRa9oBt4qzSgyBtgvl2E
 38GH3Enr4f2BzcBVZT3HZcRvu7+yvXs0Zu1JV0VTiZFqeYW1j2+gCxaRpsZxEsrnbmD8
 6RcpqKAH7WWaTS88WKHcGvrKAZ6ZqrskBfnO+pxkHAc7moWcgDvg0yKsH0GXbCjvYU73
 pzZV9pD+hHAKSXDSJnGAAzeLBS6ERwpWDn+0Q1ARhFnmCjB19ZR8ZUag0SeICMJxFu8G
 emyZAodcI9x4on6JFN8prp7fvBsLgfAc968fn4LKH9UUWCTKV8vahaSHn2CytH/P14n5
 MiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795369; x=1693400169;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Y6oXEiFgF1gxMyLmN/ZkCB3k4CvYtCIpVtWGO1XIK0=;
 b=KBr5hxKlq1gt1A/6LFvVoKGYjVzmscmLyRy90KQ7LEy5qFv53pppH8si6pt1js8Ri0
 lw3cIAo+RtxqmkNKeBqhc9g+tG2U3mWbvodtYK6zFpD56URmKZcDhJsC5EiRf8RqWhel
 uwGdHxBQxu9sHh3OaoMFgthHWiHahSERfncpentNkEVcNvtRK8W9XQOUJ6r2T0sQMdfN
 Q7vOkfYNGm8fkWVfARe++FOl+mWEDOxeetNq1vTpAVyiHbs03R9Tir63onvn1V9hhUSP
 nLgpzkt2DEtxMhJmnkGPjTAnscwJofV1GISlikTsfmghvgmz6IyGCa8aWMl2D/6pu57x
 iLgg==
X-Gm-Message-State: AOJu0YzvYvBO8zTKE8hPBP5lowdQsLMii/uv6f4rGnkyvXdf1SKJhu4l
 SDGrPOT8t7RQP0Fn6ltL89MFUA==
X-Google-Smtp-Source: AGHT+IG2madRaT461OA7QLKzrrcPMkROCIRx5j8e33LEtROfB8gmZLqChQ3xbIbg3hUwyg+/8Az+ng==
X-Received: by 2002:a2e:9241:0:b0:2bc:d94f:ad04 with SMTP id
 v1-20020a2e9241000000b002bcd94fad04mr2428112ljg.13.1692795369455; 
 Wed, 23 Aug 2023 05:56:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:56:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 23 Aug 2023 14:55:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v3-6-4ee67ccbaf9d@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=3163;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HVkvMFxPvuII3V8upTEtqhhnpPDyIhSx/4MkgWOmmaE=;
 b=mPEuUOfs785ZNrbS79j8jjeVQyFCSIK2caSQHFXXiOx/tsSZgsrKndNowihPJ9StmD6qNx0a4
 hJsNqRWuVOfBqxlszJgA2VFHbmu7TG8jdrn8dz/6dUpPfB2MQCJTnaq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 06/10] drm/msm/a6xx: Send ACD state to QMP at
 GMU resume
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The QMP mailbox expects to be notified of the ACD (Adaptive Clock
Distribution) state. Get a handle to the mailbox at probe time and
poke it at GMU resume.

Since we don't fully support ACD yet, hardcode the message to "val: 0"
(state = disabled).

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 75984260898e..17e1e72f5d7d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -980,11 +980,13 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	dev_pm_opp_put(gpu_opp);
 }
 
+#define GMU_ACD_STATE_MSG_LEN	36
 int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	char buf[GMU_ACD_STATE_MSG_LEN];
 	int status, ret;
 
 	if (WARN(!gmu->initialized, "The GMU is not set up yet\n"))
@@ -992,6 +994,18 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 
 	gmu->hung = false;
 
+	/* Notify AOSS about the ACD state (unimplemented for now => disable it) */
+	if (!IS_ERR(gmu->qmp)) {
+		ret = snprintf(buf, sizeof(buf),
+			       "{class: gpu, res: acd, val: %d}",
+			       0 /* Hardcode ACD to be disabled for now */);
+		WARN_ON(ret >= GMU_ACD_STATE_MSG_LEN);
+
+		ret = qmp_send(gmu->qmp, buf, sizeof(buf));
+		if (ret)
+			dev_err(gmu->dev, "failed to send GPU ACD state\n");
+	}
+
 	/* Turn on the resources */
 	pm_runtime_get_sync(gmu->dev);
 
@@ -1744,6 +1758,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto detach_cxpd;
 	}
 
+	gmu->qmp = qmp_get(gmu->dev);
+	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu))
+		return PTR_ERR(gmu->qmp);
+
 	init_completion(&gmu->pd_gate);
 	complete_all(&gmu->pd_gate);
 	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
@@ -1767,6 +1785,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 	return 0;
 
+	if (!IS_ERR_OR_NULL(gmu->qmp))
+		qmp_put(gmu->qmp);
+
 detach_cxpd:
 	dev_pm_domain_detach(gmu->cxpd, false);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 236f81a43caa..592b296aab22 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -8,6 +8,7 @@
 #include <linux/iopoll.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
+#include <linux/soc/qcom/qcom_aoss.h>
 #include "msm_drv.h"
 #include "a6xx_hfi.h"
 
@@ -96,6 +97,8 @@ struct a6xx_gmu {
 	/* For power domain callback */
 	struct notifier_block pd_nb;
 	struct completion pd_gate;
+
+	struct qmp *qmp;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.42.0

