Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB340AED06E
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1B410E369;
	Sun, 29 Jun 2025 20:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="glr7MuR0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F3810E367
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKDVkv014373
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JinTH7RBpIn
 edICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=; b=glr7MuR0iDjTP1Qad76TT0dZOhC
 Oz0QaszL/ho6mDpnn1Lz03vcRW4JieI2oqBHEEBDdvowscqQZB1pdc+AA0ZsCJuQ
 gSEElOXooyIsLx0LKOvjpyIr2uY2yYESKIz9PfVKkAniJOVgBl3lpVqV1A8OJZ8m
 7MP2RLIwdpLcz7W3OEWLdFS41tq/o6kyTiuHb0uEwaouMJKrfgXKJCn1RDYvptyh
 boXe3Dmp6grslAEtXfbL7Q/F+4+ok2P0YMh/VnGts40ghNX6yZUfaeeEMd8wTavh
 uRuxza1YPfOQIeNxe6cX7yXxqWdkD3fZH+f5AGgTcfLQaF+BiwaUnRwofjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801tmnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74880a02689so3017055b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228204; x=1751833004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JinTH7RBpInedICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=;
 b=lBFhBw6GaloMO8BkNlrgdnQ+DqhqHA5bnIsuCpots9YUNUrHMcjB/almrGZDjf3hNr
 j7Bnr7GzD46dPgzj7Z02Kq2WXgbcqQymuX/FFF6rGbEkd9d0ytXlfolrIpkdxn7ET3pT
 /nv+HubA5eSNi90NpgFFqnzhO4ZW8aT2OSA0JVVqeP/U3FA5Rf5E/s0qxXNXhJQyPp91
 PKpdZT4Tq33J2pFKSnrEiK5W8h3T6iK1GeKNzJjwN42NB6d/VgzLvOiG9V4LNeq9LFZ9
 PSsaUbvPtj28coq7RnHj5dlweDAU8E6RzBt/Woiuq17prdxwrelBfaGF7q5vzkfa2gpG
 FZCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXL6TFYFIYVhB+juB8bVM7eF7gL1E1wxgarDVde+s+FLSc3R4Oi6QW4x8xIBinH/jtgbRJPlNY9kA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6NwAv7S3+xHUqx1zVcuZylgsJsL9z4ulTu2pmr4FYrzcEh9av
 v6O0w41jZf5zf1PIQ3dSKMSaYd/2x34kYoG5+Wl2i+IbI/suxiBvjFv7qfqYD7zUztH7fgwL0lX
 DBQCVWTvGs7Y9QmczId42nDfwct13kXrWlHeZR759UdPyVSniq/jBXo/smg3NE7IUf46pQXI=
X-Gm-Gg: ASbGncsLNHbSZ8++cv98+YSi9odgFNrrV04MNNHTVMJwYeRdPmfmBFepoXSNRP6GOHc
 7Ki380PNwp4TqBqMenrx1p7lAdS6J2dmxCpdL0fyTM6wAY4bitKGvd8ENNdXi9UXOaxjpjp/aDC
 nBgfkymPScGk4dgHFv7Ccs7fiQ0QYVtBJa0aJxiFPiyYtr/Z0hVA2RG7ijzrIqOh8jnRWlYPbTU
 Occuf4YbN/zBNnSvLXKqSta/QGZAazXes5D8lUJqd4dMQqF06MopPj9bEx204l1KEwvJ2uLU42D
 KbFfi1MGizj2Ul3NkapynIhoTCnGY4MmlA==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id
 d2e1a72fcca58-74af6fd7312mr13757428b3a.22.1751228203655; 
 Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk7ORGHzSfU2DSxnHutHKKkh9bC7DWJEiEZd1kyNe53DB3/eUhy7wAbVuq/qFosk61gf5b5g==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id
 d2e1a72fcca58-74af6fd7312mr13757395b3a.22.1751228203166; 
 Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541bd1fsm6998630b3a.47.2025.06.29.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 18/42] drm/msm: Add PRR support
Date: Sun, 29 Jun 2025 13:13:01 -0700
Message-ID: <20250629201530.25775-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _raD5FMyRH-uDNqgKwbwkfDgHffhBWG9
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: _raD5FMyRH-uDNqgKwbwkfDgHffhBWG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX+bRcojK/RVS+
 yDhSvU57GAyNVTB/S/w6Go7n85Oro4m1m18MXdtEvqV9bvhZAIXghjZ//8VmjOKghpOxosaKY9b
 KjjZymdtRqCyvRMUxWwnpSYK0lS3u2paRGQlvfU7WEHJt23rZYYMrNU1V9Xcrf7SSYZLJbOgDHZ
 gf/0+z2wx7BDXg18B2+p4ll2wuiEUGIpK/Ml+4rYB4ZQ6WEpkIfF4eB45MjTBq1m/YOO/4f2HPm
 1e2fw8FipR8jwWH/ttU3J+P4bpAkxerILSm1u4qdKgEuFt553/gXRZ7kynOuleGY7fQziZslGl7
 9/Jje77upu3kqYNt3DdMshCoDMWPPRIFfTP9lqtbMHWtO0aAfR9lhq6ZsOCaQEjUC1YUyTjeu3t
 3hcAFNcYccmqqlSNNsfeMCZDa4+pGKaVmxYd+bTt46rhG+ulnFeu9uMHpNbMrx2CV4TGqoKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

