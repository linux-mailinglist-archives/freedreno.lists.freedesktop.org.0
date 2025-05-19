Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF8ABC3A5
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2D10E26A;
	Mon, 19 May 2025 16:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYM430Fh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEC110E26A
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9VVrE015117
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=; b=fYM430FhLVxJMaDy
 AgPdO+hyvSQr5WSg9ggYae2XpEK106SC+4iJKjtvuqCv9WvzN3qOysl3A8PE9O5q
 ivJGs58A69VkpFJPAXdEeoONwzYWV2LTDzauf+VDmHRRQ3L/zhL8n+ZuVCKK3pjC
 g0wY7ws7k1bDxDN0wo3Ze4rdKqiXdGn00jyzfYhi8BW+5GebPkQFOMyg6lbX5cBh
 mfWvIjpAcQv2dYkBwTc2U7hvfRaxlVGM5Uxu94vzq595rWlBes1Cu0PcnfcXz3mb
 KTI48/fAWhBOc/6It438T/H/Q9rg6z9EhqYZDXJ96Ti/CSz3sWlVyqgNT6YxTmEP
 AhbEow==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:03 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-604adec072eso5875211eaf.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670702; x=1748275502;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxsAhzmbg/P7NGo/6NtGUPTBdEk3LlD0vaC4rtyESLg=;
 b=YAvcawEL+IS/lZpiJzZN6EcBdT/Ehw4oX1nyuALiIKF//p8PzeJCYj5tDFnUKMK6F8
 qCKsCxA1lFww7TptOGjoq7QQN904cmZVbPUBqRp5Z8EyuOard1ZTRErsXNbq2GovaaEe
 0gfJaJotSkmjhYhxcfVNGhU7ie2BVUZIBSwP3BcmYHtpAbtTxef1jLQtJIzfUAAm9Lz1
 kUm8g8jo50vz+ILMOBdNSNZeM3dcCa1NyMzt5NHQHR89hDZTOSct0qAkREZAmKV4SGND
 rFrZ2DAdPyjbMBS5oE+aBZBU+hNY14tuzCEPwS7BUOLCscor0RmnfhecZW6Ozl4CeHkK
 vCbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSjGjgKQtLUSV6IhGuLdTGdcSYDmJAglvOblhKgXvZnxtTQKfsCaLsumKdEXgVyGYhORh7AoYvnko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCKLQd04mg+9q6zLMOjXr5fs+ni7AiFqVkzteklO+0zpN1kfEt
 qyckZFBU2Jb4jfASbEvTkgjIkXeF5GaYBHQWm6jcgG8kHELHyEo+mwTmNhjMjBrQkvenqFWGyWP
 KwZPXBufJUlnloQomqBAguGV/jdTYZ4knlvVhJrsH/l3pDy/jRP1kqc/RDxw3fBiyOsGiv3E=
X-Gm-Gg: ASbGnct4O3hy4nPg0V2Pzxaf4HULjOC2tM8S379YAmFGEWD3Uo/SAX2CUV1SLrqkL5n
 IaQm2p+LGr86HF2shzCMWg+snFq1I3DZkviwAydlAQSkYovqymP2rgrpQzZbuaKvy8Jkck/CWrv
 BivLaCAZs4hquFH9OFgxgbUK0xTKFpkXV7m62KwAuUUzz+yDI7cR5O/9qJGnn/OY8d7BUz2trif
 O6XJ7y81SkObJl4UrP7eYYFkB0F7SBV2zkbbU/2eyZ9dwtrJ+ER2ZYKwjvXHLazrncWbqtJIt0P
 zEw3ik9Nsl966PK6DF3VUzZ7eSZINNnOkObfAO0pK/blKAjokHKZCxST8WbHBBviWAAt/eCaXzq
 LH21wtkOpokXV0bJf/Y1fEYYI
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id
 006d021491bc7-60a04acdd3cmr4219152eaf.8.1747670702238; 
 Mon, 19 May 2025 09:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwvHj2FruddFnCv4nLxJa9GiK1OTK+95W3iF8t3mPC1jSm8aD9GiN04PuqB3XzeW/ctRMQ6g==
