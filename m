Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEAB0906F
	for <lists+freedreno@lfdr.de>; Thu, 17 Jul 2025 17:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FAC10E843;
	Thu, 17 Jul 2025 15:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Qcr1D1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61EF10E842
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNM5s025177
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD
 4qnNkc5o=; b=C3Qcr1D1NEUcWP6EY+2mlCyQQfNqpNFXdRT6CEeOShwlyLY6upG
 NvYLb8oYruljiKwllG+0oOpWRm6Ism6qOlxpuxMRtt3rT08fg7JMwOM21fy0t0u+
 n8nEuIS24IeIrah6IxzHQ7SIGbZwJjH+VgieZ8kamfe6db/JnNVH+cKMm/fjGxd+
 psGrYB00jA2ANjF48EhZIh7q/wW5I1fkpcEO+HCGF4kJKt1ff/CY1/kScqmkbZsQ
 sDaRcHIrFnC6DB2E/1XhysUcmcGPyd5QIH8fee7wewLZ3zD2pVFwtQTrJ7SPvkPW
 Ez2aNx0AhXPfvRejnGaUCKBYGyd5fDVAOSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqcc4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 15:19:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313fab41f4bso1380853a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jul 2025 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752765575; x=1753370375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD4qnNkc5o=;
 b=lNwgEyk1zIGlADdGxRisNlG6jQe+D4BQlPU6wB4c+JiUatNUUEYFT+gkKWb/oGFFKU
 XATiS06J9IQiqr5QiYu51A7xPlvWArjebAUTeoge6+K0087t20tdn0+P+juADh+A8/9W
 RGs5Ck4b2hHz8hufK6xiO1Vd/u/+zFaV0RRKHU/nrs+currvQKmpRCRySzpPKNCZS2bE
 M30GAy6Od2GOQhlqAcrUCBRW/9VGzwf9MsYVu+vpVZ9kEcm8EIVGXy6MCWqcybaAYcUd
 dvSa1spvCZoLgGIUoSWMTmw2lgi8sw6UnF638H2cYYgZKr9cIvDBPaazAlebqICFUw3N
 neRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Y1/FRK7qhQbH+PxNBV4zKqs2mGLR24xSjd4q/+HvvaqF34F0ut+27RDPuoI+/470OCaF+0hif/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJfClOR6DsOCdwdXzwlftJq7WHBnEv4cRkLYTKTaKlRI7ryLvF
 xFQYFKkr5pTNst8nDDeJ4zG5wSLU1udcgnAuyjvK7QLFM3lM0GVWf94uqxKE3Rbu6pgK/rnMCwn
 qooIs8t0SffxTfFAueZOvvixJSpaa241uAcqrTndTm2vrkpKBwZ/cnGdMg5upH/kcIO8/fJtAyd
 UzrGc=
X-Gm-Gg: ASbGnctSeeNVfwHt58VpGe4YYN1ieAUG0/I7rB8ZAzGBz+qYX33dmZ0W9AGP4ziTNJS
 2t0EeZUIC00YWKGpJZP6UCmCamMP3ISxrXnbAIG4L9OgMHkmwM+WuK78sj9EHUUu3GT6zhl9gEj
 OEF8KIHi1lOlIaGnz6DE9RYniAG+bPMizBDhJtV0Ug1BE8RwijyQXNKDcjeTnnw/rV+HsteAieP
 V+kjZbvYP+ulwwqGJRtg54c0LLZIvG/9E1tJICnyd1smLBq8/FBXu2khOmYW/qgp6kyAOlLAvB7
 wB+K4Q9/jD+9FVN/rqABbIbsfaLhbON9eN8dwSJL4F1ETRgTmHY=
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-31caf85e029mr5009412a91.15.1752765575374; 
 Thu, 17 Jul 2025 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJBlIDvX0IMhzg5s1vxarPavrcpaAW/SghWPjLESXyVamMIaNFxD+9sBYlLjBFgfg4OT5j9g==
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-31caf85e029mr5009375a91.15.1752765574859; 
 Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7c32f7sm1708090a91.16.2025.07.17.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Fix pagetables setup/teardown serialization
Date: Thu, 17 Jul 2025 08:19:30 -0700
Message-ID: <20250717151931.10228-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=68791488 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ufhHnk6gINzqDhHgaV0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: _WS7n3L5LKkoRktl-qLuIe2AU9sZmX9i
X-Proofpoint-GUID: _WS7n3L5LKkoRktl-qLuIe2AU9sZmX9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzNCBTYWx0ZWRfX+ZdllVw+GT9g
 jp/ZlssJ+xl+TrnXFkLkYwehcmAU9Q2oEQYFjqKJbUDRYmbZqBUyGFfQco3+gVAm9o7GJ2Kb6SQ
 7G+m9oxokpV7T2bbmpm5n7H1z/jsg+awTU7iGS2EuFVnbeMi3DKHvRwsWM6pgPLDf7p0l+yZFiT
 JwLJ1duzO8zXVUdg31b0pwmq5HCBfSquFuWR3gDHLaMUE+wBJaLAxOPU2xHGGGcPZ/8WovIEyPX
 4yxiLvnY459O5ma3H3DBVZVfCJxQvsAcX9krUA7edZXj3x2vtQruYFoSoEDPTBnnDDY2WT3hruQ
 UMkbWlhzOG0X+W5VX+cFh65LKI+YZCwQs6lIiRyLUiUXUI6xUKEQt6laCdUNccXCXkA76oGpuaz
 G+5gowxoc1vtEqEIhn7K8+RSB0ysq1OA04MUd/WrwJU1Uy0xeNRTcp4VBUYEiI60EQkN2r2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170134
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

An atomic counter is not sufficient, as one task could still be in the
process of tearing things down while another task increments the counter
back up to one and begins setup again.  The race condition existed since
commit b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
but got bigger in commit dbbde63c9e9d ("drm/msm: Add PRR support").

Fixes: dbbde63c9e9d ("drm/msm: Add PRR support")
Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index cefa50192391..89cdda73711a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -14,7 +14,9 @@
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
-	atomic_t pagetables;
+
+	struct mutex init_lock;  /* protects pagetables counter and prr_page */
+	int pagetables;
 	struct page *prr_page;
 
 	struct kmem_cache *pt_cache;
@@ -227,7 +229,8 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0) {
+	mutex_lock(&iommu->init_lock);
+	if (--iommu->pagetables == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
 		if (adreno_smmu->set_prr_bit) {
@@ -236,6 +239,7 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 			iommu->prr_page = NULL;
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
@@ -568,9 +572,12 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	 * If this is the first pagetable that we've allocated, send it back to
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
-	if (atomic_inc_return(&iommu->pagetables) == 1) {
+	mutex_lock(&iommu->init_lock);
+	if (iommu->pagetables++ == 0) {
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
+			iommu->pagetables--;
+			mutex_unlock(&iommu->init_lock);
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
 			kfree(pagetable);
 			return ERR_PTR(ret);
@@ -595,6 +602,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
@@ -730,7 +738,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
 
-	atomic_set(&iommu->pagetables, 0);
+	mutex_init(&iommu->init_lock);
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
-- 
2.50.1

