Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABEAC13E8
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353B10E8C0;
	Thu, 22 May 2025 19:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlcOUh93";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0611610E807
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGCJjU024764
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NYnzMBmIWlsfdGw4huDhs42iPHpQ0FxmQDjZ9WoLD+M=; b=IlcOUh93lYezYwvr
 LnNaooikxqLqZqK0nhWYlqBtp0+KvJzGWnuKiKwhst3hTiI66DCT0nk3OA7UbiAs
 Um5saEQowaO6UfWHo3vtnoZ5+Cbnq/EOJ+noo2V3s5k1hv69GN5U5uBBXVF2D8f1
 6KxUQ80fbK9agHdRqmFBmhtNyjWedxvEOg6xNg2IYra2bULxcs93gcwCPF782DNH
 WKsLuXZqqCBCvkAHVDS+LQu9PByl5spGMeVIHm9J7Lzm+yvQGVPCj19VEJAIoKoi
 vF4xNLaIDznvSYo3nYGar1+j09lEHStHoUDhFiCV5MWevr03FkQdY7ccRzVavT54
 m9xPYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4ycxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e703so1412350385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940623; x=1748545423;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NYnzMBmIWlsfdGw4huDhs42iPHpQ0FxmQDjZ9WoLD+M=;
 b=PSiqjEu7vmqm5HU5KO3XQDZLgBEz3QJUB1NBNGKYDJJu8T4J5hJFdTqFJhkOvoNazW
 gUl1Nt+fb37drG4/UvKld2qlHGiFCGAv2Dk4Tj96raczpwIlIUx37IDIUqr/YkvWftuk
 LHWxzOfY+cXhnhJ868eM3B7VFWyKcjMnMO4bwXSXtONi28f6of2BIkyPPz8Fb9hZp7Rf
 SbBEggUsJugKG2xxKt7Dhn5bGa8J+fubvAw9v+lO3Ux4CaRDFayWbgYNzRsNgA0ZHrjD
 dRZRYagz7jPBKpXF224nf/Tj2xXP0V64Rgy2v7zT+wnbZxNPJ3dlBpIWoFYFgZmaowJd
 aPYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBABz+db0qDjvLLDsfzvPBHMk1wMEjkBfEkK0DP8FaLRw2KFe0Kh4C+JbNN0rR9l3NL1F2UsoUnSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAXzSFlyBVbYNALxWJPQ1RAEJIi9vFDQ98K09ZCdH2bOCxBgIF
 apohJYC4bkg3ZopythQPZT1DP39uqnqxRy14WH7FvhIJ23L9IFSjtopoOCesPbEe+HH5L/6qvJo
 CWf2yNGKUZq4BpMbciqWLLjSbaI7qFFg8LKwOLObh9pbccubCGqV2cSCX9vCkYgYk5jr2oBk=
X-Gm-Gg: ASbGncvZxQ5gFBCHpkVZCDhLL7uMuyQadSdGEP5KuOOYnz8qoJWNV5Wobhq523h5Cl1
 oeNzLL6v34PCQxfGLMzNX65yHUHGBAANwlru3DlzOnqYvUUxFViIT2cHzGmkf0VK/Yk/r9oBKAR
 HQUkB4AcFWN9FWITHyW3mqQnP2vM6m5jPa71KNbtNxN6sY8WWuk6kRkkhPRFapJwkZJsoTkUKRv
 mvI7oMG99Nx9jVDrrai77/oI8MXFDFFEh8XLxIfalTVzsH5eplqlYbfGt13kiaE078ZxH4z6N5R
 OBKhHjHH3qjvSoAEYRaJCVPjLIEJtGEBEA6B0F+zPHdLjkjVTIIFmhsO5EYni0JfXmxDzFiRMBb
 rfpQDDUd6JGcnIJnBlXWIyvp4
X-Received: by 2002:a05:620a:1994:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7cd47fef371mr3705858985a.56.1747940623639; 
 Thu, 22 May 2025 12:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6nclAd8Oh6p4d0w/pm4oPMdyXdN0sNQ9apgHVbjhlRv2lU1Ok/VlbVzdZAx2HRmhRyJKCKQ==
X-Received: by 2002:a05:620a:1994:b0:7c5:9a1b:4f22 with SMTP id
 af79cd13be357-7cd47fef371mr3705854285a.56.1747940623235; 
 Thu, 22 May 2025 12:03:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:25 +0300
Subject: [PATCH v5 06/30] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-6-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0zH0+x9BjgKXdk/u2Bzaxpf3wDWrsUR19FXOhuXrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8kb8nDY5+e9egcdsa0xvZpYX+N37LDMokn
 E4Ml7Al2TeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1Td2CACR2bs5yQxdsmKpKEl3FQ+iiWkJS1b4rtxw0v6U0zh6ysU6ub9bMGofPrwEt+qhEbKUirz
 Vse7z/3QA26rziYAGFobQqS0hSd+LZUEQ3nL3YaVZNc0GdDvcr09AZVkhmA56F5mJaseZpALdGF
 5SAMKJy5a7opD/LrJdr/v9iVb6pfEHsUubcXYhymk1AhdzUimgKqf5ULvgzqXuuAI0s4rd0UPGh
 +e6JIz4dWaUTyJqTSfgKQ07ocWf5IQ6czZtYqbH5rVnQd8JIQ+iFNqU/JYMPF8kyFKaOrDDGpPd
 AmczS+Bi5sZLavW7Q3h3FrCdzlWQXhKKMBqb6aUMvdf93tKL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Dvtih9Q9Qt-2ClSfSEdt7Ruy4zvvzH4c
X-Proofpoint-ORIG-GUID: Dvtih9Q9Qt-2ClSfSEdt7Ruy4zvvzH4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX4aKYaj0N9fMP
 u+SW2OoVGnvmv/7EuHCvIdnWFJWmQzWwSwNhhwMukvU5JL3u7Fl6C5gV4iP0SrwUXrqNTiM31o1
 wZmI/nwwr3Iway7nixUi7AKCk77o9F5FVIXpG6ZnMtMzhQbGLvoghrXhzTV+mKLsbamr68ZtbfF
 4ZF5EVJwAqYNfzQMocXAmY3GlGHtW5Mg79iqv04tPQaN1G1Kgs9VrSXkhAHKQOOBz+nWtUocEI9
 MWdZDXaECa8cJBoKxUy96AcDmh1Qpxk1zVFdhaMCWgaQn0wKV0mg8LESu9icxqmGX5lc1t8Q29C
 9So0Qh4CWfYjSYbEztNa8gLpjs50zbdFdmQXTgA9W1xTQfwr0E1NZMJC+p3QRvg1vYHHtZ8MEnj
 IWtLC5XYyHYpVNSwQzAH7HKT9gpFCrVOAL0FJKu9iEx4MEGIE/4+OFuopPZ/CJptU4rRTt8s
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f7513 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

