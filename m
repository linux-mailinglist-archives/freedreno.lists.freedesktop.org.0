Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8446AED058
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC910E35E;
	Sun, 29 Jun 2025 20:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHTvEF1K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C810E0CA
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIDD9r023419
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sVxQxqcInWG
 kGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=; b=oHTvEF1KOTyRjmBitWtjfyQi9d7
 RWH6rjdkIlBV0XTeCgeLLsdytj+I2h8iRsq5ZXt3woWHsIBIAlYwnWC5pIGWbw0o
 ZiXFiW785yJdqMj5CFcyo/iNaBlSLA5xenwkDLVPjOZ9KokrCtJo3Rvveqps172R
 wFIIvgRBbZcSfkVKWjZFHyi73rxUvvzSoDTNYfO6PJbfq8aarZjNUl3MWGQsskv6
 Z1MuJU505tXlFRNXb6983TlIBz2QBCJm7nAKcmnlLeagch0T4gfIXJHT1b4sc0jG
 9dUBcqbIPwsTc0w38wHUWmvWqP4i5XCYTtubdQls+Ctsm2eoU+FhAPHriJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62ma6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234a102faa3so26320375ad.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228176; x=1751832976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVxQxqcInWGkGdZkfQeRJ3wtUjNtIfv/ihKTiUvsmA8=;
 b=kcC+qIN2XX62hVJtvY+U9NjiLn4RXbqpnwZZewzBALj846+36dyltLQRQMjiooWFgD
 7+I51o98yvZjGFVf1W0fl+TwKilTn0xsxpyHkBYtOxiEL2FihY87AmCWIaJRZfadUuVo
 jyHKT9TxNKe8mC7Vlrbh3dN4qEDKkGpbCCuTDGSRG7ILOuNNY76BAucS4raDvaEXcVTe
 8DCWlDCHgEcxSNoWo+1Hxxo36ItZUn3vwN+U1zggJ+bvdRmQ919PSNmC8efGwWhiYmj0
 cA+QyY+FvsmWhPmEDWWaNUk310liJHmh5fOtVI0MbDDGvO2HFEE3sC3iwIxg+zVxF4xn
 1vWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgdc/6zW06BAzR5nDTr4+zXKLgkQfxbsCIihD/QmAIVAqLD7dCyI7x+h4JUiNFm9XBXop3zaeIuuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGV1jQjjWGURfCBBmadDwd9HRBQI7ZTHyCeH4E4GtmMbDa7aRW
 BRDISqy0YccnzmAz2N5J7rqNbOPMCJv4EMjSwcS9B1AHSbRnXkaaPbZZa1f7nFFaOJeK1F+4p2d
 vSmjaPfNZhM3Lg/sd/meNz62xDkpvWj4IRXK1OAYER1vHwHjqyPhEMnchFEn9hCV1fguHnkw=
X-Gm-Gg: ASbGncsbSqBlAcYhpry2niNPMTXzKBBagheTCIGZdk8Lbs/ndxKl22v6zZjgekMD28u
 71fYm+Y9/5877da2UWLUbP1qCczhC4/dv+UTb5+nXDWwPeXfUZQa6wjNIdRtRHa9ep7l6FeAReT
 oz5wS42TYikW4GW9Nrl/4qjSXiSt9INBev5Ao05haz7xU/6i2vitTK+KFdKVL8LrukUlCsWhkQc
 UoQpybcdc7pQ16J6pYlCXfB/gwGRFj+r1piyWNqWDtR6vy/+ITECb4S85df35u1bD6KBK6kXVxU
 Ff2Sj8xStvYVrwnjTBeXsLHvhBGPKn28EQ==
X-Received: by 2002:a17:902:ebc7:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23ac40e028bmr169451665ad.12.1751228175857; 
 Sun, 29 Jun 2025 13:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbJUtGP9MrWR24HPcC4/u3xJtP1wRXJgvFGUHLgeKLArllLw9NNHdWnW/5xcDbywPkb6T0g==
X-Received: by 2002:a17:902:ebc7:b0:235:f298:cbbe with SMTP id
 d9443c01a7336-23ac40e028bmr169451305ad.12.1751228175405; 
 Sun, 29 Jun 2025 13:16:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c6953sm67738195ad.226.2025.06.29.13.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:14 -0700 (PDT)
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
Subject: [PATCH v9 08/42] drm/msm: Collapse vma allocation and initialization
Date: Sun, 29 Jun 2025 13:12:51 -0700
Message-ID: <20250629201530.25775-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX6oopera3rhXk
 fTWWpJ/hq8ssgiNmf9AMgsD838EDfykDxs2mVlFyZL3fbuvPfdaPlTgxJtB7it5RtpQWp/xtgqa
 m5dELYa4oRVyuR+GjPdFXteEQjOe2Ri2JKk9Jz7u3ouOmMOQmmZVsdTG7iroi6BlgDgOmIrvbAU
 PDvWuhLp+WSiYWAy4gfNV0yAbhug+h060HMcfqgQ5rWBe5qubV40f+0VbJVQRpGDjM50OUTQKqw
 apMac3qLsvQbBcfzOK5SlfrrNU7pqlUdTf2vVq7oIOMpWxVi2pqXreNf3fqXu/lETTMaoLweieq
 hvZmUkuiv1fKBPkR0VrUeVxiPCsJ/0uOPK+aR0qMJzlP8Uw54p9v/GEWEp0cFlauO/SKz8myBAd
 HDuL1B7FtRu0+21LkAqTlfMIONXtzSPyu+nI0W90wZSXMYtZTEWFkboS+xcIfe24EVYWyQMf
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=68619f10 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=amM6-9Z1s-9IjK5NNPIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: _6QiQ35azBJdYvNW6fubzZqvJE_HreW9
X-Proofpoint-ORIG-GUID: _6QiQ35azBJdYvNW6fubzZqvJE_HreW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b83790cc08df..9fa830209b1e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -333,23 +333,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
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
@@ -416,6 +399,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -423,18 +407,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
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
index e47e187ecd00..cf1e86252219 100644
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
2.50.0

