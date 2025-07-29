Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABECB14FBE
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335CD10E653;
	Tue, 29 Jul 2025 14:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiZYV5jr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E6210E651
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T96CLR005104
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mD0NBZ6SOPW
 kY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=; b=iiZYV5jriManv4CDr58TLuNr65y
 F3hzRYwPt2s67ATn13QZ/6gDeuUYU3uD4URo+ta7htvq+r3eETOy1VvFOiJmxgNy
 cRNHjFJ36qq1/ybOdfYDP7dhA0VOPouoN9z1JvBnHvvpJxjv4EnYs64poNCsCEdx
 VgrPyzVEKhxkLtQ8fgXW8mTpWiG9LDKRjpHwwleAN4Q5NjWkhF3KueR9P9qRUm5o
 qVvXNYGLurukCT/96AxEfqVQCsb0qFAGw8/lbX91E9MLAQgfO/O9ddLDjg2PCbTZ
 fdGT773F9GA4kc4spG72TylUKJpoWSjFNNaLhad06NCoC10dT3MAgAkOVOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu0s11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31f322718faso751575a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801065; x=1754405865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mD0NBZ6SOPWkY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=;
 b=H393G2fOl2f1jlCpAQ35kUFI5tvhhY0b+w3a6QcFHjBb9idifE3fngawby/ji+aMQo
 9mwfaCsRY7Lqr24tmGfUGXmLmONs4ezYgC4t4Lp5IgxDw3Y/iUGqrVBiNpnr9euV0lLp
 5Wi8P/gJo00vRPxA8d1mln36pDJvTUJIP9p1CcHKbSppOQrPQ7qraQwYwfpso3q2JeMQ
 BGqwxe7w6+mnC35WfnqxJyZMGb2RCmJ2WIgZl/CNEQU9RuCI0ymkW3CMTKNN/pYht7Aj
 LKihu2rvcasfYZ5R9Jqsk0CaNutD7NlzdA8TRMOBpAulgv6HQr9LEBT3f52WT82U6hH9
 2sjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6A7SSPGjHHqfZPtdgMd/tarpILSNQ4v7cK/Sjhj7zEUWrgfLe0yn6SgjvbSu/cRMOF3kH5kv32k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWL9iXTlMQWVC99s1UaD4eV+EPRAe5hgnIB+BVaWUkYQFYkU/D
 qJO8WHx+ptdn3xHrK9tOdymW5edRe5cAJtwJafzR7U/GthakuoJPYHA16bLykDandJDZu9aIsIr
 9ejroYoVtu9Vv5MczMWTpiYLk9EEp9zHC3r9KUXxbyciJto8Z4HB99rlnGDZcJ+/Cc1zL8z8=
X-Gm-Gg: ASbGncvFd2iRy/H9g4Uf/ZrbJLGPjYUIu46zK43/pIc3gnP0llW3CbEL4w0r5/eGzoC
 KC/LiaEHJCjTCeW11kl9rvbTIr89LBH3e2i5ihhcd8zxz5qFjO/I0002Z3EzZ9cRfc77lLeKCNE
 IlVg/Hr2zjgo4BKcsjoBUBTcwD/YFaUX1E2rms5p/yoDpnGCxSyLQZVq5PIrhA5I80MFPLWlxjA
 Eo478yDQWJ+jQ16lfgy3wk21a+9UsmZNdnYAy9vSGO4LcjrVffXTruGij6aj1GDpGJvb2FieCsk
 mIdnC9H5PGGP5qDlPjkbLewxlpf6KcThiuToyEOVPwfvJiI0jW4=
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id
 98e67ed59e1d1-31e7785f8bbmr20455325a91.13.1753801064931; 
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEiMpmUR+bY4vgJDJrIuyQ52pRlkgEThbWo2keOzuYnD0mITzM0Bk5ZrIUFuV4Dy4dKAex9g==
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id
 98e67ed59e1d1-31e7785f8bbmr20455279a91.13.1753801064338; 
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e66eabf0esm12322972a91.11.2025.07.29.07.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
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
Subject: [PATCH v2 5/7] drm/msm: Fix a7xx debugbus read
Date: Tue, 29 Jul 2025 07:57:22 -0700
Message-ID: <20250729145729.10905-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hjn8kxnHqDD9WXFa9U52sRoGAbdssMmi
X-Proofpoint-ORIG-GUID: hjn8kxnHqDD9WXFa9U52sRoGAbdssMmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX74WZx04eC+VZ
 cstF4P9yOwhJ0jUpVVm9IssrhOvt7XcYB9x6WkW+z0dDDSmZ/A2rUu5EiH4en8q57AijxdGdOXB
 H4dQerLVbvVku7S3rvsbPCTc0zoUpigvOza/M8UpjyEozyKEQ1k67Up0YpU8avPcBlC/5lTvfCV
 X3VrybbG+tdsXv1sjJ8czJmkcd6YDR5D2wIThFJdfUi813gOXO8Yb3b52FYSZCjEb3vWEoEQc1H
 wor+IfWVUy+QlmVGf1OojmHVHtC7UwRjvKw0qDUSNGNRBtcW5RjPXdoLvinE/naj14pnI60CTy5
 H6qlGaf0eBUF5NzUQIlcJiNCg9/uMxOg7TBsTXGMa8+yDcSC5m7hKAmQnINDYca63EKqdndg6RK
 pSnpxUsYfhsBe858HQKBDZ5YpQtdbo+pg99kZ6RwA9QwxcM1e55e+wa/tv1knJXgJdfOzKdC
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6888e16a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=IkVRe3mbPPK2UihE07gA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 11 +++++++++--
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 +++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..8317e1107389 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..7a32f6715752 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
-- 
2.50.1

