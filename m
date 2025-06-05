Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC2ACF6BF
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDAB10E963;
	Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXfPX0d6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B79910E2F9
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:53 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H0xh7006331
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3u7saZqSf9v
 I7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=; b=fXfPX0d6PaVGIBJgExovILPPK6D
 4Z3RwxgfsjKXQxaNjqbCUG7u2YaYqS7eBEK0DZT7vlZ7BAtBFov6m4zWNkp98Cyy
 iVCic8TFb6pc+wPgE5EJa6KWQaqxm6N2SGe/xbZSKb0P7OFJWw0emJJCBoiGKqhg
 3FNhH979z7fcSO2ciTpLTEljwwm70wa6Es3TNLyunn9OoYZj1iucP6KGtst2PbpX
 hQA+/L85wUnlfG/cMu0tdpyHz6NG3YAujuXVn73DiAfxdNX+7xF3x/B79055yf3a
 GAnkwYn2AGtj5anXDvi8ghLavu4RXIwP5PhkSGjWzkN2UOnthztJH7jkgMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2abh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311fa374c2fso2159045a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148372; x=1749753172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3u7saZqSf9vI7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=;
 b=DKbaukxkIJENME73qg1bc9Ej+7nTv1eEqbHQFq0N1asygq8Vu0iBRV6ow0GF11C0/0
 wGFrDajZwgYdVTLDoAwcsD9oXI3+ekXH29UNsBw0orKQJ2zXMSXLbzFpJ3xj8q9vFHfG
 rigD6Qm9YLh9j26WbUDk6ZkwHTszyTP3o5R9FYHU1oDVUxEIGO1VK2xafDYO0ysW8Hhj
 fbupIoUjs74070IJi/Z+7papvIKnqIo7Kq6wnDOuc/EemrXmtyf/b4vLXh0HUxj9+/z1
 zFryP0HVUmMgKwAOBjIMyjREWp7yHHdzyYApa9Jy0IGBUOlHcfFU4AgdKMKix9m6fmeJ
 f+bw==
X-Gm-Message-State: AOJu0Yxw7V+reVJLxCriVGE1ptCASbS/J31TMAxCCojYs4GVKzkc6dC/
 ajZxoArvsJrE2Pu2kGL69FwU+vjLkPd+/L225T8mV8Jky6N1+cDRoEeXUFpCnk21QrEhHSVQAZS
 0kchpcGmuf9BmKJmsxxjtUnjSQ5fTB7MeoAGdez8Gu9eeduB/gQEUllEV98C0kYjFmE6IKWE=
X-Gm-Gg: ASbGncvVT1u1+hpMKuhDqa9ugdVunmJIZce9qHRRUKuo3t781FcnrEYX03ew0ro5CdB
 WTa2yN+yg4JR3HWZzc/UGQph0EzY307gnYSWsWOfchrRZKVqEB84d79DpfJfpHl6pzJjzmBYdJp
 pcBPWEVzrhjy5hCca7p2ohQFrhYpVhth6F19sck0jb4lhYofbwvqq8p8+HHc6rPYVMRfKv9Yt4f
 /5VNvcazs0e4j3aO7ffJR+ymYHYjd/vQ5bjcja5Goe6SRJethx4KjhGjrLSi7Jl5Bx594XNSeO1
 /0uPWaG1DFP+3HpjmebVww==
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id
 98e67ed59e1d1-31347057c9amr1124719a91.24.1749148371735; 
 Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf8XXJ8Mf/VVr/G14I6Dua2+GHn6PtLKJaQTP4schM9Oyz0kgDx0QvXZTk1AeUyR9rUESodA==
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id
 98e67ed59e1d1-31347057c9amr1124675a91.24.1749148371293; 
 Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fe0048sm59361a91.42.2025.06.05.11.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 16/40] drm/msm: Add PRR support
Date: Thu,  5 Jun 2025 11:29:01 -0700
Message-ID: <20250605183111.163594-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WzEXPCZjlS-Y2j80TXD4Wf407RiZASKQ
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WzEXPCZjlS-Y2j80TXD4Wf407RiZASKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX5FtefQx97cIG
 22b03tWsjG0XDMqqXZCjPPTE/ByUOLJ3o9ojeoFw5ZGUAKvcS+rFo5r3es4fYCT7j1NSqkUShJ4
 00tTVqNhjv7uEQFmc45g11kU4FLpqNCULgy+j/Mtc5Tennml+yLwWXGAI5QSdhZdjUnL/qNmSIv
 3PWZBEIMhCDX3c6AFkqplmURxF8v3tEWKdHco69xfwgPvLy7JRhUOPeo2wskQe5wEbJ3PxkRYUo
 bVkXs8P3lhsERG86PiXiYocvA1ivz+JjfPwyQpiMUe4CXMsMm+/DSOniezKP9cMFeOfHXjZHHjw
 BJm/augmCXrfTZ2ggwiuyEiLlnQmuvw4/erkBGlcFDTPMYSqDZvqczaFwRSB24v85W8tuFZMWRN
 Bg+qU2n4NfQw19+LBdOj3lveVklZtl/MpRbjhqtyF1guNT/LTBB0gXxXcKypPRhKyyhRqyIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f6624a246694..e24f627daf37 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -361,6 +361,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
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
@@ -444,6 +451,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 2fd48e66bc98..756bd55ee94f 100644
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
2.49.0

