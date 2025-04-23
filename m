Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A896A99A29
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E385510E2A4;
	Wed, 23 Apr 2025 21:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg5ApkWz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9837F10E2A4
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANhah016814
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kpednNqm8bXeAcXkJ8a3fInkJtUO2IkDThHEQgdQHyY=; b=Cg5ApkWzB5u15fES
 M0GJH/rOf/5xQxkObwfy8nl0EyKnB1bALX475YcFKFVq5lQTLBtVdY0+MPpsor/M
 iyRcZCoGBw42ALXyDtlhnfFcg5qfyS2t/dYo5+VKMtb2RQQsyJv5GE0O1qs++KXu
 NvAgXc86Em6IViUtWQ8DHk7NVB8A4Ek5hNM2W+0YfZ8gO4nG3p3J14NXUN2LmIxE
 227wmF+BpQxJnN30qH2iPsDTBVdakEj7tp9VipEkBH+X5s4uXQjZSOwOSi5aBMT4
 TUH03dLDoa5kp6sIEon2nWq1v/8IUfZBDXBgZg7iEVCy4Ex6WS2WUTqGpRDkGEzT
 1Y+IzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh03dkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0c1025adbso56462285a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442661; x=1746047461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpednNqm8bXeAcXkJ8a3fInkJtUO2IkDThHEQgdQHyY=;
 b=C0nRH4oXnKULA/VebhhQ0yYIiMqjKGgm9JLj41RaGahhi8go8EGP8cHar7VObRi0+B
 ASoKaWxWibDsH1Ic1tMZ7E7WjhAy9AWsPMGVXtGfm1WZcqtOHCVewu4I6zc87dKLT+z0
 uRqXYT3r1I/N81ynsIi460IOSdG4oW3BpQ8DeE79290JUZ77yMdp/sh/qb69kwLNQkwA
 Z+ggUIoir7pJihjQOVAvZxkNcQBynD9kmF+wJjJyUhlY8FCwQsdUQN9HTqnb23Nzmizo
 oT5OcxeSAraFmvXUz/d/pMSngcdMzgGBALdfoxkf+jJywyvsUTHN6mX+BGWB/0+rYBbV
 WHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA35b8wmXmSkUK07LG+pIgjfyA1wZLSwdDAN1lTVHwlo66P0nRO/uEeuDigqnBcJcMCJ5WWzSSUHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHmYivzTJ8shf1mu0xchCctifQma2D8QBx2VoFFAyiGQEpJ8qT
 JRY7Efp0P/vYWE/eUhtdpHLSN6Bdyc1FnPtnAVTznqtRl6BsNRirgAx57cYF8qoSgCBnAr+xPR+
 moaqHirXMgBHusYNWbkmgazKhBi+3sseHjS5f43jikR0O7Nd+mB/acrJ55B7n5lviqZU=
X-Gm-Gg: ASbGnct6KRX/Zvv7f4A/VNJexCfI67gmIO2yunzYvLuhJ/H1KIjog1BWFOjWEP8kG6q
 WVUnwdG+VQZkTrOOvkoGeXRYzBWl0+iATK/zD6FD+oRO1Bwkdgi2xzXrPB7tGnrTOLoWZXwpbIX
 6OXIw85A4cr9BAWD5xjGi8DAFpYunBhn9REbsnSuJqAHaeNZF+POY60S5aLuoPwz4dIbGRdxFiP
 q6rONJ8NrMWdqpH7rsJRnIIk8AySBQUI1Pftw/JIlErGwlJRSVDBiXF+jElrR6lf7Otd+Fh5fL1
 QmhHzFhXcNYES5vsZgYs6ZjDFO8wXimeY3zOmyCMyR/+LvDM3EwuV6hrH1YJX+8WQUyE+f8JagV
 q4Z/SXbg21agQM2Y1es6tIais
X-Received: by 2002:a05:620a:3948:b0:7c7:56ac:1e89 with SMTP id
 af79cd13be357-7c956e8bb31mr53237685a.3.1745442660777; 
 Wed, 23 Apr 2025 14:11:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7bfnjuS07HePr3LlsqK+h9ctfa+kpVnmijx1lavnRWrKXBz0QmPo8dCLOa4pKAs0CaF6R4g==
X-Received: by 2002:a05:620a:3948:b0:7c7:56ac:1e89 with SMTP id
 af79cd13be357-7c956e8bb31mr53233685a.3.1745442660353; 
 Wed, 23 Apr 2025 14:11:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:17 +0300
Subject: [PATCH v2 21/33] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-21-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qx+tWXrswqotBVXqga7C6jCwYmZehbjfGnHTcmUatQs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVct3qirea0FRfWcXU6SZh+pVaeOGVttmDTHq
 G9x+ecs24+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1cfJCACkjMgsmnorrOg22YwIcHL9QW/HybIbdmI4aLPwDtTrI0AIW8376jjps6b4EFdyDceZZcF
 7jo5SAbPHhvsiGWUThUklWgA0qZlTfBWOCKBcZJZeqE76gNBANBWK0arMKf8kMHJ9lsPNVQk6eY
 7+y/4SCq5CWrfGRnrF6biUyyWsASQhpt6o0aWFmgx8acuJ61clAZw8mSR7SZ6N1rhZgQsOnM6Bg
 n2DLzUR5Ycwn/FWgOTlubQFZmayqNxGWPy6or7sJYCzrex4bh8sjOOlIKwFM9CSoAlBfJsoKEei
 j76Vns9xPCPIY0Urx/rf77OF6tj6qaVJY5jOj6AC0YyNjRmw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/4WGZYHvM4HG
 5tb7Fc2DTGW8vHufX8Sp6T63BJrWNnWuVrHyE4RsEW4ttabPJhFK7Uny0Ash/DeWTtPHaH2HbWv
 GBr9g4HYnVrHd4HMKc/wbi5roAZUikvUqTljg1HPoImXNyu+jwmKdpoFYKuhR5AgKXNOUdGLfRG
 Yn3jwpawF6mUyEV44cdkVr3ex+kwzmsI1iN5P3/EmZQT8Y+MHeHuPoiLfG1ROG8EnH8uqYk0nob
 8ib5zLYE0eJtIJriVzmHJVvWYjJEzWmT+syr9Y2iKUT5MkmMBrE83KYpYGRMf4uQ15o6AMUpP2x
 iKLAAKpP/9naEWsDzXiRzvtOpOa8WgJrZNrIkP49so5D8AW0mwwhx9uiSOwfzzUz1JvwNOepjtF
 wlwGBFGwShkpFxrId8tzSavItRADOlkmRjzOG9DyqrfxUp6BcqPx3MGhcUi7uUuIXl9f4xPT
X-Proofpoint-GUID: kweD0i8AhZb7Xx9wZdtkfYtoLV21xDd_
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68095765 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=TQSGqBnpyQA7SagL8QUA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kweD0i8AhZb7Xx9wZdtkfYtoLV21xDd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f205e2c967ddf5f437ac335585d43d75a0623e32..e22ad69e451bb5ed38f056e95b0944fb5c21ec7b 100644
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
index a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5..e1fc6fdd8864b017bec35e448ef15420530e018b 100644
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
index 1ed458aed2bc2c54f6e02acce43d88927100b99c..5d55b246b32f0757281d8743ae2d1a23cc6e333d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -58,7 +58,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5

