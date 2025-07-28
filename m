Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C352B1434B
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3B910E592;
	Mon, 28 Jul 2025 20:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyGqrtlg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85BB10E591
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlO1I023606
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DJLMxQSPLul
 XmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=; b=dyGqrtlgUB93eDbcmXDouyadnwJ
 sNmpiwmsgyDI3+qLxbqFJVPzLsU1SWMAl5OOT55TRM0Eukkyn5WFy567grwzxSio
 yEWruDcHGv/Flv2AGfNskRvylbeg8Ulg+Ayrg0Lo7LErC1DcY0B1NoPD5LuGT0Fo
 XRXg/4km8fceVlfaNvyOSIbDzmTJOmLc30F6OxPXktAFheXPggZ5Mhne78PYTQ+3
 TabloM8V0mIuEY21ENDdtGySXV7kTdXRdq2Agwycugt1LlODTTknVh28v4UvvNmu
 jRsCwFsJALaboxqmGHD1HJzmjlZnhbyDFtRMm6vnLJ3Dek7nVlk6tnXAHAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235dd77d11fso49859835ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734862; x=1754339662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJLMxQSPLulXmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=;
 b=flyI09evG4p5Vv7TH2l3zn8M2Imia3ZeLcFkLe7tsBo3HpxxU6EEKYm4vhFT6EJdH7
 ZRZaN9JXwtc8VseF6N+X8Y9OsS60x/sn+d9Z0anqGGzCb1oq04SyR1GZhLT2EZVSyYE9
 zmzEfUTK6T8N3cRrxRcgyDDQS9L3Ar4kwqes7RaGmPgU7s+TwAm+c2i4RkntWBrKwpAa
 MUTfnAEf/dN4057VS6FOYjrucGzhIqXtzUBc3pqhUCXNvog05umGSr94A2kCFzDnkcpB
 zJm6Z8YU+rxZ55K+vN+nTk53uDdKY7VGhyU05kB7Yjt+BEHe4ltBwy0kTk6djWfVV8fx
 cNCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNW8wKvP3XPZx4l7YbMQxh/feFYtmsPDgBx77rCA1tBt92IepBv9wsH3bkuFcASjKFOC0CPMFN4sU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsKyH+xhl8mJOYbTT3nnvPt8TjhFrY9ZBEGsyJbf0D/HkyFC9s
 /0zweuH8/wrWeBH30K6schsnCWYvp5l7dNyBjJPAJfBV4E5hxr+pZx8KhD8RIrJa5fPCLVSotGA
 oDqWNKTIW0OuaWc0jnLdfqAmyWJjtCPe3vpL56BCboVknGovh9O+IhY8fzLfk/9Euay1T4e0=
X-Gm-Gg: ASbGncur+YXYh9I6J0Sf6H8MOnU/luiEwwPVfx9NO6BYkmoU71eInBX4iy5Nn9Z/Fk/
 UQ5ExI44FIXbeuWbEBKenDTZ1/lrutr0ZYAq9N7BX2A6bcPoxl9PxM9Gv3a6aAJN1WPGpZHXxZz
 sHKoXxTz0n/EP7b/mZiYs+cKauJl9L+r3bI/tnYfgGcSijLzCNPjcBNaBcypfccNmxb0BFmgRpx
 PafJCsXSs+tSRdea7wdmE1AbF/qeslL7gVodmyEm5gTECuI7Rn3WCp3Cu3LkQy2Q8kozzSr3I8S
 EBKeps6GF2UGKi1laEaksDlQxKs48KVibcDgrvKHbfkZg5imdCg=
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id
 d9443c01a7336-23fb3100edcmr234346415ad.45.1753734862411; 
 Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuxUhcvGJgtF6rDcn2PilTqgQgn7t0oHSLKPK2e//pz1CGm2wbhZkHISTRxQ7mDDyxLpBecA==
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id
 d9443c01a7336-23fb3100edcmr234346205ad.45.1753734862031; 
 Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240469a8111sm16679085ad.168.2025.07.28.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Mon, 28 Jul 2025 13:34:03 -0700
Message-ID: <20250728203412.22573-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX47mTBMLvX6+j
 i5Fv5uaSmQvTb7GGtSXamReUrzhvcrleSthQ7hjWAnOqmzuGcklrkkemGQAwqFZn3235GWyGbhx
 v/lKJ1MRtF6DpmNva8hlk8+5JnXgPRtaAsvDqqr4qxPlZzvUKQ2Ty4/sRxm+WIG9BbJo8kSUHyd
 3sXEIsRbVfo5/6Jeks63GsX0mTL4hN65O2qJKSlXZQBswJKTRlfn6Hqghml2DsQXm86jqF9Z0OS
 EfVwpDz1roG440FmOeTuiQ+Ol/LCY6uBYyYBQcHFmgXt6IzAnck/NwAgGznnimxD9mtJPuGuPDH
 cGfcUP/IZQBbuXrXRyrKBNf1WMIAPYldRDEMoIdPyC+V8iCrGpbxoHiAfpoP3e9k2KUOmlGA7M7
 x5cfiwVqVK9fpxmG/vbtLT6msGcgz/pwbGTA84UqoQTBBD968wG6QTACXMXifoYSRxd+gijf
X-Proofpoint-ORIG-GUID: ukR0JwqofhKofcpeQpGxO3FcSvG6izUo
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887decf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ukR0JwqofhKofcpeQpGxO3FcSvG6izUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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
index e586577e90de..b253ef38eebf 100644
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

