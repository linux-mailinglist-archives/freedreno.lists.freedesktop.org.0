Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7DEBAB878
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B2D10E4F2;
	Tue, 30 Sep 2025 05:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0WXB33w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8714010E4F2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I0HH013362
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +TMfwqBVNsoooULWL26HHwCnCoYFc+lDZgcTxICh5n0=; b=Z0WXB33wNvEaeXJ5
 4B49nMSGxUe4/JUP8T0Djfh4XgUw9Q7HIJi6estWR8Mm/Xqzkj+TgG/zDP0UtOgV
 WPQe6pzllG+T5Fp7XbN/BxBccHVVUo54tAEFsirOWmNq5valFE7aUjLBqJ1225k+
 u7zlDq7EvqId+O4wKkcOY/lDQX++2MbQ8rLZlEp4myeb77Ni0qqKJjuiBRDSVGZw
 TCQLaky93CeMmJsx2mnQFyQGGTeo1rc+aFzEzTbayyDZUw7S1V/b2UPZ5SCQLdvn
 z6vftSJknTGEoz5wChk9HQjRbE8SyjtW/v3hKZPVkYMdaSC9Y/O+l97yND99pz3x
 vDfBwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5ysua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3352a336ee1so8479181a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211434; x=1759816234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TMfwqBVNsoooULWL26HHwCnCoYFc+lDZgcTxICh5n0=;
 b=qTL7mosMI+1PvO+3+X18foaV/9Kr3A9R8/FtYd/KCucp1tZYhRI9x8vy3RyNH+I8Pq
 Vv7SB6M2YS0/LpVWg/0f4phqUuTJCyD8j39v6c0Bpxk6ysd+bP3VvD5qdDkTa8DubsyG
 JTxPPiSpsXxV+jAiLm05sMTf0ZoVfJ0y/qkSn3xrW2XVLF29AKXw7MWwGn9eocYqmZlH
 BJUEu4xvM+rA3csujKCiRVJgzOBmGzBheuXnF2/K/Y8o37/13kHTr/fj9gzPO4woDwC/
 dMn1fLscZZnoZTsdKczJ/bgLFti2W6HpuQkJoiKQc75+268UjqCo1QRMklJMw/zByohS
 JRVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWRIefsVVhl+hFbvBtDHOZRrVJUYXcp/Lw89KK2bIvNByM3iswFYXS0pr4vopsvlr9usGS/PO9imM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0oXo+bm0qAqkyDPzgQzOUA86TN7GJnk43WtfBershqnsF7ZKP
 /xxBqxuntageg//mGt5wsOfW1rxgJXTXeGoFgOl2LpOuBJt9eUlvlJhBudeRtK3zD9C/D07byu1
 da9SxY0V83ceYud7Z3Ml1k5kpq3wzQJ5gBrnUs1xA5ncfqmabuVXVgI8S0YDiQ/veaXFpbhk=
X-Gm-Gg: ASbGncspYR4W1bkSeF7cnkRALMhV3ozkrvDHjIP44nHYaEuWK7DjFgkpqOgB1lXi0dD
 YSkj+FOBlhYmwutnMVJ09naNBLR4oWzhJqsU+lvMB1kRY8SOdCdU93f1UGI+oWRt16/Fsju8IXh
 +GM4RWPdRQPzciB0mzkXYGAzjp1z0INOOT5ZjAi40YcdtX6er3HrrUqltfSvkmymnoSC0Ma8tq8
 qhrZPVhcSocJ9M3qBupH5Lum1aT99Zlo1rsge2kYICmQu40Vvc4c4aPv662oCueSlat4JKOj493
 bk3lgpKsgTx/RvkhhhiM7Hy9KkQl6oA2rUh+4BAu9u9hagJz9872llIt9zY/zeUfstnvSg==
X-Received: by 2002:a17:90b:1b0a:b0:339:9f7d:92d4 with SMTP id
 98e67ed59e1d1-3399f7d939bmr236494a91.9.1759211433256; 
 Mon, 29 Sep 2025 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaCTBtUrhhbzvOmy9HcoVtLNHKwEGqyCD8NlzEvulIp53hxBBfRL24pKxKDgkONEikaKkDQQ==
