Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB63B186F8
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A3A10E30B;
	Fri,  1 Aug 2025 18:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EityKLKB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794C910E2E6
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hg9GI008591
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=h5aGQowTyQm
 WxLOKsfUuwBsP1jaMp4P0qKNGjmBwUOc=; b=EityKLKBe0tOwLIqqVCUBnKMlba
 SvOGiDP8bgLrdJhaPskGjV0GeTETC5O8a/3NyHPS/eL7+mq8T5v4Tx9ji5xVkp//
 Egl5fv/JqDN7Co0ZSfjUqI1HuxtyxfhRs/J22x4Or9XeFuHzHNirnqjKL13H0LWG
 QJ5d+9t21Tg+XjSsg8DEViap7Z93fR0Jj3P0Q6Xekjb095Cm/aRbWThmhUU5xEoX
 puMND0i3T8uO/9cZDs/4/9kvKhKbP3IUoOwwQfq7GYXML1FBwNlq79hnSjvzB39f
 EXnH0f+erB4aC5WQXjbYk51ZTt9IAl8XIJA0eiMM20z6+79LBARWaVXruiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwghc56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2407248a180so15997165ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071218; x=1754676018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5aGQowTyQmWxLOKsfUuwBsP1jaMp4P0qKNGjmBwUOc=;
 b=mMKo9hxER0px0+4arVzRdxnSy1G8f4iPyBNEwkG/wbVVLGhFUSV+5F9d8rswtIigJI
 K0CT3dSqIOdNcVMCgAZ9xeNWH4K61PfR/z4p5TRTA7C32fHaTkhRccsI1kzZ4hwllpp3
 3vBwf1dQIeKFDSZi5Cwqk54YRjg1hEibK/y45j4KCgvZGDurIo1OZCrVaKk8XESeS727
 wVbSHzN5uiCLvQfMogCD2WFBHkcZB6VuM40svXwzkdWZq6yDd8jh6mCLmWWNXj+z6VsL
 HZ8l27VVj1SICa1skKk0ok8D7EVxX5dljjTkCGuQQmzWD1iuYSuHeiqlZjs0VQM1YWJo
 nVKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTsaM0KortW9WfbYDDjOP8p7bjL8kUxWRj+sf+CksUTf8wonpkIBNu2d8fQfkytQ6uUt8ryPQ/xyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgrzs7eA4VQiyM4b667/bxEjpNx1uazRRHho79akG4xW8KNQZ9
 kE0O5I77k99Uy9a2AHVjYR8nf5WjiB+4kUaMv2c1qHameRr7nl83E0fD5SlJrgArwazuBONb1QP
 rxHUzoOCD5MXFqjbkOsGLB6jNGHmcNk/7m39lW+oG3GzP0K2S139u5t3XWQknD4yp8sBH0RQ=
X-Gm-Gg: ASbGncu1P7H2vNR2rJSVgEsa94VWgfn7qK0IW0+ykF6NxPxHM3/irDmtsC3l3KgYWPf
 dmklBC6JpEovWcjNPPDaGOQqR30JwOqZWEZbBS1Inbi7JiKlSpU0UucH0k3vcqbu7x8ZpIRqnX0
 upgoxme/QAhzH14Y0WzjlH8sySAnpusz9Mvhrrfe+/sf1Ot+bragvh30XcEvGVWhhSRPLLDkMnv
 VQmbytwzSyF9v6eb2Ea6iVl7rW6zxV5M0nzxRnKqSw9V0wOZpKVNdgwY77dxnqEEzZPN8kYKnnC
 7Bv+2UzKs7xK5tvaM9qthDwNEjqSY+G49dMKRC2nd27o9/037jk=
X-Received: by 2002:a17:902:cec1:b0:240:86b2:aeb6 with SMTP id
 d9443c01a7336-24246ffbed1mr5044065ad.26.1754071217548; 
 Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbq3awaD9xvkRSNN2z/DDkqNEBB7r9FVhqVsVElrsfxoCKJuaBepuSzCBszOff9RXFmHzwmQ==
X-Received: by 2002:a17:902:cec1:b0:240:86b2:aeb6 with SMTP id
 d9443c01a7336-24246ffbed1mr5043565ad.26.1754071217014; 
 Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8977114sm48268935ad.102.2025.08.01.11.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:16 -0700 (PDT)
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
Subject: [PATCH v3 2/7] drm/msm: Fix section names and sizes
Date: Fri,  1 Aug 2025 10:59:59 -0700
Message-ID: <20250801180009.345662-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688d00b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=BuD92i612R-MOt5tPB4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: dvLhNq4vy-UyhudbIhjYNsTk7ZZMs9DY
X-Proofpoint-GUID: dvLhNq4vy-UyhudbIhjYNsTk7ZZMs9DY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX7dYhVlcfVhYb
 iGNm5TD1yVELYBhtl0drYQVSNuvXCqaoMG8gVvEW0JcoFfUVWFrjlem9RQ9eEWLHp98is8+MoAi
 v4h347h49kffKodt9bimrORyw3zazihPYhloqWpLZmk7zev5zLCoctFomBwgVPRi4V4LE/RoHip
 g7qPIhBCRDPLLhtW/5Ib5+IhLNljQsrVkAbrGOAP66EFeghORiVgTGwQ4uX6NIYk8/K3svz55jm
 py4PvNabrgHkQ0r11qmuBvUHDgpgUkjNw+RVp/w5FEGd9jx0Qp2PfU9rLn/QNnC9PLGP8VGbeiF
 rkTB7SEIOU6b8pYCk1rIQsykfVp/qdk8krF19fb4g2zYp7qqPcbJJI/EjHDtIjLfNVTlIuodHjf
 YLFogPVXhqD68V6auryP/OZDnE2JYI1krp15PrUf+4C5LIKGTc0eTJ4ho85Cz9PAoGmmvhzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

The section names randomly appended _DATA or _ADDR in many cases, and/or
didn't match the reg names.  Fix them so crashdec can properly resolve
the section names back to reg names.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 24 ++++++------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 95d93ac6812a..1c18499b60bb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -419,47 +419,47 @@ static const struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
 static const struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
-		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
+		REG_A6XX_CP_SQE_STAT_DATA, 0x40, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
-		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x33, NULL },
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x40, NULL },
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
-		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x33, NULL },
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x40, NULL },
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x40, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
 };
 
 static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
-	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+	"CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
 static const struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
-	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
-		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
-	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
-		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2100, NULL },
+	{ "CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2200, NULL },
+	{ "CP_BV_MEM_POOL_DBG", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
+		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2200, NULL },
 };
 
 #define DEBUGBUS(_id, _count) { .id = _id, .name = #_id, .count = _count }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index e02cabb39f19..b1f8bbf1d843 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1299,29 +1299,29 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x00200},
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
-	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
+	{ "CP_BV_ROQ_DBG", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
 		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
 		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x00040},
-	{ "CP_RESOURCE_TBL", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
+	{ "CP_RESOURCE_TABLE_DBG", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
 		REG_A7XX_CP_RESOURCE_TABLE_DBG_DATA, 0x04100},
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x00200},
-	{ "CP_LPAC_ROQ", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
+	{ "CP_LPAC_ROQ_DBG", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
 		REG_A7XX_CP_LPAC_ROQ_DBG_DATA, 0x00200},
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x08000},
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
 		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x00040},
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x00040},
 	{ "CP_AQE_ROQ_0", REG_A7XX_CP_AQE_ROQ_DBG_ADDR_0,
 		REG_A7XX_CP_AQE_ROQ_DBG_DATA_0, 0x00100},
-- 
2.50.1

