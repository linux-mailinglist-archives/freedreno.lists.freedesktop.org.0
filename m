Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F91AECD47
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBC10E347;
	Sun, 29 Jun 2025 14:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZSmCBvG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A977D10E221
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5I8iv012920
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
 mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=VZSmCBvGgZjdmydzwZ5DBStUTGQ
 UV9Wqke/L28Nva2w5HQeQ3RLj3WtxSH4mPGU6WroNOAwfG1uLj55alMN/mx4iMXm
 qvFYN3RLYlRlCfYnGVxxWXrd9fGaBDkp7v7Kh1Xyd9PlSN5RAOdM3iU1dgHCD0X+
 Pnk6U09kU0/VB8JRQe/Qq/dQzBBOLTzipDnqWv1jTD0Cn4wExz7pe+R8To0OI9xr
 QMOw51Uw38FgQOHZa4i5qICMDKEdiKn+uDSImuwBabTtDDG9y4R9EVAd0j/d0Oa9
 mS5xLpkclwaY0KidVBIhUAd08jjCo6kueta+FSzce9iPHLitVfP5tXdON3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2eym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso1425133a91.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206087; x=1751810887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
 b=nnIKF3XeNrBu87IF5dIfdI23HwzrUXrssw9zxxe04+uJ8+Kby0d927paWBuvX7T9vG
 k4cELiefP1iQ9Zwqr83ubrVBxncfsi1qcVa0QuXjUm2kGOUEjVsu24R6ANSrWApSJAGo
 6jPvnoUto+82mbLUlWvXPgdEH81zugttVcu0aeoderjLGcekF8VT0BiZgrciTLd1u8A3
 olGseiFr8rv+fP8GGy0SbgpNoLF6k9jeQ6wVwz4vfhQqNpmUpwJ7osVCplhwU/gFPvnT
 zrbQSUay4yt/37VZxhl+iWcEe+KJu84yQJmE6Wvr9Nx4GEu7KCcNbD8zyVGWo1hGUo66
 dikw==
X-Gm-Message-State: AOJu0Yw4vmgM3Cll8VgC1uPAhA0hWjr34Yg6U4MOxdwSPhV0QhofgI/L
 UAKfSm6woMvUuO83B6ql8fUWDRlZAH/8loyO832WdWRqxWomeyQ7F9UQioshs8CVfhJTrbLzXZG
 bs3abQpRitFN0QUO2OeWWeqms/ZDy2aWA1JWQysABJIO5CE+YhJ5slUCpvvLcypyfY90AgJ8=
X-Gm-Gg: ASbGncvj6nrvcU5I9bZ7sdo1gnuGrsbzJYkJ/F9hOkJieIl6YLgHZyk6TNo2XkWwQrq
 kC9KGqejOq31kL7ATeZ24dxn+bukOdhekMTJ6uKezS/ver1N0yx9U1liLYm71MoJNvUgqii7lom
 faPQhHaSHdVFreOUDQ914HxY5RWNcej9NICVtI3GN89INpov+WkEzQNU+h+cLyB6bmOiWgfY9Ri
 dZ20omppip1yHpZt/llFpMFJg+qvgyF7ZPzlk5w/uxkiW1ssWx4xC4vM04hLKzNgt+ZeEhh50K9
 LnBfwzJtE2rMn+kOye/SV88eFvNgQDtp
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-318c8eed32amr14074251a91.11.1751206087604; 
 Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYkvmCpaWJmCDoX/uhVGt0Pk6ICFtUgsS6BHNOC2nwdb/Xmkyt9dsqSqbLYw4AbYMUQq+a2w==
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-318c8eed32amr14074204a91.11.1751206087057; 
 Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bc7dsm59102335ad.114.2025.06.29.07.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 07:03:35 -0700
Message-ID: <20250629140537.30850-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2p3sYUa56jOKh6IuRVDTGi0-trr-R52p
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148c8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 2p3sYUa56jOKh6IuRVDTGi0-trr-R52p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX15eQwenID1MJ
 3qqG+wZxdybeIL5uxUl1jfgGcNFXckeY0uptQKAwjpUW6bRyQRaI6OcM6LK2RKWRCyyFPIqyRx3
 8f5xR7erVzgTBIoVdwBzoHab7LIZtThHoCPQTB3M9u+l3SYb0rJEi+xYJaC+2U2/lm23GPsobtn
 P8JA4cNUjDpQIODNoMnCGrV8l+fDoE/Iaw9LvU8CaoRehZ2f8SfVNLuoRXYi+gEUiMA1nKs9X8Z
 0V43PbjA535DKr9q15iT46LyXuY1aUE7o25YuTSD+RsP3FMO9TSAmiYYc6e/C7K8E5rhtPHAg6p
 aSfFLhqqbFw7PVouy33+BAQIkqPmPaPg5A+7OnoxXuIUXLtYREa2p43qoWM9BhwD6iKuRMNucxK
 xv/q0Y5Jvo4U53HMK6dd+kNkk1uEuk5FMTrWDZnu+QlOWJNDXhHN8jn2mOPDt7pFPDOTl5Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=946 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
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

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
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
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0

