Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF9AED099
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708610E37D;
	Sun, 29 Jun 2025 20:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+fjg4A0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38610E37A
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFgLFn022356
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
 vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=P+fjg4A0RZe6REe3XrkoPcZmiE2
 OcTh9tv7DwGlIzx2RC8LdNJZNsqxuuMYRM+aL0FhYrNgxk6qJBt/FnSKIyqXQ+Bd
 WV1953yLX6NW39Ns9BklbuvSRNchtfwp9ndDR45xf1IVhb6hfyPgDDjjRgSSwxff
 1lU3Bn8F3aWOCRU+Ve7zQLtqyPJXXna72nx3aAVxiTqKD/KV92YrDibrcnLH6NiY
 DPBD2HMtL2BQi80rxpJYqotdJiaW+hmH7akgXgEflBwdjvTcbNyDY2/YjycPnmXY
 DvAcrfH947y2/u0VG1YZc7lqDtRxjKObMAPWDo/Pxe7dcArHpzlXJYMAwzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ak1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-748cf01de06so3610028b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228234; x=1751833034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
 b=OrSyZO9hZaZJLeyf5usd3s/bybzRiiEJVSyI9+geCFans/EO/n+0OAP7g68Unda43+
 +v2qi1hG4/+BPjt9p1/FkpHr+pGJyz+A/tV6Gww3+LqdkHmIiPaUudxyj7egVSLQJl1R
 DOjnOiKItvYCBvIsEejRKDYkYI67eCmxoTDysn0AuHxQM7y2zGY1wYP52YEqcWy8SMc9
 9MTPZCNE6+XPqewJVCZzP1GHd2w8+h+ob3lH0YaLg+NmE+HMBRZ+hSS0nCu+gxeTELZd
 5lO5lEea8/qpoVaSSB8GfomcoNkfxOsPp7WrsO91UrV39aUcRlnEHm8bOOfAjXDVQuFM
 dcAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiUbqN2tcqqObiZScne2bzqBAYUbx0dpVW8WOdpIQtvAYxwKbhae8A8KH1YPZjn3yn/xijHe/Ml1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNNmTeGXDKgZmrzRuG9UMTvoGs9yqG2eS0uZn93i6Jk0KC42Jf
 hSkA4EKjne62RLMJi7Vs50YhEY5dSp60IpAl3LSHRrvuZNSat9iy9hPlB/zqsh13X/Z+e1Ofysp
 nLqhg8F0ufqjflPxnAOfVKFySUWR/nbeMk0e+ZsJnk+ZNftgVdyHZhEhUU1REHgFAMo8nxuo=
X-Gm-Gg: ASbGnct8OVVJVBBRHwaDVtnP7c5APE6BqUysV9JWQ6hnDymLccwdk7yesHij0r6akFW
 53iiWP0CJ5UKICpBc7t2LrCFqEjLwCLtpSW88tlkHlq9ZMqLYtSvAa3Yo7S3Ks2ykJd39CYS671
 cxvCN4k6N1HPLMWxNcWL4w7VmSfy7uK7JFkrVZcAT6xK00N2le14lTVOxgfcmLh0BSfZuJ4seW/
 pKTco77UwMbZgLEUDn4QvH6WLLftNDYiohmZFyFsP5pZ4/aHPy9nPjb48FRS2VU8f5Vy8C2WXc8
 qkmRTXHxgmztAT0XJxzE9XoGm0hss+bnrA==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id
 d2e1a72fcca58-74af70a825cmr16437196b3a.24.1751228233851; 
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpY4JD8XXzpeyT/cFkQnTv9hNBJBrOs2mriXfKg05KpBh8dREEFouJKKLOYU1fqTJGyyiJw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id
 d2e1a72fcca58-74af70a825cmr16437173b3a.24.1751228233466; 
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57efae1sm7273234b3a.163.2025.06.29.13.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 13:13:21 -0700
Message-ID: <20250629201530.25775-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f4b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: jRuPWqA1hJXvovAjW5Kv8Arm9XMD3g_g
X-Proofpoint-GUID: jRuPWqA1hJXvovAjW5Kv8Arm9XMD3g_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX22EpMRMb6rLW
 CFrqpOn1HBn4hnmuSAmh6EBuuDHuZSNk9hQBdv+KRFuVV/3p9OLuXo7YT/+ULPayxi8vbhexVjJ
 WP/+hu/Rzvj3jJQ5v7tV67ltfN+siRIwqbXSN17yTy+zedsW9trCkXp2t6gF9tU3vDUwP4/BYQD
 Afjwal3LvoYLHI3onVtF7lc5UNbyOo7lNZkFEhSzyepO1FUb48durWBSjq7wNsWI3JaoKGzp33B
 J6RL+AYCxoWPVTNxAvhHVD3Z7W4QKKseWsOkBUskMCumxNM77lKGNwHTytj/O/itNY6LVTljG3/
 Nb+Aw0mLL80KwtAp6uMPDJjPrmser9bK9slwzexC20zWLbxwBfIGdYhE0Ic6JETiR+qelpY3GWG
 YaAP+tsdmrnc/+/6ATy6nJTzrJjOlaWCkuSIZwCHOTkVPfJ+8z7YUVikFPgWSyMOl1QF+eNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

