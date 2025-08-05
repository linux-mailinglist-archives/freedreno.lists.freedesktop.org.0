Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0FAB1B8AD
	for <lists+freedreno@lfdr.de>; Tue,  5 Aug 2025 18:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052710E6CB;
	Tue,  5 Aug 2025 16:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDHe3jex";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586B910E6CB
 for <freedreno@lists.freedesktop.org>; Tue,  5 Aug 2025 16:43:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575GBGAe005060
 for <freedreno@lists.freedesktop.org>; Tue, 5 Aug 2025 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f
 +0mrcaKc=; b=fDHe3jexkYZwPPGKJy7F2swAdK4gcYfVaZ2ysGacXOy+4tdFXPX
 UWGqAluR34H6so0S3k1StKae49FO0PgTZ0lBdtJ5ST5pvar71nQ1plGOGjZ7zrm1
 Dj1SyALsRk3iiHPlzHthrzAOqlnHDD8LAOsZsZAW2ZNYkrYUdLpPV87JBp4ewleY
 GpnL6AFbZ1pPtaWjf9TKAor+IJLaneI0uhjT62LXdzSSYkKrNo49+GZBIyTuCqG4
 0ytLr5TYRg3cJ0oXO8LL64VDY40AhqU55OmfJ1oG9Iig85nvYASXoBJmIjRKg+9Q
 K+ql863nrxDU1Z7ECEzlC70WtINCktNPlaA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3u54s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 16:43:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b00e4358a34so3055558a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412193; x=1755016993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f+0mrcaKc=;
 b=loJyYxr6paHc631tahPx3TAxYPV4Ug8NeGjat15k5ksvGFMpS+viaI7h9kllwk22Xs
 cbB99rr5ZLmzUJunECA+x3lKnUzEdnYcAxoFLGGrcdpPpgGZuhNogpOZr5u17uv766ay
 9wtqZivNPEokPHGp6c+yU/kjTDTRn22hVZAp2A/43V4liU4VQqVo9WzZf/rTrQmPQ1Yf
 wDOwsnr4EYzr+tLrwHSThGZJLEVH30XQPHEhhST6/4sQJExzLFzK9iONVQMmZiCzgBSt
 BCLoHU+7v29UQe9xFucENQpMfGVg0J1h8A+PrbmpYjJ4xToliXjs/gbDtYixW86HMCxm
 EObw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs3nGQq1ZchoPGqUeQgii4Mssk64qAtGUnf3kEBpvHMqDCBSlYPKBbF4QNGsrfMUaDIr47cAgJmAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe3VOJnH58vqMX0iUcDPYMLctLbQ/w7si6h3GAqTuCC5gqQawt
 axRvY8t1S4Cv6e1ZIvP8201+Ap3LZD+fmivWsFmE52L9eDNS0NAAZNd+whtvEl0LbyMWz5R4EmO
 EDuxhearkm/6Nmab8NiK3rvmHQGp+gD3l3UnQVkir4nxtVKukikrqAhoSKTGnWyMtvPOVZ9klW4
 ob+5c=
X-Gm-Gg: ASbGncu3QIQeunVb0wpehxgzM0EX/5VMaPO2dU6herglck0wAOkUlbU2Z4mSXenjTRK
 C2B3oG7WmjaPz1oT+FKed3AznH2zWlXIrb4JzH4c/STgkDCTVsI89tM36gKLPG7SjdNYFBa4T8+
 rSZQ7J7XJbG7Uc95aupFgN9nhzsxmT9q1jOJnXU+YiU2UdrU7i1LwaMU8iE0/M2jw1IZ0zgfkoX
 5WKTvadK2JakcOi5AmiH0Y78zUzeIwl8b8eMw1qFVhroHtubJYBb98SrPks/SOazpum2ZAYCaiG
 +Kv0xzzltNl9KLAWjAiOBrM6qEAirKs3jQEl+tiL1KV9y8Ck/+I=
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-24246f721fbmr218343765ad.22.1754412192654; 
 Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG19NECaSamtKmV1ToEgyAxx1m7KHOpQTVdLiTHMDu1lnYZHtJCITz8j/23vDlW8kqUI1HB9w==
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-24246f721fbmr218343185ad.22.1754412192122; 
 Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0e81dsm137414025ad.46.2025.08.05.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:43:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix a few comments
Date: Tue,  5 Aug 2025 09:43:08 -0700
Message-ID: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a6X9FTrybd5ra9OAegydEqK3fApER_3x
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=689234a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=q6EcQpUjypoMYbJrLQEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfX08PuraeoM6ni
 B0VpXZjaft3Dp9dXdJOu6VvmBPJywhVGh+bfL3ZFSKuF3n0nTIaCfLc8SOyD9PAsAGSoc9AF5g8
 plgwovpoHj/HwiLosvgXIFL9nQCEhSQqoWyyu/+kkZgn5OLxU/r5ZHgdE5JEM4VUwzV6wUM3Pg0
 2CHyWA5RxKPdsQXBDakCcMcIwDAsCgCcLD7w8gIz1BDtiEqiwCblbU2YVqa32E6+H7TphCJoBwb
 B3IHotuZvCpmk68pXsYzGw4NKTVFa3zoq/sl6JEKfnYFKwtNbLAQhFvxl68q1BmUgqZJYwnJEzR
 oC9PrcWANGcUN9rkKUkp+05pCPVhYGhEBsqBUAuhAo1aj3QuXpkTWWPwywka7vAmDfuQvNudKcw
 rLZvIEt9iy7hf/5Zx7Y4IiIIH50l9ccC4vxi2cfTDuwoowPN3kPRGepyBvY1NryAUzLvI1vN
X-Proofpoint-ORIG-GUID: a6X9FTrybd5ra9OAegydEqK3fApER_3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050116
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

Fix a couple comments which had become (partially) obsolete or incorrect
with the gpuvm conversion.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 88239da1cd72..751c3b4965bc 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -100,7 +100,7 @@ struct msm_gem_vm {
 	 *
 	 * Only used for kernel managed VMs, unused for user managed VMs.
 	 *
-	 * Protected by @mm_lock.
+	 * Protected by vm lock.  See msm_gem_lock_vm_and_obj(), for ex.
 	 */
 	struct drm_mm mm;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d1f5bb2e0a16 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -319,13 +319,10 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 		mutex_lock(&vm->mmu_lock);
 
 	/*
-	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
+	 * NOTE: if not using pgtable preallocation, we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
 	 * path, as this can cause deadlock in job_run() vs shrinker/
 	 * reclaim.
-	 *
-	 * Revisit this if we can come up with a scheme to pre-alloc pages
-	 * for the pgtable in map/unmap ops.
 	 */
 	ret = vm_map_op(vm, &(struct msm_vm_map_op){
 		.iova = vma->va.addr,
-- 
2.50.1