X-Received: by 2002:a17:90b:1b0a:b0:339:9f7d:92d4 with SMTP id
 98e67ed59e1d1-3399f7d939bmr236441a91.9.1759211432604; 
 Mon, 29 Sep 2025 22:50:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:11 +0530
Subject: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=38354;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1h/ZYL7OrWGO0b0ghINUBL9hkt/uQGgcM5FHsnH3EPc=;
 b=8VOwA5Q8crBkPPGBh1srPFIgb6lSeKXDfTJqZ/mo1ma3L5b9xgDWeo7sZpkPKbQczR+26NT7N
 24sEXL2zdRtDXoXBWazxrg2TA4DbjW0jExN7L5nfkwDNS1amwLqmAJh
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68db6fac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O4qxPYOFbdPICiyWFDUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LKA5EorPk5FNVAyzrhdlw8cYp7xFQagU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX4ADQSueyhGej
 UbMoPQLlAtOXFM9W6zd0tVi12f8v9LH2cyPsXsBIhdmZ8yl8pNDGl93iA/2orMXuAc7UYu95mel
 IuWA2HIyv5GCkq2ZoXKE+SBN7Ely/i999WXtHeQIKWl2N3rmqxywRwMa7D8jQTR2axIYJy9AGdG
 3AV/c8/wxSjzNGGi1JIrV+LYWjjC4nK02etCHhR20yflYi3KD97x0dNzjD5H/L/hQrtXmxgccvz
 +Lce/BegjaAF28+QQaNXCd0bYGBmt54H6/WN2bRYYfTAqdHpWyzanHM88SQV+uZalKOUvca97H/
 P7aWnFB59gQxYsDFrAoa4+ii2/7ENNHfymSTTlQM3DYx8o/tHGQNgFzZNZLigwBFMzkkZ0QaxnV
 qW0x2C3Wu7x7YoNftzi/W9P6i5zRCw==
X-Proofpoint-ORIG-GUID: LKA5EorPk5FNVAyzrhdlw8cYp7xFQagU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In A6x family (which is a pretty big one), there are separate
adreno_func definitions for each sub-generations. To streamline the
identification of the correct struct for a gpu, move it to the
catalogue and move the gpu_init routine to struct adreno_gpu_funcs.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
 12 files changed, 275 insertions(+), 262 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -8,6 +8,8 @@
 
 #include "adreno_gpu.h"
 
+extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
+
 static const struct adreno_info a2xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
@@ -19,7 +21,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}, { /* a200 on i.mx51 has only 128kib gmem */
 		.chip_ids = ADRENO_CHIP_IDS(0x02000001),
 		.family = ADRENO_2XX_GEN1,
@@ -30,7 +32,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x02020000),
 		.family = ADRENO_2XX_GEN2,
@@ -41,7 +43,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a366e75acddbacd4810d7b7a80926f..7082052f715e69f1643860a5cce1c84aa4df5935 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -486,39 +486,18 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a2xx_hw_init,
-		.pm_suspend = msm_gpu_pm_suspend,
-		.pm_resume = msm_gpu_pm_resume,
-		.recover = a2xx_recover,
-		.submit = a2xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a2xx_irq,
-		.destroy = a2xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_state_get = a2xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = a2xx_create_vm,
-		.get_rptr = a2xx_get_rptr,
-	},
-};
-
 static const struct msm_gpu_perfcntr perfcntrs[] = {
 /* TODO */
 };
 
-struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 {
 	struct a2xx_gpu *a2xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	int ret;
 
 	if (!pdev) {
@@ -539,7 +518,7 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = perfcntrs;
 	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -558,3 +537,26 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a2xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a2xx_hw_init,
+		.pm_suspend = msm_gpu_pm_suspend,
+		.pm_resume = msm_gpu_pm_resume,
+		.recover = a2xx_recover,
+		.submit = a2xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a2xx_irq,
+		.destroy = a2xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_state_get = a2xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = a2xx_create_vm,
+		.get_rptr = a2xx_get_rptr,
+	},
+	.init = a2xx_gpu_init,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 1498e6532f62c707754502c713b3bcc60a3c1478..02a9729756de8fb59541f57c715b5661be7d3dac 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -8,6 +8,8 @@
 
 #include "adreno_gpu.h"
 
+extern const struct adreno_gpu_funcs a3xx_gpu_funcs;
+
 static const struct adreno_info a3xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
@@ -18,7 +20,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
 		.family = ADRENO_3XX,
@@ -29,7 +31,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
 		.family = ADRENO_3XX,
@@ -40,7 +42,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
 		.family = ADRENO_3XX,
@@ -51,7 +53,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
@@ -66,7 +68,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03030000,
@@ -81,7 +83,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a3xx);
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index a956cd79195e0e13d6b2a1920b15e9aa12f1d060..f22d33e99e815ab3da0296366a91f5c6e9f918ec 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -508,29 +508,6 @@ static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a3xx_hw_init,
-		.pm_suspend = msm_gpu_pm_suspend,
-		.pm_resume = msm_gpu_pm_resume,
-		.recover = a3xx_recover,
-		.submit = a3xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a3xx_irq,
-		.destroy = a3xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_busy = a3xx_gpu_busy,
-		.gpu_state_get = a3xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a3xx_get_rptr,
-	},
-};
-
 static const struct msm_gpu_perfcntr perfcntrs[] = {
 	{ REG_A3XX_SP_PERFCOUNTER6_SELECT, REG_A3XX_RBBM_PERFCTR_SP_6_LO,
 			SP_ALU_ACTIVE_CYCLES, "ALUACTIVE" },
@@ -538,13 +515,14 @@ static const struct msm_gpu_perfcntr perfcntrs[] = {
 			SP_FS_FULL_ALU_INSTRUCTIONS, "ALUFULL" },
 };
 
-struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 {
 	struct a3xx_gpu *a3xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -569,7 +547,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = a3xx_registers;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -613,3 +591,27 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a3xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a3xx_hw_init,
+		.pm_suspend = msm_gpu_pm_suspend,
+		.pm_resume = msm_gpu_pm_resume,
+		.recover = a3xx_recover,
+		.submit = a3xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a3xx_irq,
+		.destroy = a3xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_busy = a3xx_gpu_busy,
+		.gpu_state_get = a3xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a3xx_get_rptr,
+	},
+	.init = a3xx_gpu_init,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
index 09f9f228b75e086d09f41b858a3d43dd7da6284d..160d86870568edfcd2aa335b1b7c1d71c4673eae 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
@@ -8,6 +8,8 @@
 
 #include "adreno_gpu.h"
 
+extern const struct adreno_gpu_funcs a4xx_gpu_funcs;
+
 static const struct adreno_info a4xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
@@ -19,7 +21,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
 		.family = ADRENO_4XX,
@@ -30,7 +32,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x04030002),
 		.family = ADRENO_4XX,
@@ -41,7 +43,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a4xx);
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 83f6329accbacee076a583bdda9816e1cbcdfb59..db06c06067aeb2cf3e2b5da7b36cac2bc31a7bee 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -627,37 +627,14 @@ static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a4xx_hw_init,
-		.pm_suspend = a4xx_pm_suspend,
-		.pm_resume = a4xx_pm_resume,
-		.recover = a4xx_recover,
-		.submit = a4xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a4xx_irq,
-		.destroy = a4xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_busy = a4xx_gpu_busy,
-		.gpu_state_get = a4xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a4xx_get_rptr,
-	},
-	.get_timestamp = a4xx_get_timestamp,
-};
-
-struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 {
 	struct a4xx_gpu *a4xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -680,7 +657,7 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = NULL;
 	gpu->num_perfcntrs = 0;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -726,3 +703,28 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a4xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a4xx_hw_init,
+		.pm_suspend = a4xx_pm_suspend,
+		.pm_resume = a4xx_pm_resume,
+		.recover = a4xx_recover,
+		.submit = a4xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a4xx_irq,
+		.destroy = a4xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_busy = a4xx_gpu_busy,
+		.gpu_state_get = a4xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a4xx_get_rptr,
+	},
+	.init = a4xx_gpu_init,
+	.get_timestamp = a4xx_get_timestamp,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index b48a636d82370ec78e2869e9d5fa96c5c9f90a95..4ea5702824f273d64666c9c6dc63c975b940d538 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -8,6 +8,8 @@
 
 #include "adreno_gpu.h"
 
