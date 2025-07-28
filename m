Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE5B14348
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7195510E590;
	Mon, 28 Jul 2025 20:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVH+Tlln";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5C610E002
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMqZ012164
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=A0+lIarkug5
 bI2XIrG4czP8gMx8w85UfEvs/RUlisrI=; b=eVH+TllnKQmh+pn8Li5q7mtiA5r
 teO23vGhVz372m5F06S0sneA01PZmQMLBtOr8PfuCtm91UC36diTq/BDvYfp+XLA
 5N1ZEnGSAQXZM+4m9q/aDRNCo3RmdCv1oPm8T3FBVEMgYMjgecjbMpMg5co0uatf
 EPTF2cqwM1bX6qYjJWKl3gpxV0mgc0ojGUp367vC+bLp3eNrozTEBMXhw7N6ETN8
 JHCWo+poPGUf5ci6hKgPHHefemzZGxSAGn3tG4rsN0tJyj3JCziNmAnoOoGcAmnx
 PaXB5VyvIAGDQa3U9HEjMke9RWeAOTn6pbU2oVELhvtI1yBy5yFL5sbOpxw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk5rt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74b185fba41so4595305b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734860; x=1754339660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0+lIarkug5bI2XIrG4czP8gMx8w85UfEvs/RUlisrI=;
 b=m/vpUC8nV7am2TvxwGlEp8bOR5WTjhFYbd4RxKc5MeVr0knKpPbV1HuhHytEVSvCaA
 h+yeinR6xLJWoOXGbFiCIXyj6fAvdY0ULJsFOvnUqDDdPkgfBzUimziIbDIFkc2K63kg
 wu8tU3stGOiZv6PGL75UGuMcIIaY2UtMbR/gYTj1bN09Owd86STgjn3Wk9CAVqATudym
 7L9SqQIJp5yyGk9SqJY1ZEh+TxHG53TlJ2OVRU+wQzYtpwbX4OTYa2QFrr/fCn9hwKWT
 fTNkEhGhknkduDCydi9zrybhVjvDo1ikcEwea91znno3nwjyzkDLCfIJOMdKfUuPwSgk
 T5Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhDZfVZ0m+beL+K5kwB1WqnY8Z/0VG8TPyj6OKKmnamRM1DTqM14gApLACGF6aMp3F713yhr9zOgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUNDDiFpyv5RwbMtlFxOCsUHZBIcHkfi/hQS7+Y3rwcxhaG11F
 eTJkD70+/hpfmVsYP0ULzknqkVeHcBykrfCmlR6Osw4TKMgImYuMmSwjLp86vnPQ7a98LokDunH
 p07ciQAkC/qN8clSFmAWiYqVtYgUtn3PvJsvITiLEuXfaIWta5E4IKqkdeAd8gCXM/LgrbRo=
X-Gm-Gg: ASbGncvs5QDjRfrKBbKzCftB1oV+389UcC0D14KzDyzynkWNM0hbJFnaHG4QyMTy5Ck
 OWVgdBkI8F/P/XsVAzE+Pdu4MUBYHwU2sVyzU+eLjUnggxZu7ROrzoeFIh3RiqwhJ07ZCy2Fkb9
 p7yBQPutneGly4/jerGXXlMcNhKKedQ7exwi0MejhzMiFEU6exYKrjIYOBs3c7ACoZCu8HYOglV
 kwzi2E+GRImp/eYG007ZiUJPmEfteH65uQ8qsZ5uRjyc5Boec935uwmbHKa8avlCCM2LQ1cLr47
 eE0FJBsirH36dcDRfevhLWlPT0zAtpSCQj4CL/1iI62lMfHAgMg=
X-Received: by 2002:a05:6a00:1384:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-763386bee18mr19109541b3a.14.1753734859630; 
 Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2U4D3i5dSnzRYsZjd3vL3u5W2DMJmemVWB+nFUZJ81pGCKxZrWX1gOYjxX0lk0X30atUWdg==
X-Received: by 2002:a05:6a00:1384:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-763386bee18mr19109519b3a.14.1753734859229; 
 Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c02706sm6282388b3a.39.2025.07.28.13.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:18 -0700 (PDT)
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
Subject: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Mon, 28 Jul 2025 13:34:01 -0700
Message-ID: <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6887decc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: YK5yVV6KN50tWDYyhq4Ih-qspeWbJWMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfX2FxnMVY3WYDH
 SabWom4blRw6EyxR0trVzIX3RxmuqF2Wf6HJfuiUu5EMoguoc15HfXBuxgYTtJJlaLGSL2GB7MV
 b4TEL8zm8bQTkNJhgjhF9y8GPpkGeRHsjj/jjzpRBY1Ij8mIbpFe2TXLWzbpJDhaeUHipd2mpA0
 FJgwfzuZX/Bq/I6lkBShXY84Oatl03qslTN6WVJRdo8yTVXzTS7rD90bu5gOjCjKWre88t2trL2
 J4TRXdpxbFtMJX6XKD8ufPGyrN7Xy0cxyvAhj+MV3oriAihJoHCcLu9gGa7aKe12GIUGZ4l9PIl
 wBEEFpnRwNST79GEjMWTXTyQ8ysgqYNx3e+Rc13VK0pwyjSpuEVh6mz+ZWSo5pwSXMBoDw91/Bb
 7djKMJDA1b+KQSX3gxDPtJKET4bANsFV5R1QE6uGOlt8P/AW3RxLag0Mlb5VIU7OGuv49Ql/
X-Proofpoint-ORIG-GUID: YK5yVV6KN50tWDYyhq4Ih-qspeWbJWMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280149
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

This is needed to properly interpret some of the sections.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index faca2a0243ab..e586577e90de 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1

