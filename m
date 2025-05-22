Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59921AC141A
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8310E959;
	Thu, 22 May 2025 19:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2O6AG4B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240F310E943
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGesdH029048
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=; b=o2O6AG4BqR36OSah
 Os5j/CKCuMjniY/YOCXrzXhTb9pWpQUm6kHw1ib4a+mT/5oeAIOcaqm9BV9M09xC
 W0eJmNNFFSZG+PhcbUumFQCuY089KwXlQScmzw1P7kr3qFit25MaKSFGIy1cT5b6
 FRjDIiiDLpzNBFHDIop7Y1yy6QZ60KD8cwUbsLdIPVLGS0tFvdiaOwUVeuSyxTuK
 sp1GRjtT4owvk0b5+hb9gYU4oAAGQZGEqHSWQREM2l0lBGKkpbhmKMOCLQyW+IS0
 o5zgRlCjhLIklqtPTVWpT5Og2NYqz8jzNoTFn/TdUJ5rW9Pj+IAtDDVXfjlqWvbn
 aE76AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47k84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so1469776385a.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940691; x=1748545491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=;
 b=t4p12Ofqu4TkQwXwLAZxdSNxT4NRCYMioUiZ3KayRY/z0auE77Jtd3U67OT4zRRevW
 IW1daQsDnF8rq1+LPw4RKEBv2Hzu2PBW1Dtuv+ly3sZ4Fw9/WuB8fdW21/JIDhNhzAb0
 xZk9oI74lZF3BCO14H1XbrOlwj7rHhGVSt0u3y4vpa9m2VrJRiUbOWOYalLNE4dP5md7
 7C6D/NnZNGSFSWp8dKpPRbfcI2dgq1xKw56gnRzbMiG2JDFJFb8vEsOGczyEEJoxehdo
 LKpdS4If/c03fp7qd8CjcvLNB9wbUVt9s16DPsY6fYQPsYS7+8cVjMItGVM6mEnHCeTW
 AG3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdFz4E6iaSp3Z7slbpLS5xZMn/cqNGxnPNYxM9nJPOuYkOfMuwX/u4cmi5ann54UMZGvHKx/B8U5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1MIQhkY3H1Q27tWJ1/wT84JqFFCn2MSlFcaGDws+97/TdRFiV
 UDITBaSN5HW/ZCjIhxZheJzdV8G1tC4BUveYcGjI4M5UjBIfGbJwmrshwDSHCTFLB7wjQ5rpr2C
 Dd5+0fFCV4PkIHbXQn8iJtTMkET+Vfu8esAOyHSMNZQsM3bR/RIjZ4Au2tRH7wO3Aj96W87tU5g
 +V4nk=
X-Gm-Gg: ASbGncs+wyCSvALgMk+goVjowgdUPihuU4kqk8BPFDY6T6XbZXfS8NwQADCQYJ9/Mj4
 Sq9Mw7in5HBCx3SOmPEcworcmabxC48Po6KIF91f4754AJKL1Fv0DhBPhUTdpnqrJGSz8pa/G/i
 KypSLaRL5AEC9KAU6UjVfGcCdXVcIZy8nzuKdNqn1GVjZIhAbS0CJKhXRBx2cjDvkjXjgwffcj+
 nHUYOxleFFZ5bdvDYM0kmJuKFJrqMoEGvomUYwYHR+4kUAJLAlRgYCmO9MM+ZlC6nOq4rCnbwjg
 yaF9woKP4RtoG+RLABHtwGJnY1hEEuR+0HhTHAXJP2HObtkNyys0dcI150LdiwMUYDVbyaAXryY
 xVq810Js5ou76hvQfTdbfKkP3
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id
 af79cd13be357-7cee31e2c20mr8933085a.7.1747940690934; 
 Thu, 22 May 2025 12:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWeyT8YuS206JhKQP1qx3xAjKuJP2j0TQhVWUYqJTT2hjs7OvTMzPQ9H3knJ10UZblpdlMPA==
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id
 af79cd13be357-7cee31e2c20mr8930485a.7.1747940690601; 
 Thu, 22 May 2025 12:04:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:46 +0300
Subject: [PATCH v5 27/30] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-27-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9X7zCyPLMB9JgfInfLiu//0xvw9FvJ2BmQNEpS7pFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/AMM2dpp5tL4YM4Flz6AU5HNexuGwt28tU
 dtIqZZI6YaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1Y8IB/49tAdM/XYV37ASC3Z3O1NA6waaBgF47TaEVpZcrlm3Z1HhAkvOMKlsx46o0ipm6Kvh9ms
 L33cBcEyAuP0UT7NOGdDaXOLI5KoOdliuw/DFVwDqEeWcynPbmrc4KdL08GvzisqwMNM00i47PQ
 O8UtxIttLYX/SUdFzOLmTFBYsb1wIzIYYVT5na7RkcB/aIxYiH+AjIYx907zHuL40NRKRma7X+X
 RlBGn52T+7fP11hDCaSrHg5n7O+/8jTHJA5pddr0Q1tdkcdSpX8dDXQjpQI3O3joZchVP8beuNs
 l1b+HQ1BB7dZrefz8PjvzLk2Lfc8tY+ZSgx2ZrVGz3YnbqTf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX1sgCo0avwscV
 Tyf+U4KzFG6cVvRQfiOA+aRFwjCpvlfAkpZ6PVm46s7LZIxi90vXNJrsj/LoitNg0VntY//pZK+
 Pmpv/0stUekCSE/rvfjdinOFsSsrkm2QtwebkTyZBcXbKgg3MvIKS/CI4RVIQQQc6F1IXDLdWCn
 jcuKD3srroT4RFWlpp0+81ta1xnTw6/wih77QGBi6oKx6kDhnldLgmDUy8NMKpAd3y7ogtLD3Am
 4weLV+YM8A8ljY6tq2smj5I1T4FU/U8XZl0yhV3gPOXOaKkedxGvrgvsS3WSnsWUWXuIKhTc6D8
 DUD8zHhp/Ap2as48HtgQH6OX9LOI1A0yuzTNJ+fjRvjBUbE8GCN9lVaqam5NgZX/8nux/3SwvEC
 tnILBzw6DxIddIagtguDFa6ig3pJ3Q2/HLTjhbMo/EJjFg95fOJaj9ZfA7MNnd6YTCTbI+mc
X-Proofpoint-GUID: Tn3OHZKYtntbF1DGZj_z5DoNHDXV2EQG
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f7554 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Tn3OHZKYtntbF1DGZj_z5DoNHDXV2EQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=822 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