+extern const struct adreno_gpu_funcs a5xx_gpu_funcs;
+
 static const struct adreno_info a5xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x05000500),
@@ -21,7 +23,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
@@ -38,7 +40,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a506_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
@@ -55,7 +57,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a508_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
@@ -72,7 +74,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		/* Adreno 509 uses the same ZAP as 512 */
 		.zapfw = "a512_zap.mdt",
 	}, {
@@ -89,7 +91,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 * the GDSC which appears to make it grumpy
 		 */
 		.inactive_period = 250,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
 		.family = ADRENO_5XX,
@@ -105,7 +107,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a512_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
@@ -127,7 +129,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a530_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
@@ -145,7 +147,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a540_zap.mdt",
 	}
 };
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 4a04dc43a8e6764a113d0ade3dee94bd4c0083af..56eaff2ee4e4b82b55530ac818c88f0d248a1942 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1691,34 +1691,6 @@ static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A5XX_CP_RB_RPTR);
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a5xx_hw_init,
-		.ucode_load = a5xx_ucode_load,
-		.pm_suspend = a5xx_pm_suspend,
-		.pm_resume = a5xx_pm_resume,
-		.recover = a5xx_recover,
-		.submit = a5xx_submit,
-		.active_ring = a5xx_active_ring,
-		.irq = a5xx_irq,
-		.destroy = a5xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = a5xx_show,
-#endif
-#if defined(CONFIG_DEBUG_FS)
-		.debugfs_init = a5xx_debugfs_init,
-#endif
-		.gpu_busy = a5xx_gpu_busy,
-		.gpu_state_get = a5xx_gpu_state_get,
-		.gpu_state_put = a5xx_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a5xx_get_rptr,
-	},
-	.get_timestamp = a5xx_get_timestamp,
-};
-
 static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
@@ -1751,7 +1723,7 @@ static void check_speed_bin(struct device *dev)
 	devm_pm_opp_set_supported_hw(dev, &val, 1);
 }
 
-struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
@@ -1781,7 +1753,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	if (config->info->revn == 510)
 		nr_rings = 1;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a5xx_destroy(&(a5xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -1806,3 +1778,32 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	return gpu;
 }
+
+const struct adreno_gpu_funcs a5xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a5xx_hw_init,
+		.ucode_load = a5xx_ucode_load,
+		.pm_suspend = a5xx_pm_suspend,
+		.pm_resume = a5xx_pm_resume,
+		.recover = a5xx_recover,
+		.submit = a5xx_submit,
+		.active_ring = a5xx_active_ring,
+		.irq = a5xx_irq,
+		.destroy = a5xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = a5xx_show,
+#endif
+#if defined(CONFIG_DEBUG_FS)
+		.debugfs_init = a5xx_debugfs_init,
+#endif
+		.gpu_busy = a5xx_gpu_busy,
+		.gpu_state_get = a5xx_gpu_state_get,
+		.gpu_state_put = a5xx_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a5xx_get_rptr,
+	},
+	.init = a5xx_gpu_init,
+	.get_timestamp = a5xx_get_timestamp,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 44df6410bce17613702d7d04906469de4dd021b5..06dc5343e8fead56c3c95c704700c1956bd0f9bf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -11,6 +11,10 @@
 #include "a6xx.xml.h"
 #include "a6xx_gmu.xml.h"
 
+extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
+extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
+extern const struct adreno_gpu_funcs a7xx_gpu_funcs;
+
 static const struct adreno_reglist a612_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
@@ -683,7 +687,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = (SZ_128K + SZ_4K),
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gmuwrapper_funcs,
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
@@ -716,7 +720,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -747,7 +751,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -774,7 +778,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
 			.gmu_cgc_mode = 0x00000222,
