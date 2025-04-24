Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B625A9A7C5
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DF210E794;
	Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDz3cGJC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA62110E795
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FMKl006306
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=; b=ZDz3cGJC4SU2atd9
 vr2Vys2AfbDJ8Wu3xqMDIjMfhfWIpejh/B5deVLJSBemUivPZuSS32jgTz4jzFRA
 fuHaOfn85E7c1LU8+AX/pU0QDKG4mQ2kgWWDLFjNt13gAokLLb9FBLXf0cG4JHNw
 C3DulBIV+JGn+FitBe22LRp4mBQMRI9OhScKkwFA7P9RdKA+wE7r7HaYRoLxYCIC
 MS+tnMfS4IXL3u3Ffpw5xrOUveuBzJWYSlKaU+v6nUWXmq/ojPXeBToLlJHbmVZl
 M3dTEKwl958C+Fct037tjGxxV47Mzz632jLwrSg2fiZHqkGmyNacfcOKfRNZ2lEj
 Nloe2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0502e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ed16cc6e39so15766916d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487035; x=1746091835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=;
 b=u9hGBRXf91rJ974RaTj///QWGw6/xr9YN2hsk8w2Tk1wDUlktLkCJwPKpgbpQgTp5p
 1MgaktWbC//UVle2Inad/16HTOmI4QVr2COWYULGbu1S2g+iRZMSIR5YnbIRImw6CNt9
 46fYrB/T4xnPxV94q+wiLywHp323WxUhlh7To2CKYlN7oYGiz79RmbZkvyIVLFizbrkr
 2uZZ0qVCjZbAWzs/lb3+8ubPNjsVpCwWbsjnvxb3nMd9EaQmS86xRb0z89uCNGuhhY+x
 iDbGOud/T+tW6QjCC0HvYMNHKZcuftHkbNDG3BKC2kxQgRwW0rDaTehGahms8srK73uH
 qKqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8GpJxZHN6C454zDe0OF39HNMam98optwXRirXeBuCmcnkB4J4yczdHQCYEwDAlX+LfqctszHEl6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+qcs2NVruIfNKRL2y+Ncspf0uCsScaVG3sAAlVOxkIEjmX3Ne
 hf+8SXYlLb5JZrel5/TjQktncw3sFICtfQeo/XDCvJjlFwjndjP0K10F2jUbss5dCTuH8OwQeNn
 ffYzg6PlQv+7I7z5v/R93cOLVhSssGV1gLmpE1igXhk/jetj4G21gU0W2CBqYpbVOUTE=
X-Gm-Gg: ASbGnctEhymcwq8K4Ef9/vOlJq1RwI6ia9wyN4G2CdIrkDS3I9V1snGxngJV2lBiSxA
 bSv/99RejySaBkobdKPivcr3/noukJ9FAdgfSius6/7XkPajaBOeOIvlXU9A5U1n2QQWnoHTmJR
 d1G2zyqxq5pQfYR35q/LKkJDFFUMvoJXaL0i16li78A8Z2r9OwpgOpNpl+qUA7nS6tJlVhjSVzf
 MKDi67/+vnvAZk2eLiA+q6ssF7KHZu70RfB2ePuK1dPKQpZ0SRhF5coYyMtBN0xYN1NJh1p2aiA
 RrAQ0B8RXW8gTTOp/sG3yZnomCy6SyqgsN06JA9+yrbJbGtAPdWXjQ48/7VaU5gG+UuUfMvVFbN
 6Z1NC6WwclxTO5dnzFM9n8xjz
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id
 6a1803df08f44-6f4c21bd1e7mr13179256d6.29.1745487035123; 
 Thu, 24 Apr 2025 02:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxCZuAnggMj3l1bp3VhBBdZn7SikDu72aqo9cVDnc9ZZvE7kzgKSO3dAMP++P4RQGtn7Gcdg==
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id
 6a1803df08f44-6f4c21bd1e7mr13178936d6.29.1745487034802; 
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:10 +0300
Subject: [PATCH v3 06/33] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-6-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqFUrxRR+NGyuOJa9iZPcU0YKALTABfDjex
 qvwvQQi4leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1f9cB/9gxIKyI+sJgil0eeT2ElX+Lg5NIqskYAtVXvqVFJrBFsxc7bM2fNfy/yAca75ktCpEQGT
 izFMD4d0TVSymz2DVDCTr8jEmFsNT6kTr4sYeHW64rvRuROHHxVtFhxii8TzzdWMx0eFFTFIYcy
 Z1cl0mNA9N7Uca5rf08k5HCjBPcRDi0eMV+eFzutkJPuXowU4tFGV6laG7uZKX60fFtqJATjwvZ
 XvUWYDl/7slG3eyAl8tquvIeK7yxE99hvbOiq+GS4jfB02o3qE16b0EpAajL3RsQwUl8320zhd6
 qBL2Emz3OpptOvvBoq8gQ1TAeI4jGBD271WmlGZsFuESOJgQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXxluV17OKn7t6
 2cjd0NmwqGGeu+gtdOZTCfVwvTrPz6BAUmZmPCVpuAF3PILxsCCf7lgVB17lXaYLEZkt5z8/o/W
 lX9jIf8P/8bitKisbn8AmGD+IHmYvyF+rCQsamOQVwr3SFLnzg/XThICVkIvcLGsGzp5PWCMLZl
 QGDpqOUgfC6LqZWHgc/YVo02U9s5yp67EoJUJwgS4pBAmC6Y3xp6c+Q66GzwwHkbaVaPvj3Jpcw
 3KKWDuZduwW8DUYGPpfd4vEn4+K/OS4KOvB19RUpzjez51Vkj435ilS+O1t66OeDb5DBe2zVSj1
 j/Y5V1k04/uLmNd/gmU6qPMozfBgfsqJpMVxscdHO8N7wHHTZCPyJtRpuDGEOnONA5sB59SOiVW
 s/Ej6r+EOtVUTW0lB+g+8cP0WkdHn9p+5wtTAASKFVlfgnmrmeSuUxokFOvYRsFw3dLHcdQB
X-Proofpoint-GUID: DiYNXb5En5d55E1dZaKL-EdggtbHRdRl
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DiYNXb5En5d55E1dZaKL-EdggtbHRdRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