X-Received: by 2002:a05:6820:3083:b0:60a:4ac:d786 with SMTP id
 006d021491bc7-60a04acdd3cmr4219092eaf.8.1747670701869; 
 Mon, 19 May 2025 09:05:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:23 +0300
Subject: [PATCH v4 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-21-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4709;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9wVY6xHvqDcF33GFzYtwTC0tzUZCiOlueW7vIUDiJZ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8RKKQynCoTPB6vJlgo4GwgcVNdJxg0Qa3e
 W7CRvWrZJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1VB0CACtfgAQgO9mhZoB+Q4ML9ja0Ell8Jpl61IlCmUs4Ms223YjySUUmXyR1Eq+6d5UlBx+RIo
 7/BtL28AjAUAwPmJn6T+Vc6W5b5S/BuYt7uzbZD84VED9hYBnqTcDoELkucasZrUr6IoJTX4W8H
 cGC2IMeRK1qXFbztb2eT15bz7tNalDvK1NfQba2KpJ7bj4NshGtnXSL2eJusIOzJEwWcuwkOeA3
 ROnSgM5ECLvT+BN5g9lk61/PPMRgPezlTH65eDg6/6epXhLmQ5cqLKd9HivAMLnPMBJVUGU7seU
 BdwF7LhdoQQ7I8ZwHWIOBQhNqQgUYhFagD47lSLeKLmpQZzW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qHcVqe9uRi3xmF0JFMChYSetCETzKsLS
X-Proofpoint-ORIG-GUID: qHcVqe9uRi3xmF0JFMChYSetCETzKsLS
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b56af cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xxl3IjUXEjn2PN8_a8EA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/c3pJPkhPHLw
 HD+DjDuzoYM5MuB+TE5CzxZi/Qt5gdjFUHttjYZKisIxp1gWW00JknPGOW1OFB8503wqa7akSxT
 4dqH5evxTmifUwgKi46M8JpAIhyy3H2qd3NquIxNtB9e5Pz8h8wTTOk2wd8C9Gs/xKeEKjA4M5I
 MqSuvNX4TLCz5NiTarKXQrgPMje3lOO0zch4bYs9cGoncALpkCld81z3Pytsj5kgTanDY8/XFas
 NBOJdlX5D353zSC+QUkxhSTtDay1GMgsgkXPk5yPKX/G2F5zEAyz27aSjdxwbM9s+4lN3scKVTy
 /1827uI5huLlSze/GHQ36R4Bco2IDfE8Mda87oOEs5Z3XGXbqs7U9tZtsBlD10dOnL5eDuMayt1
 ofht7vZwjn5vIUYBPodaydDifzXnOqiM1hVqQiK/XnKaUVtEk+Kd9rdmM15JcSqX9NiWExyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4777a4a852da0d65e20cebc31fd05647e0b4c4b2..d64ebc729bfb589bf90af89c094181f879d5b1ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,10 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
 #define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_DIM_LAYER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9ba9e273f81ab1966db1865b4ce28f8c18f750b8..5e4608d10c6d4fee387c9a599a73b15661148430 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -85,7 +85,6 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
- * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -93,7 +92,6 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
-	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 4f57cfca89bd3962e7e512952809db0300cb9baf..3bfb61cb83672dca4236bdbbbfb1e442223576d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -150,10 +150,12 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: DPU core's major and minor versions
  */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr)
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *c;
 
@@ -173,7 +175,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+	if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 6f60fa9b3cd78160699a97dc7a86a5ec0b599281..fff1156add683fec8ce6785e7fe1d769d0de3fe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,6 +95,7 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr);
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d728e275ac427f7849dad4f4a055c56840ca2d23..7bcb1e057b143a5512aafbd640199c8f3b436527 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -60,7 +60,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5