@@ -797,7 +801,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -822,7 +826,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -847,7 +851,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -873,7 +877,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a620_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a620_hwcg,
@@ -896,7 +900,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a650_protect,
@@ -933,7 +937,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
@@ -953,7 +957,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
@@ -977,7 +981,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
@@ -1003,7 +1007,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
@@ -1022,7 +1026,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a660_protect,
@@ -1045,7 +1049,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
@@ -1072,7 +1076,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
@@ -1091,7 +1095,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
@@ -1426,7 +1430,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gmuwrapper_funcs,
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
@@ -1452,7 +1456,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
@@ -1473,7 +1477,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
@@ -1507,7 +1511,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
@@ -1548,7 +1552,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
@@ -1581,7 +1585,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4be0117c3ab1d56dc81b43ff00e3cc48b02b080f..63aa3f8205085441c7cf8d391befacacd3aefc32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2527,104 +2527,7 @@ static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *i
 	return 0;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_gmu_pm_suspend,
-		.pm_resume = a6xx_gmu_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a6xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-		.gpu_get_freq = a6xx_gmu_get_freq,
-		.gpu_set_freq = a6xx_gpu_set_freq,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
-	},
-	.get_timestamp = a6xx_gmu_get_timestamp,
-	.submit_flush = a6xx_flush,
-};
-
-static const struct adreno_gpu_funcs funcs_gmuwrapper = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_pm_suspend,
-		.pm_resume = a6xx_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a6xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-	},
-	.get_timestamp = a6xx_get_timestamp,
-	.submit_flush = a6xx_flush,
-};
-
-static const struct adreno_gpu_funcs funcs_a7xx = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_gmu_pm_suspend,
-		.pm_resume = a6xx_gmu_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a7xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-		.gpu_get_freq = a6xx_gmu_get_freq,
-		.gpu_set_freq = a6xx_gpu_set_freq,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
-	},
-	.get_timestamp = a6xx_gmu_get_timestamp,
-	.submit_flush = a6xx_flush,
-	.feature_probe = a7xx_gpu_feature_probe,
-};
-
-struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
@@ -2635,7 +2538,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	extern int enable_preemption;
 	bool is_a7xx;
-	int ret;
+	int ret, nr_rings = 1;
 
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
@@ -2674,13 +2577,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	if ((enable_preemption == 1) || (enable_preemption == -1 &&
 	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
-	else if (is_a7xx)
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
-	else if (adreno_has_gmu_wrapper(adreno_gpu))
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
-	else
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+		nr_rings = 4;
+
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -2727,3 +2626,101 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	return gpu;
 }
+
+const struct adreno_gpu_funcs a6xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+		.gpu_get_freq = a6xx_gmu_get_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
+};
+
+const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_pm_suspend,
+		.pm_resume = a6xx_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
+};
+
+const struct adreno_gpu_funcs a7xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a7xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+		.gpu_get_freq = a6xx_gmu_get_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
+	.feature_probe = a7xx_gpu_feature_probe,
+};
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 28f744f3caf7c59412aab06f912cd09a01e185ea..cb4113612b824ac49ef452bbf47ebeda6d188366 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -235,7 +235,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	priv->has_cached_coherent =
 		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
 
-	gpu = info->init(drm);
+	gpu = info->funcs->init(drm);
 	if (IS_ERR(gpu)) {
 		dev_warn(drm->dev, "failed to load adreno gpu\n");
 		return PTR_ERR(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 5abe442637e321fb996402fd833711f0a948e176..f5e23e0022060a726377faca125d57c7553c8493 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -71,8 +71,11 @@ enum adreno_family {
 	(((_c) >> 8)  & 0xff), \
 	((_c) & 0xff)
 
+struct adreno_gpu;
+
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
+	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	int (*feature_probe)(struct msm_gpu *gpu);
@@ -103,7 +106,7 @@ struct adreno_info {
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
 	u64 quirks;
-	struct msm_gpu *(*init)(struct drm_device *dev);
+	const struct adreno_gpu_funcs *funcs;
 	const char *zapfw;
 	u32 inactive_period;
 	union {
@@ -675,12 +678,6 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 	OUT_RING(ring, PKT7(opcode, cnt));
 }
 
-struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a3xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a4xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a5xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a6xx_gpu_init(struct drm_device *dev);
-
 static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 {
 	return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);

-- 
2.51.0

