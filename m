Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCAFB0B5D6
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D23B10E36D;
	Sun, 20 Jul 2025 12:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="htWDOlAY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0910E36F
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8QgJm019442
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=; b=htWDOlAYefHQTczi
 QPo0hslP2C5MFEVtTH2FAQS4MBnRJUgMBcrsKyVuHCc5drZJgeJIOWb12KxCvSTY
 vQYdtI8IRjHNRtHfVGmDEdhdctYDznzEdKiJz3dH342baCGI1U85VlhEU3qk1SBh
 Vu9gyhve+Q5W0qWSldmbjfCuPtMHXX5O5sEqT315GuRATe/N9tExL2/CVjY4bXgQ
 vBaZbhJ2r9l4CErOP3BMfP7KKPQ4E/DOLl+Gjee+nBZtaTHoOow8+6MUkkfTr6Wm
 4jlmOVzLCesgmTQuqRJqOp6p9aJMXWxWLJ7FhmGhdohkQPyUweKneC2KjHDNoxj6
 BztGVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vt5a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c36d3f884so2326099a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013822; x=1753618622;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ye7FLQxF+oX8P2ZafnjzmxaweqY3lUTRvMOeBW2C9Lk=;
 b=eGx/R7K4KILVcIUU4EFM22qQV9XAy8rDLXA8dwGCF4JabYTR66xLo6xpwEEcqAiIah
 VgbVUNAsyQI9KsHTg0DRotEZkoBWvmitHDDsXONVgenrUI3b0WyWVDMSclvWFyquHecW
 oZxF7U+ETNAy2uO5nBxix18h27nOfJlWn50+u2rF1HxD0rvhLXIlZjtbv7Z3QNARohNv
 2fuYyU6Omdg+zoRAGxwxszf9+b/9vvQjux20DXJ24ETSF/7rd00ru5xWlCXM9pNBp2G7
 O+RdQ7jnKeLXoQNjY+qnIM9iwW464ELml1jHHMPn+vsVzWb/tVSFcUiVLpbdM19mtpWb
 RMFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4HfGJRr8YgAUrBCGg0MZ+j3b34baqh2ZNsAAfoHDe3DEPemfxFmyY5eDPFGsNArGRa5ifJLhIJzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+BXLfVeBIlyalnVjixbivySeJrDlnrXBCfstbntmjgYBSpIkF
 n6mW+sk2dGgPf2XuBEqjhHpbIX3yJe6II3Vt0hh+qrT9nI6QNtcAd/DFVENnfpI6nxGapQMVROe
 thp68NzC50CfN9XzSlEUgRt532MhXQnHBYTHaOA0e3b20pk8txV9G4NM0i0ca2vOv4do3gxM=
X-Gm-Gg: ASbGncsAX8Gn3YywZwF2zminfimRBMO5jLqpYoHMQe2q+jB4cvHqkG+vF2UlccNddJ7
 oakeFJMBO+k4BwQa0zVODJAjYzqeA8q1Bdz0EWq7DPb9ASTT4FPUxg3k4rSFnTYxZu28YxUUyT8
 Pj3W66e8caYz4rmaHrQs0d9nppSq+aUlG7HI3stM0F8LFQE7J+qeVM29k1ZF6Ej/rwgEK0QNZpo
 2HfN+wpCD5wP8r9jOFf41D68Kdv8gSJY2EF9YUKOOwNcLEn5CmZ1ID4/pMNmRN2U36iOtDFGjNI
 yyMgFVGh0vOchf47e+hE85Nna0mhnYjabJ1unTCpYc+8rWkFHhGRuQS6GRF3pjV+
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id
 adf61e73a8af0-238351aa167mr17819746637.46.1753013822097; 
 Sun, 20 Jul 2025 05:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiWwQwtfLMcB/87qX/+tJZdR+Mt+Z77vPLlFgpUunMGDPIC5fMzAPTtacb5vIt/CbB4/MmWQ==
X-Received: by 2002:a05:6a21:a616:b0:238:351a:643e with SMTP id
 adf61e73a8af0-238351aa167mr17819729637.46.1753013821656; 
 Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:04 +0530
Subject: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1436;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FEX4gllwWRzFTPzD5y94Fxz57/D5CyfbPDxIKY/FMHo=;
 b=WNF6fhXZNpLcKewFVHkyZ/9w1NDmAhfqENUshg+HaTobcQUFQ+1wvwT3T5lx8e8LomX+8eQpp
 WvoeoCpfdVOCqz29mDOa+2xKgqFH8UfRS+v8e8JIYk6DifdK0rXQLd5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687cde3f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JNXRRqm57C3p3bqa__oA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: arty1sM1NBoTR0M8fAxS_5dKz3FqnWUO
X-Proofpoint-ORIG-GUID: arty1sM1NBoTR0M8fAxS_5dKz3FqnWUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNiBTYWx0ZWRfX8mKg13zisS5g
 OtATZ6CqqHL4hAsXEg8Ld5CYJnqnoGgQcef7EtONwV7ik+OWfyPcz0eKJZQ4FOCKeMyfxmc4fRL
 UAKA74PDAVn3w1UrQ2CPrF61rAYSio5OI27cCicRj0I1Zn8nlNfTwcQVDHb93HHrmyfj9tpBf5y
 R1BmTIdy2ENKTdAtWBfyn+kRjhXLQEnw4J0U+zQMPrbYxi76lk4hqvoz8KNL+XLKSKOrA9RaKH6
 pIcazOpoSfbhU4g+ba9VAt/Ss/aRqctOLBDadSLYP7scc9+Gnmo+mlEFn5eZEXeYZpwp4guONl8
 tzpP1XfHx40d/i8NGy7q4iZwoaS2RSi4qPTg14Jib3K1KHanrQv24BQefA82VZGtUYrPksdqrFA
 XizmFBvinLjNiLtDH0/yD5zAzYRTnA+1sL0Pp3iCFMTTd3eglPykGpHNReLPoEGqIrfzq9ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=894 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200116
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

Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
different in A7XX family. Check the correct bits to see if GX is
collapsed on A7XX series.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 41129692d127b70e9293b82bea5ccb6b911b0bfb..790ef2f94a0b0cd40433d7edb6a89e4f04408bf5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -93,6 +93,8 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 /* Check to see if the GX rail is still powered */
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
@@ -101,6 +103,11 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 
 	val = gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
 
+	if (adreno_is_a7xx(adreno_gpu))
+		return !(val &
+			(A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+			A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+
 	return !(val &
 		(A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));

-- 
2.50.1

