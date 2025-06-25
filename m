Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C609AE8D76
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1F10E7DF;
	Wed, 25 Jun 2025 18:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFGV5HrF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B2410E7DF
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAcrQf022979
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
 lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=pFGV5HrFiVHgGbMsigNsiN34XeL
 V85NrU2arxrLMhWzSknYErzNud7rFy1AoxahQ50iQ5MV+R3gcPYOGziCAxFYskJW
 4qwK1MuxSf6SEQQ3ait4roeXZnj9GpvXSCMm8CHWBTNN+CIOxEtmyOG/FG8bG5rY
 y120oAcUqDBgx4ETAdMbMeA900xZlCIhad1KInMlEKwtglPCG046esCod4mk2epg
 RfmUXOhQPu4wjcjGJEynqnzN4/wReZvmYTnjG3jOZg3ugKVKfaByMk8PP1FlBRFP
 bdUcjX5uSbiMn1JVjhS4vBzuUi2QTWzZI5Ts9JqyU8M63AwZyRxu3UM9Dhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fappk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-311e98ee3fcso1236206a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877950; x=1751482750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
 b=LVQWVQOYyWEvsAVFizx6TH6+lsxt3PqWb05Q/zZ5Q7w982cf28UtZc4nVFLq0NScp/
 A/ZBhTaubxnuAl2DjgEDbyVyHRdInwxTez1Az+z5nq3JrosRlsIZxqKbR69LIBYWmGa6
 bxPtodXd/OkVDuvSm18+kwDwTPYbkGnqMg+hfcjokRyHe0q0oYhCpUhDrcHwvGxZaPN3
 FYIGGeACqKxd3BRp+uqSgZAjJ3nHpUPtC8PYt7HUJ2cU28Hrc3fBX3P1CouYuOjB6jYI
 DWbcVhVHcOmPCqoBqxBr0LAl+lbUsaju2l/N9BJ1dhxXrfp9ArTvjL53aiLZ05ThuMWc
 3ilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLatlLjBs6MOT2TuQCkrNTaWyRhDf3MNJcTR4pTa9D8QSnzXYpJd7k3i1X4v3QMvpAa8IEsReOkNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJHcWfmKxKwHSZnJyrg8mAE6GGAgs7XMHxZSPzBz5g0TCxQrxZ
 MD2lGj6a2Zbl6UJ6nz+7kqOJkkZ/651ZctpC3BvVug9aHdDQ3tkjPLNJBoHNzwyt4/K6bhjWehq
 R/WNFj5lMoMcIv6dQ/Xf/G6x3dbeWrnq47WnKJ0USNkamMxlbs94x3mkypS57Mg2SvhQ3I2s=
X-Gm-Gg: ASbGncsyOcONWOPHGsVaowYBCzjOmNz6WPRcKa7yAIQvmXCfDq8Fz2AffPIWykiZVz0
 C17QqXsPOwiEEVhcb9GhEwnPsUD0+tOw8cOTBIoWEV46b6b5Hvj9e7nW+VChwKoIqrNZ+gT+Ctt
 fgJ7pFYFA7N5OpHRBdnbrfUf1ynpPvYZq2rUQAzx0tuCeIOQ2GIhQuVEbsHbTBPX3QWrH+uYxiE
 s3exg0Ow9sos6lGkfdXVgsOOll4Q4Yew2L7uNjDtcw3kLdpAtP9JcrN3jNT7Xp44OLqACrxj4L8
 eZtw/89m5hNUToCFfUzSnpCPPAL4w/h4
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-316e2336f18mr798538a91.10.1750877950566; 
 Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbp4SKrEY9d8JIbSkMB6p5URNqdjm5cGwlxWoVGnHIftvqm3YVrqyP0ZrvpIQrI+VVUGZoBA==
X-Received: by 2002:a17:90b:5884:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-316e2336f18mr798499a91.10.1750877950074; 
 Wed, 25 Jun 2025 11:59:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f539e6ccsm2331259a91.17.2025.06.25.11.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Wed, 25 Jun 2025 11:47:25 -0700
Message-ID: <20250625184918.124608-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfXxAJa1vpcBeO2
 Ru3intJtDdyhgIxiBpS2IzsRoMM2wZmYIZTi708d4HLvB8yFQbKQP6bm6ZmOmdIrHm+1LmwCT0H
 s4TiRMECZ7iXuWMQ+meRvPHrnxAFK3oitONoWFuUI3e7460VQq6Qd9wxpeVl50SQaJFW3o9NMwy
 CC1d4r4Ydhfai3bYDXJJMEpGFk9DFKFGtgOEB6uELtZdi0E9vYnAVXf82LWIQeq99qCn8/Obz9Z
 06SqMXBiO5k/usLRL8mokYNWKkIFGUINaSWcF+lGZeX7FKFteZ2EHctSsNKJAN4ngO8kV/RVaka
 2c5w11ZhuagSHGtQ/rRluGBz6tmLF4aD7D7HDgmz0lQNEoCgXlVZE0fCWAhk5VStj2tjPiqdIhD
 wsC44FprRyf1nT3ESR3z8PNRlQhjbkSkOQFyt3pUdfzpwE6s1ZD8GRQeNKxDyu5o1QbULinB
X-Proofpoint-ORIG-GUID: XY6gTBv1Gveiam3T0Xipd4PA1WZYFEzR
X-Proofpoint-GUID: XY6gTBv1Gveiam3T0Xipd4PA1WZYFEzR
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685c46ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=945
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f0e37733c65d..83fba02ca1df 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..1c068592f9e9 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0

