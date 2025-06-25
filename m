Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE28AE8D8C
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8710E7DB;
	Wed, 25 Jun 2025 18:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9T/rjxq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E97C10E7EF
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAXAPt022698
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
 EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=P9T/rjxqUMR6cavrz/lgkUrhCUz
 DN/OtrtklgG5Gq0r+xNFu9IswxkwPWlCs91mPtSma44UBle2uz99UVmUUpSHe12V
 flHGUKwYppSBSdFnKRLuH0YZ9R7mhVDenTwCFWevlMs2/Vsr85weCyBJ4pgY1gEw
 T2McfsXeoFvGmOOA+joewFvy1Ugm2tM1nX5H0AE+ISfC2W4gYygccRv/Syxs2RAF
 nO7K9S8zCqDNcuPQWz2T/O/sChmouMuihU9wL2jnpAqgCZav3GYovZB6JK7Dq0ZW
 NKsp+It9Hr/Wi4AhhdX6q+OAGLk9B4I0DqCbXdRDLdK7ILkAVihylboiLWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fapqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2fa1a84568so142228a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877960; x=1751482760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
 b=VndZbGqnJGmnfTgR1QcC8R1M+5Y6hxFf1yRuqScouYGv/SIRElntKgLLz4d/kt39Cu
 ZcI6fSDCMQX6ZKcTf3TkaQ5iYn+e54DzEIXGKfzMNrdcbZRzSFupBVNu/GzFC/HwU3SK
 n2vcJYUcoqJr8Hpn4IE9QDOtLM773Obf8aVjTdTVmHCyqWFGgVzT/VL3hkeGjefjjT+2
 DddU3V9dDOkWmJ8SoSLF7T+4i+BFPK4+5b1OWUNdc4n0jc5yGvv7/IIXNw2R0r5FYPwq
 JBioG7mnPFvg9GvB8+TuCAoiWOPb0/qbDs+zwwbjUkj1YJ7gzrHJ16tPOfhpTCO7gWro
 Y4Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUYDcvrFFsVMzGUWHWdogNQUZbQSW8es/S2loqSEduaikE/hMv83d6Cm7L4rD9NPgZKkPgIASAd50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/7Lp5N1dxmGasszW5TUcT33SRXzr+RsbzDRXaB3L8G1t6yzpa
 eUAQ28kI9ir4Pru0KM9xpOjguIOz09EzSB89ha4pWOb9IfBqYQ8iMtOAnSFr0BDlziI+s69UsPH
 blRDO4MhJ+FwHo9MZVsZy75Pk1G2j3mpW/gl9VwLTOp9dvKBR5F92rNDqc14kJHRXrHqaAgVj7T
 BNRbw=
X-Gm-Gg: ASbGnctbo1QGCwkqdF4zwqhDBsePJ4fZUKdFVbDhVCEWLOmsep1q+KXVKMwvCWZ6kdg
 7JcsgzlIF6zEm2q2nfLSSVrBLK8bWIY9ySeUdW9poeTX7AtRUFi+eEVOtroZHJZP8xvzGB1Sdw4
 X1DY60cbKyNlOBoa9U53hlwqWRXEjNYGAPmW5TO96VvnqkGN55voW3Qgw5nmZlxTCJDf72C/4yi
 kpEMAWXflhYZk4FYsXRc19fEaFTk9X+ZBHY+TGQJCKg0OCQMQKseOgc5pzE3vYce8Tpxz26W9ED
 PDHIIAOUZDwpaVBCzwu4CUBV83UFkcPJ
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id
 adf61e73a8af0-2208d116316mr884055637.11.1750877959822; 
 Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmJ+IhD7XkltkNbiUYif6D9uQ/Gi11DQoaOwAXBuNqubE9zV+mGLMYWUUTXdmancoD07qNUA==
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id
 adf61e73a8af0-2208d116316mr884031637.11.1750877959453; 
 Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f126a7bbsm13319342a12.69.2025.06.25.11.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Wed, 25 Jun 2025 11:47:31 -0700
Message-ID: <20250625184918.124608-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfX0iuX/P2dXCNq
 nj2b0outl9k975rn+3QKOvIFyjtj9FbDiOn9ZjbyLwYWdTwpTqVZ4WCcvw+kE0HAGtr+QCRwt0H
 FN5CqeKc02HJhIcuE2FxBvx3DApVXc8VCBgRL6KVuCVeaNjrDwsYnZGIGgQK/BIoUnK6L/WFMwZ
 SjAWL3BA79CDy625wzsh+5za3856OlzBRvgtHasbzfDzAR/mvlWLVtB/BvXoqlHHF8S18YZY9DQ
 RFz+EnTNuo0OwnrGpfHAbpRY0V1h54sfxurvAk6ZZMAMuh0Xy480qRXVBf124EbGwPPHqn7ObWB
 cbAy45oSbuZDoFTGLo3eKUPqR7VfktodigolFWzvgC2vKz8psaWpXUkycaVOwQ4nhpb+AxwqpzX
 UikMCna16DTBOkwwY4JgUoEb+2QJjsxTEhL1733NG+NDiqmwUdn4zYrQalK395USMLtrCid6
X-Proofpoint-ORIG-GUID: oGTs9JyM3oEmvDqGXl0LgRoBwTBZWGqR
X-Proofpoint-GUID: oGTs9JyM3oEmvDqGXl0LgRoBwTBZWGqR
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c4709 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142
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

