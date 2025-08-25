Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A32B34349
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF2210E4D0;
	Mon, 25 Aug 2025 14:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcXKcIx8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73D10E4CC
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P91EF7020343
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=; b=KcXKcIx89ECYWM+p
 Qumlgpfvh7fNUJ/+asqPchqOSihvhFSpD0mg5oAWug7OoGEeE0qSbq57S85peLe6
 4OCCeIk3/BDph9cZ/1uPltJcOHuQ5tSLv4w6I3T0yEYf/dNyo8lpDyBwspduW3DF
 RLfE1HBg2RfhA+Xg/VuyFo+A+woEI9ec0phF57ruxPvG9UOfR92QlOOuDX7SzBmg
 K/NAM1WV7JOJVdnOM0jeTUsh5pzQ98929T7Bw5eRvLy1epvFWa7u5H2zujIXTaor
 F6n378ZEd4YEovLjC48UloZb9rWIiiapG6q3t41Rg34eaMlndjgG8AF2ONMCViTB
 y9kfIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e364afb44so3430404b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131567; x=1756736367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1yd10YofnLH+CQC4gSLJjeDZmLAxXPdlUuNT6txE1Y=;
 b=nzwKv1xMjn4SCUeAbqVXph+6i8xJCkyXZDhB2KJ3tdZFV440VARjBbebBAOZbvAGn9
 3wTJFbX6/BdBpQlk2N9NsJK4NPUCuPbCLQHKn9ni7A9EWM30ksIAMOarH0rkuspMLL40
 oABaMQM55cXyIUhX/9oltwsxkjBT4CXo49KJjzKzyZ77Uj7idaqzu03RmQiUUZpKPQix
 s9SAhmSJybuFzVdCApWo4GjAWDYcnrVrksiqjqUu9DiCuEpKlnbtXdVePlx3zJw2jFUg
 DG3gsj+6yjAgbwmUAsR+CGO2MiZYRIyOMkBGAte7fVPo91PJqhw0v16ySUVrU3Z4/aGX
 /foA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ZT2f4N/T9gc7wX0TXlIGVLdXxtJwxjkN189hQYrBKaZE1JUTlGRD2pAA1rNugtvtj3v+SX0C4+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNr4VrIgCHi0LsUxN/hG6Li+2IDngGUhCgilmxw+ZM9L4sBSfA
 0afhn5LX3MsZ3EGUI29X7Nwj2OQPzDKherFJkrErYFEUTSTc/aqRwTzd8QfgDWoBxqvDXcL3/rT
 n2oJMRzqdEIkDXERGJsUrK/mC4MQEiWAc29ejcVZfiqr8dlHBI5WA3yW0WQ3p4serkubgC0s=
X-Gm-Gg: ASbGncvdNYrZrJA60no4GE6MqIvAh1vzyvecZf7V7ozGoHElVRV8Wp5hkb4q5+v4jOk
 T7mkrjNQqA0XKyhaj5TKcAvMOSgOLiGwujYmWYzv/6ncLYEulE8Ro/BZ8Ge7hFcfuPxXZNG9Tpz
 lhnrfQQmA+gvWzBDMXL29sqsfleudR7JbEXt54zu4Az0i6793YYmXurH6Af8ZBJ+azl+CUQUDft
 Lg91FJgxC03/6CyEtXYTsnpRa13vasatQGW1YTpO8wPmStpodx8UbgpP4Nz0ftI9UDNuDMx1P+t
 K83KErE1L3SLR4buvWJkBPb7R62ggOcBp3xLEhzVBUnWgZE60YgOyONNJFWnJReuUqiljT4=
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id
 d2e1a72fcca58-771ef50091cmr1422425b3a.15.1756131567565; 
 Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGFvu3XuT9VU/LnqIitNUMdiD78ZWBqA+dkmxK74qwT0hQeTdkMlAaWKNmSD7AF3jPQpDnfQ==
X-Received: by 2002:a05:6a00:b44:b0:771:ef50:346 with SMTP id
 d2e1a72fcca58-771ef50091cmr1422378b3a.15.1756131567093; 
 Mon, 25 Aug 2025 07:19:27 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:19 +0800
Subject: [PATCH v3 33/38] drm/msm: add support for MST non-blocking commits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131424; l=2126;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=bbMgrjogFWOe53cU7bupWnZmtxrreVf6AXy9Q1VXF+M=;
 b=gpg3jVD6oQp8tI8kWMMSeHm2DZx31ldvlH7b/o8hYiGVXXFJvVsSukXwu+8X2LIpMWKJk16+T
 Az8Qnk5jGIADEg6fsCyTUrl4ahidQSBEY8LldaFTeQqX6Yi482rJj8G
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfXz2TKDs/3fTHg
 UQSM6Fjqi0ANQPJBoLgADPEKYJEgsqCXRHDOo6rrx6KR42V0bXAU0e8tPD3ar/w6+mizmfFq3wd
 ZTz583y3hteVgo5fUHxf74AiT/VjHEGdOIaXxE/xyG4Up5VvHs4Fbexmpk/5tSCwTKfFGezRhRU
 KhBDAQReUDbTfIRmZ0CL/tuHSfN3AJ3M3YeR8Acnx3iSwC9b2+9uDJ3ERs0y3nUGS8I4TZtKlxq
 mDzS1v2kKfJDoX1Q4lDGSPF0vRO9Rtm9bCBpLvRmf+AYUsad4vsjiTejPDbfJrPOVNr3EbjHDj7
 uZhSjPgQit6K4siqlRHd9KhxTYhg9IV9zc5NYw8aYuJu9SHkIGGbV33wkj1FLObNJ5UlYDlqm6S
 rGkwjaMM
X-Proofpoint-ORIG-GUID: lAlcO3jXSDue506mQ8meGtuf1tpb803r
X-Proofpoint-GUID: lAlcO3jXSDue506mQ8meGtuf1tpb803r
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=-c5J4RddxQ5453FdQNsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Integrate MST framework APIs with atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits
for DisplayPort MST.

This patch only applies to MST. For SST, non-blocking commits are
already handled via commit_tail(), which internally calls
drm_atomic_helper_wait_for_dependencies() in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 3 +++
 drivers/gpu/drm/msm/msm_kms.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -10,6 +10,7 @@
 #include <linux/sched/mm.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
@@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.34.1

