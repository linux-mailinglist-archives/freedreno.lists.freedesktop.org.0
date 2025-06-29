Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A25AECD57
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0B510E34D;
	Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtR1bxDX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222C410E358
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T70oZA012987
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
 vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=QtR1bxDXoq1dpVHguN0qwtmvC4Y
 0xC18TAnzct4aipM6HUb94TLMrrCAKsP60bZJFPIsgOe2s0DgsONMSWzseKdGXgn
 twCKv1gfnAGO3FObyCtuEdEhGDD+ulXJn+iMNSaCZW1QNygoMfx5w6yaj5gBNIQp
 LkBJDFS5H1Hac4sYN2Bt2aEpUrQVKMH5LQYw/mqxQ85l7wj6hDTZKAwJhsz9u46I
 pG/Vx2U6r4U3p9LSsIZXgKYHsXkItu72ynwuONtWSrmBnp0HkBjY7cVa4VzWpGPS
 MPOvBWqwCa6qvpJoyf6fdYRRFR+Pz2Z96JIenGdByZyT4PCqjrsFILRe9Cg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2eeff19115so4963431a12.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206096; x=1751810896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
 b=F91zjPPZozsrplq/R1SLSwrIkOM5qyMVKthuwEw2swcjFXcRLC64PdxtqVkLDCpHWY
 7GQDr++96CmX+N7tjjKQhA8AgqxotCzbNCewftztkl3deZjkxuikVKp45rYjiv6vKgEm
 Qvz18a7TJv/XyaZAK/ATWThX4+ZUfCmTol4vM0umYhLYseTJDDioZ5tKFhPOYztYt8dM
 Oed1AnPnrFKqXU+mCJYX3+2/K/WfpUAJDiGhJj+vswWulquUyZvuMv5MGdvpK6tdBmXp
 FIGQFobNqR6VJ9NxUKoTvAIbhR9MtyYVJ8Ss61T17KrnUmnYXX1ZOEM4EaAoXZY3ID9Z
 WYZg==
X-Gm-Message-State: AOJu0YyFgo6ZGsdgDA9qXUS7Zvbi0XleGH2mUihTDrZtIMHameAoD6OU
 T/2EXU9WoaftlkG4iEeaPbbD65/4nsukpYw6teo6qEAGsqdzCxFU4ii+celxEeSi3gdPLuNMexW
 Uw1wTyEbYr0PaeIzuq4tFB1pXW+J2IZCZPbLh6Gb+GX9Eqy53AmKLFUigxN85JoPJBylK6E0=
X-Gm-Gg: ASbGnctXaOeuZAfZrsuB26tN6Qsf+6kngRag/Ik3krkkVY1yuslPvhZTUzx2SSUM5GL
 cMTDYNhLMho41/lXZJ5VgbJsW1ihXvgfIyql6nF3b2cmbR+E/F0iPon5rCgQnucIYeC4dZ6tfRL
 b2xG1lngPMbsa+s7TZjWVNg0vgafxsYJXz2H6db8bIh9zJ9ZHQOdrT74zy6kpuzH8BbKMVkS2GB
 gYW8Y0Tn9RBn/8Rk4YM8ej8xgzGk7UaYH4/HsMyZfjIUVbgD0rQxEo2DMiwB9OAo/YVq9hHR522
 LKRdMZ121ksbE24kYUM59KagoRQkvWGb
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id
 adf61e73a8af0-220a18343cdmr17849615637.31.1751206095968; 
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfYDkWzgCDdpgGyHKdq4vr6VIPmal4jKOqqpi3gamCdrIPmrcPzY2NWoSmG5zIgIYn9cnZRA==
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id
 adf61e73a8af0-220a18343cdmr17849557637.31.1751206095533; 
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541c369sm6676309b3a.42.2025.06.29.07.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 07:03:41 -0700
Message-ID: <20250629140537.30850-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX8zv7xMffMXf2
 vsvD6yetwM2Wa5QnLuHB6FN03jAjngWpPkH0CKo3nXr+SNb2nkTUqXYPWvkNGv03Zpgnjm6YmVR
 dyCVQaHfThhaMk/IdMJi7AoVsANeDb2oAgCiPQ9Hs3gfOcvlsiAxAjHl1c2di3bUs1w9XW7x0x8
 7wYobHRJJcJ/mEadIqd47E9PIZtzr2/FjqyEqjnP4uRye5KpD64PGPLQn4QEbk6UHhianeZhaVd
 fBf8JbSkDOJjPwxymY4t98RfYyXl/Ubne6Yd+JWMzQXk/6lxPzxyjtzeePDVXyXkeX0fAFN3XOo
 oYWlHNza1UIYBh3R7BA5iu/r4hfhOEtA/rlb++r2eKe5KEwe3aLvu94DGiXE3tO2tD2PZE1LOtr
 1OLMbJc7xUWeD1jIQuSG3vfBLuVVFd9k9sCEeShPJpPJfnkKjHvQI0vR2KKIkpUrLXxh1eNZ
X-Proofpoint-GUID: 30TrDT-nUscelel4H-uAjXk7aZmVPLwv
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148d1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 30TrDT-nUscelel4H-uAjXk7aZmVPLwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
index 887c9023f8a2..55c29f49b788 100644
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
2.50.0

