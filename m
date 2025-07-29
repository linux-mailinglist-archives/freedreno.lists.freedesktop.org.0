Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18BCB14FBB
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EE910E650;
	Tue, 29 Jul 2025 14:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiwRHPIz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35F10E64E
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8W7Sj031307
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
 c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=ZiwRHPIzkt/3rNNsb7aQ7Wtdd18
 2mqUN0vdF2ms3+s8r2S+BUfhg3DB9QllgpMo9D8qjvLLKrjXoBYHd4FjZMKKWieC
 8fSaBhWXiB7vzb2Y7L72RtZX5yOi6l0YmBmbBpJ6VKuDrPHc9dVSH5oPbUUSQKYs
 8iMyA2bzj3q0Lf8jptTAkVNWgj6+HpJdJrUVUGz7YVLEDNJIWU/UtPkLyFMxQI3R
 9D96nUziOkQ5C5PJwkRbyDc63Z5rz1VcoqkYJhVOQNfTjICVi3+HXgqfxk2oO696
 6gGlfUapttfVrzOnOsG5/7uB510eSrhwoC7KD6UNjmIsDD78n+PkExM51+w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xdwkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3132c1942a1so8622498a91.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801063; x=1754405863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
 b=gKKI4ghl4WA3ZynzHQQEF9efR1DfAqZ42Wale7G8/QaCOxMBxNaq6aac1wsuKFQqEA
 vApTwwinRBRdKuzm1XfXrDKF4gp2Qee7/SCdUZ88keq3wiVHZ5Tw8WGnGHlLruJ9F87/
 /G9JSFDF/7uBfzFCWgnLk2YteBa/5/k0aN1xc5nwUnKTEgF2sTeqJfhajIs6IVpOYowY
 DzBDRRUQjv563QjWKG5qyU7cmG2vMU1ZY/KU5v/TlCKZMydIjEPx3nmL5RIb/EQzqT9d
 +c3u4fUQoaPg/cR/i0XQidXCIOAs6HLSsY/tZlXB0ZlUx06eGa+kg/VxKPCl8rwvdzoc
 uAzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJIKnUKCpxIFOWAl9tvz0oY0y/7XLAvyNHBldi5uUf8IIVa/QIl8uyX8eDgwVserfwYmVVmRntFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlxs72WvUNCw5gqhjCsZ967BmRpsz6D4ozUT4CAmDpCi4yvQHJ
 cDsSoqMamrUun1Slnnk2RM3SRxB0ZHCc6fxXlcsHtERimUaTbgmQiS/2NOfqLcOfBlREMzv9SZA
 G1YDs8Bo1gTmNB0mWRdlNWCsHC88EnYDyT2pF9WhUjr0uf3nmrPqxD3qPnNxMWy1wbtBn5NE=
X-Gm-Gg: ASbGncv7sh9jCXUg5N63O+vOCKo2oPk5BEgmCRBZr66UPkWBcftVFodpQTB7fx0zQgP
 o6UYn7IaJOTOrttvqg9d3vOnI8KWmao4f2Nk1YA9SnY1/boNdRgbufkngojTRJS/HnNqmSYk59R
 UN8kP3kwH5zshlUMsqvCI/MuK07uAkZRVKQfAUJUZrXytzovbC4YrieMLI7F1kvToQm9V6C4XZR
 QLb8NymXF84u/qEDdK4GUThfTFOCMnYoE7I/7j3r53KfFMDorx8V1tFCibL76URMKYSnNyB/tet
 KEBT1JkBqEleIzMSL86zm5YAi3hPQau0Dn9RBcVf+ZtYpYkCyQA=
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr23804177a91.28.1753801062193; 
 Tue, 29 Jul 2025 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1VfCPq05jHjaQmPdpsTNpOERHdd8AcbiU4RZ9VCJMxFekjA0Y9XcD1WRvDW/ywpd3mPK6XA==
X-Received: by 2002:a17:90b:35cb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-31e77afec2fmr23804129a91.28.1753801061607; 
 Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b42121a2c8fsm1289263a12.43.2025.07.29.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Tue, 29 Jul 2025 07:57:20 -0700
Message-ID: <20250729145729.10905-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX0pTrxPYBfPKS
 7A8D5uFBUOiji4PDOVa3fuFmZeg8RcpYJ+HE+4dIN+Oila4+jsnl/XacsLueUvZYGDaMR3P1nhA
 Zn9eG/pX/rV03BLLj8DCsZ9QOzXuYLMdpKuONHDeHyqLXNQElRPJUoZ41mpNzZnY+PIwjAxUAya
 L1x4hiQMZrCSqOH2WePbEqaEQJvsr3O9LAEfbOoWRiln6ZT/aawtyMdX8VRCA/cXEqVw+FzOqRD
 AyoT0Q1HFHB4U8e69e+pRS/EC5455eUWYFUbpc9jNn/qXO6aMUiNfVeq6wL43Z0FcJYDHDIMiXH
 WwYAxCRVU+QEGDqtY0KtF7gUOWDNEoOhFt31zPcqmyPE+ga7Prz/ikiWL2tHgKu9XXrPBhppGW2
 FeLYHuMjsJeGmmjSRdsAiXuQtqQ2vgPg4idVOEvBE8ea1qOXIC70ptZmAPYnHN9IJitnStee
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888e168 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Ds-VFJ0xw7G5DI_Vsony3IDlw8TG-8Em
X-Proofpoint-GUID: Ds-VFJ0xw7G5DI_Vsony3IDlw8TG-8Em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114
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

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a35cec606d59..5204b28fd7f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1

