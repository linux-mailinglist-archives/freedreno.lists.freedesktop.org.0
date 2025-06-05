Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3BACF6EF
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A6F10E9D7;
	Thu,  5 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhVw0kSf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AFF10E9D7
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GaJ9v032471
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
 EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=LhVw0kSfCagt1hE3EbqQFhcSwTz
 jNIZhPETxbdWpiKNWh6SlWzzz8pI2sQz1VU63FbymNH1wz6vxjP1dwplO0yJROus
 y8EVElidhgJ0V9BMT5abry+KJwCJ4ngUa2xfOUn/EYiEJ45U0tCXivKmC9GT0gzq
 rWnTgT4ANyrHfr8X7aPcZhSc10Lek6wcad3/S2kSDCaWYUmtX9wYwfOnZZpUexEf
 qXy/w/xsVRRcyRuyHw8Aq60gJve0uaHzmlIja7UJFPdzEkOE+tpuBLyYtBm6CifT
 8AnkqBdcBuP3OlmoOhHvGkhk+71q7Cvvq7yMI3xC0WhD3JxgpQTuvj3c0JA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-31327b2f8e4so1228184a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148400; x=1749753200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
 b=OwKueTyj6VFyvuCLEKi+98ag+TQUDmoxaK5uq0Dpi5TjPFg//SdINGNGumDIb0dpsF
 8Vk0nYSr339o4B0sJ+fPekgS3ZwTiupw1QwxRkTUCGIKKLFkCvuofUjre5mRdn1PF9co
 oNZhdyLxYi9eCvcZbBWMfuHlyvb1T4uNBQXPFpQF6x8/etDXpP9I7g462D6UIUVBHc/G
 v3FXLV8InDfjOK7jr0v366lYzaE5iOBS2E4QD89NlhDw4rINSj28ABFocjsrNOQSk61W
 6rp0y6n7cSlac8fJ0p9XhfHV3dg/34om0A4vmS93cosFlUhxWLw/tL51k0eOK9TrmojG
 GvVw==
X-Gm-Message-State: AOJu0YyOVvB1y6xS2A2p0V1rlguPclUbsHbIZmphZsuCF2TO39UNUsaJ
 YOJOLeC4wagdndYDw6b4jQqpDEXhOBBC14Ndak3GC/0BVdELtq8/eccgPCdzKF6VP/KPw4dFJRK
 6LmlcFSnajZqD1LU3B7Z/BXfrdM5iYkyJvyAK99k0N4M/khsshSRPdGlXImBYwwsZ/QzoXG8=
X-Gm-Gg: ASbGncsQB4a8ZbU6wTlPn342aJcghHiG+i8JqUHKKyglzJn2+8I5PtnATj+i5qe/nA9
 eh4lV3sYGq6IH+IjaftQCdQtaTfSNmuTfj1J80TJONqComXiIxFMgQIH2nTBy/anAPhs3p2p06Z
 P7wmTZeGQmR2u4O9BDuHTMDyd+lqYyHMwKBzQnWNtFzfu2KOZ+ozTV/9gcXWXVp9HFleX33feGL
 HrZ/PIX9CY++o8r8eTZdBEcUY/Aa3Mqfa+OqlcFIK85J8iFQwKK2xlLYNC+iZ+xlsCk1IwvTazr
 55TRWrYFKKsj5HiA+8Efs9X+Bm9KBZD1
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id
 98e67ed59e1d1-3134706f8efmr1045857a91.30.1749148399696; 
 Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtRHbayHnOG/QPhFRjld2rJq5hRHHtm7rPI8PxA2Bd1CySo0EJuFhDV1n0cRcHKai1dDS1Qw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id
 98e67ed59e1d1-3134706f8efmr1045803a91.30.1749148399107; 
 Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc373esm61635a91.32.2025.06.05.11.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 36/40] drm/msm: Add mmu prealloc tracepoint
Date: Thu,  5 Jun 2025 11:29:21 -0700
Message-ID: <20250605183111.163594-37-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e30d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6UM08O3CsWmcvIwysnKp31gQwsFBzM1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXzVi/a9KI3459
 l7XxghiQYfooMUgW5VSUUQj5b4hRP8LSkQxIuJ+a1P15pfJpuuf1bmatoMgPnzW8f419qXjOrDp
 kSqp4TPeBel3znMM/yj1V8Jq5Cwfb3p1ziDg2BSoB0qtqy0Np/7F9/oqJsrnWElg+U1JS/wTRfA
 ahMfqx6zk8kvldWzGTJvtyFqX2arLfYzjPhK66Z9pSCwwAi8tZTXnjmTTdq4NWztXKTWikh0DUH
 SxUOcDU00QuxpwvfqS/b03X1bQBoKZLeSUa7E1lFMZWla6JoW7iq+Dl0NOCEO2FOecZbxPerFdo
 JstEtA7FLAsQhL2+7ODKtcSU7joqjYcTfN2YT2wMZRZSt4YdjjH0PwhPDANh1wPptshbR1eDpyD
 ugz3zmunnecBZ7a3VvNxNNC6LaKV7juUB2xiFdXVio+H8cnWjtY8xRiA3hpE5q4bgLBBmhsD
X-Proofpoint-GUID: 6UM08O3CsWmcvIwysnKp31gQwsFBzM1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166
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

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d..781bbe5540bd 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,20 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_mmu_prealloc_cleanup,
+		TP_PROTO(u32 count, u32 remaining),
+		TP_ARGS(count, remaining),
+		TP_STRUCT__entry(
+			__field(u32, count)
+			__field(u32, remaining)
+			),
+		TP_fast_assign(
+			__entry->count = count;
+			__entry->remaining = remaining;
+			),
+		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bfee3e0dcb23..09fd99ac06f6 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
 #include "msm_drv.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
@@ -346,6 +347,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (p->count > 0)
+		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
+
 	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
 	kvfree(p->pages);
 }
-- 
2.49.0

