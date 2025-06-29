Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E7AECD2F
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E19310E2C2;
	Sun, 29 Jun 2025 14:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQYfqQTQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A64210E2C2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5I8ip012920
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JinTH7RBpIn
 edICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=; b=HQYfqQTQeGgoSe6x0pGrItnSsTk
 rHXOcQhp6g5A+2fEWRSHWASUKue65KpNq1OeTKM3e7kcqeX8fI9ONE8d7R3Pyq15
 85suSv5oyNvVUYHuYvkILKK+LEKdqtU3bD/uWGPbcCwHZk493NhVVCvkX6q72ozA
 SCizEf3jA50uN0hNEiHVmkX7oagmChCJ9Uma2fFAF3xoYlWMCKk65T4yM8BwDw6C
 1gqr4O2KzG2gbtKpqRFfcUnFOocla57IvVLQucrw2M/NVEwmXS+ov03JSDa0EvYB
 LYFa4bjD/opIfQarb4I3RzlhvLdcYOeMPlfqKQeXKTV4pzI6pMkKnW+ZrCA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2ewx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748cf01de06so3283370b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206068; x=1751810868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JinTH7RBpInedICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=;
 b=LTIBy0pL+dMOEbfZAfiAVjty89mKzFdof9BVCt3yyj4jE19VWKLc3AHlTm9rYS7aOG
 rH2ttkBPpb7SyFn02xEsLnIUmx5n1xF8ioMK3dHzNb8m+CQL++YA7QQQGve3m+EkkMCH
 vvAMw+ywWHf8A83Y3LdUoGMRgz4r4J48Nyz8NOtJUAd38Bj+yt8+dHG5Zm1j//Dt1KvH
 Ga/mTChBHoddolJRvVbz+AxsySpbfNb31LSIX9ZAX69VDhHzZLFu3UlSZUvBhXKhVrkN
 3AUpcewk7Jgn/LfpQZ9QCMvrKY22gOVKPS1y88pHMvx5x9Pdla06WxjHprqCs3ixsb/9
 3Myw==
X-Gm-Message-State: AOJu0YyS/mARUDIdOrsAD9h0zDN9qtvmSQbPnapgYoX+nSEDCL91sAv3
 bUiosLqAaa6KWxCIq71d2i16GFiBXYoNzQWBYIGDcc1uBe8e25Ue0asimcqJ3fWVEl2Vt37fqb0
 rIJUD3j/ARpgXigHpNGgN9RLx8PgrPEYVfsx3QHjiCwvpkwRVvo/c9Djwj8LHOYFLhVUyX20=
X-Gm-Gg: ASbGncuxIEWBk0uvBAXrbB0pIztHELLVlACF3iA7dEHkudFeUknffuUgEDFl0C7Vczo
 exYSy/K7HlUIGdbXb3hT7DmFC9C/iDqkVFFuoUQs+3lL/UgnKwfUpgnFstMps6AOjcD266TkLcA
 J00za3tOuWNxoq5z8AgseSnfEuEi1edixZtw9qiAVuTKdocIjqxjQU9lsR9ZUsU5rA0MrTgqTD0
 ToSigVn1qKfypExEWJY6FCZvDfkrNuYEVgFmdFA8sFiq2+vN1KmQHTNyY7j60fsrbA4T+cTmdVl
 VruMFTc6tTI42BsFOGXq8G3O7MYGZ68d
X-Received: by 2002:a05:6a00:4fc1:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-74af6fcf6c5mr13029878b3a.15.1751206067926; 
 Sun, 29 Jun 2025 07:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn35T9b/0kapM5IKGsL7a1XVCXPKFjZXq8JLCQPhjEBuAie0JCEdWyjBXiLZdtbg53DL+0lQ==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-74af6fcf6c5mr13029837b3a.15.1751206067480; 
 Sun, 29 Jun 2025 07:07:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5581020sm6884621b3a.87.2025.06.29.07.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:47 -0700 (PDT)
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 18/42] drm/msm: Add PRR support
Date: Sun, 29 Jun 2025 07:03:21 -0700
Message-ID: <20250629140537.30850-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fiW7qitGr1C2eHIRQEFrJOLLR-hCcRun
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148b5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: fiW7qitGr1C2eHIRQEFrJOLLR-hCcRun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9Alno+hRN//M
 1l9FBWj/EEtIopF2I0YPxcQ/S920be23iWnMpO5fVIfGRCpjj7fvu6aej5Jme3ZofqrpaB50xuN
 59BiNCtLBAk5DZ5cY4CPOmHzC9pHMpXTyea8QlhfTa+Z/vyYEcepGPx5kymUgffZGAbvDqQ+0xd
 Y96AleuahuUKOhPHyp9SYjpI1SKQpnjPECiBsdzvC0cunvKCBuNEovqqemkj6e3tvO6DNaS4sih
 xNJOMbOqRPne8sPbrw8rpqDUqNcgKy6blWofAOvGCxGIGl+eZRF4kV1lWwCq1S7jk9uHEjDyH6j
 Y//KRHyJkw0IPuB0QafQarxHP3fNFU3oTBlsqxRjBAbTt4mvmZECiGGJ8M/mCWbQambZFstO8SA
 +yfHw+7lgwbwfImMNY74wK9dkUFRRbO6da4vEwCuH5TOqGKI4YcBA9udsu2YcP9MTXsksHPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
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

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 676fc078d545..12bf39c0516c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -357,6 +357,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -440,6 +447,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
 		return 0;
+	case MSM_PARAM_HAS_PRR:
+		*value = adreno_smmu_has_prr(gpu);
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 3c2eb59bfd49..a0c74ecdb11b 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,6 +13,7 @@ struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
 	atomic_t pagetables;
+	struct page *prr_page;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -112,6 +113,36 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	return (size == 0) ? 0 : -EINVAL;
 }
 
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 				   struct sg_table *sgt, size_t off, size_t len,
 				   int prot)
@@ -122,6 +153,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
 	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
@@ -177,9 +211,16 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0)
+	if (atomic_dec_return(&iommu->pagetables) == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
+		if (adreno_smmu->set_prr_bit) {
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			__free_page(iommu->prr_page);
+			iommu->prr_page = NULL;
+		}
+	}
+
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
 }
@@ -336,6 +377,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 			kfree(pagetable);
 			return ERR_PTR(ret);
 		}
+
+		BUG_ON(iommu->prr_page);
+		if (adreno_smmu->set_prr_bit) {
+			/*
+			 * We need a zero'd page for two reasons:
+			 *
+			 * 1) Reserve a known physical address to use when
+			 *    mapping NULL / sparsely resident regions
+			 * 2) Read back zero
+			 *
+			 * It appears the hw drops writes to the PRR region
+			 * on the floor, but reads actually return whatever
+			 * is in the PRR page.
+			 */
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			adreno_smmu->set_prr_addr(adreno_smmu->cookie,
+						  page_to_phys(iommu->prr_page));
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
+		}
 	}
 
 	/* Needed later for TLB flush */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..5bc5e4526ccf 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.50.0

