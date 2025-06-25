Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE94AE8D44
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395D10E7CE;
	Wed, 25 Jun 2025 18:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WovWfke8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4110E7C7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PGEPtE015531
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
 BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=WovWfke8x2POZSi4XbGmSzoYY7r
 OJuPg4AxkbaNSEDy4W9A/qIvRpSjsPBtHFLNfg2eAF7LchS0j2rSUJZNSxecTKhR
 ZSd88/qdk1s4I+A+WGSbtG91p+FaLHyyCB7THVOZyDPRfH7EpACjmmePFE8utNH5
 31zjC90lH2xfh/5MvanjaDhKs2YgMalBEDZZfXUtj1gAB+Za/nwOp3miOitMZUFb
 qFjPLR3wD/j+IlOVshFrvlhITG4lP1LYb1b7L7szhnPuDzcPsTxCn0zCCRo5ANL2
 MO91QPqTho0c7/OFx7yG4eJmt5++tQrfLcIuoHCovxInXdp2sZFW6EXzsiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b653-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235dd77d11fso1796615ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877907; x=1751482707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
 b=wqm644pzqdKz7MGpmFuSCuqCketgtCZN3qpWTM6jTX7hty4Kiy80JZ3Nri2SdTBAAb
 6BkakvsznXgBz0EZo8A3EepK6Bp0x3zMkTw0yr0ce2R8XjcTFabVuJ72rP3N2pn3q26N
 ii82lqSJyiqTidVGlPB7LGADqUakGklRxdMfgTeUPlyJFglEvNin1ODyqhNp5VPvZxAa
 w4/pEYFcHq5S7vwRnmyc/p9gMC/JiyFSagd+znP6Epx4ohg0NF9uA/+fyfyHgWLquP/Y
 YHW1yW7+b4HA2S/3WKxvXGII20YLtkmi44S/3NK2PZh1C904ftFiA+j0HN0vBZubWwJJ
 mF0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW02X2lE8f5/drzh80tYw5bF6jOpqrTU6EMnSBSVF5SOChl7+3wmL29yynNeelvQpB2tZVIKGbZs8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwATVFY+L0Sx9DYC1Yot3kplyaqnHrBYFX1LRT7LpcgiAiaqa8L
 te+PxikhU/JUf7Z5hGz1f3qGGQuNHI64vTAXlv7y6+I97122jE3dVYA5dYl5jDkg7wm3ShnGsuS
 n6bRwpZVi8MMGZmuhM4ouN44LclgHGR1d1bunEqSRu3BPcEAL+kyhc12DAV69EA4OKT3JOhoBmA
 AiND4=
X-Gm-Gg: ASbGnctNzk6vNt/jy9f+egRlOuuuL87HsKXXg43AW1KB9iBaIySYwLH0lZ+YsqYxYIZ
 8xepNKoLo29Gcq3A4voFO+mvzwc5Yym6ymwdCzyxkjI9ROINt1vR97N7xL3ymBfbYjj2dK4Fq/1
 sQd0a8as9c95USyFNB7LkX+yBQSD7H0GK2FcwtPc7Mgr0x3UtBNNtPl73p6PxarG+QKRBBuOnQI
 I+zKMlL6TBk8SJcNOaWVI33BLrRowWF8ASN9UImgwmruMeNtcJoKaHf6CnX2bekGUAMfoluzQtG
 o1qTecvymy9B3T1G9FQLDkTM5HGF2ati
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id
 d9443c01a7336-23824095671mr80469665ad.53.1750877906900; 
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfOU8b5xN3DBcrI0SlkS8W7vOGGlK3RW15375C9lfmS207Fy10Dze1XSZd5UHnBi7y5LdHyA==
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id
 d9443c01a7336-23824095671mr80469315ad.53.1750877906514; 
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d868f878sm144055785ad.184.2025.06.25.11.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
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
Subject: [PATCH v7 08/42] drm/msm: Collapse vma allocation and initialization
Date: Wed, 25 Jun 2025 11:47:01 -0700
Message-ID: <20250625184918.124608-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX47p/+L2KW+iN
 aXCXBjnds4PZk4vNeZ1YhKS52mpnxIe59YvK30pVIYDyMs2IeJgfpwMMgeUtyFgijiL3yBL+pwN
 I5/+40Rw+ayt3X9jEU4gyKS5UWCB6n40imiQYRpjql9dinuDPjT2w1/EHZpAfLcybYEEZHGoPW6
 z5DjCzt3Z6RwjoE7RkvxiyLMJhEqSvKQ56RP8N4JBA+XZYcGAKHWntL97YY95wxkhnaf/OsUeeK
 2Z5D0yzwBCaTJTPE1XGzRGF6DjCBai0X5bFLaJeEpwrts2vQiQXhKFAhEM4xEjp3P5mASyvq0x9
 4lxHQuA6FtNb6DMqmNrRWZe7DKlCW5cuHfT/aFB6KNoeniRsha4M5aD62EH5lfEVQ6OoNfqf/Ga
 qeIk0EOx0avVKWl7wQyVFm8WCVh3/t6NBVrkoQT0eJ08UXda3FFrt0HewT278Cw4JFfavbqV
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c46d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: sdlPsdqgJekgk17vCJNnC90qcBBXlzir
X-Proofpoint-ORIG-GUID: sdlPsdqgJekgk17vCJNnC90qcBBXlzir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0

