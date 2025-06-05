Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34900ACF6A9
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8194510E2F4;
	Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpdhTPiK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CB010E2F9
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HK1hu027554
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
 BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=jpdhTPiKagEF5j6KX7pPe0LyzeH
 OZTEVdqkA/8sYYJSnJXLxEkmfBiCgiLYEGmqjhlJ6/nYCHn0OZYObLKwfBJX1DpA
 vqmJDJhYS1cO2S24WA9NsAk7/cJzj5hj+pB4/2Uce+IldRnNRPJewIt8363Q0N7E
 OJSp1k7MfJrDoaw+etoLMlGkHSoSV3rmWJGunNggNEL++DL1l3gJ3WtAIrfXEiR/
 cz9JiCaafyZo2IYAeoQ8CTV6epyZ7Q0V0c/+RFPT+G0gcJ6q/jKn1U/zNe7mSRU/
 tw4AaIQI4NXPjPdTDmWiY2fwWiz/gpnXlgx44mNb4UOShSsdXn6l80RJ22Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-740774348f6so1161619b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148348; x=1749753148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
 b=Xdc9ZkpkuR1QcgKM+LMMN/fLRpJ9u+Pa4psIywY178JHSwxlvV3JMSvYQSDCHGVnp8
 k9gsDBudDlpOqJHOoMjcpwVhknBd/lBJPCikmjPDWVQ0llJmlOQz5Mc1z6qiQ9/B2nLp
 KjHQPfuXEUiQyYUiSuujTzklZXjR3ivnbpYsC7VXLA9psIQ3Eytdt0AaorAKwypbYFXm
 z1qfJrwqJHmPjuw5ls3O57B21kw/UpZe40YPy7GQoScZRYz4fKzLmAf6aDHJxlpkYAXQ
 JmgMVuA9+f0Z6xtHFO8iOVgZobaRziVmwehOgMCwn+AoxJNK6PIKM9yidwz2Crw+jqgE
 WEIQ==
X-Gm-Message-State: AOJu0Yy6oM9zdoSoMcjlSb3UqX0fDrek5MTSWndUS3/WJko9Km3ooZr8
 Rqj5mUv9uC4sHACXIFZnRGG7meLJSwg8qULHXT6eKzetKPrmCTwFnBfoQ49TpbNG+MKDpEbd/Wk
 ZROiRKO97sxuFiwqqUo21TVl4VM6pYHk1hpCKTgGEETzNUf1xOZu7c9i596ReN46Q8eje7HU=
X-Gm-Gg: ASbGncvb87F8QGQx3hCaKNs90umstE+UjbU1bKayQHITw7MRcXKHMdZiaMVMg+CvKZz
 3DeY+/6Uf+RPRig1cyk4/kliWpvuQFy87dMJSh9Xt5oaxsMqWoJRwk/ZNfjKp1n6SR8s9jGENZM
 VycEQK3Oa/TPiDep+q78M1Tuw52s/RooAevakk3HHTbQ5u79wWxWzvlBD55RfvhHzg3ZYOYI/QH
 HpJ6mRneJqZZcM6oK1ey4Kk/iQg2WbRjb4tHoVI7PujwqYyZkrmX342AYQVvyAjYWwpAXLcrvY0
 +DUIWPKO022udvpVwzpFTDYi46WTfC7N
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id
 adf61e73a8af0-21ee2637d11mr356817637.32.1749148348150; 
 Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrfLgNyWqLp9DNSwslns/gOD9utCo3fzpYrtaVTz2iGKhZuHEW0/CiegXluYIPkvKb67fXw==
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id
 adf61e73a8af0-21ee2637d11mr356783637.32.1749148347737; 
 Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affcfa0csm13511882b3a.131.2025.06.05.11.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 06/40] drm/msm: Collapse vma allocation and initialization
Date: Thu,  5 Jun 2025 11:28:51 -0700
Message-ID: <20250605183111.163594-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2bd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gImTi3GVa12nSwv7glrfEhrVAEw4EBJq
X-Proofpoint-GUID: gImTi3GVa12nSwv7glrfEhrVAEw4EBJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfX7iMENblzEc2E
 n/++fPl12o/R5fRGdmeExl61cTlt8dcMOHxwhCgSpiFKKj6I4/fbiId2DyiLJW1Wvaz/57iKZid
 KEh/qRZNUm5NWhS8tU8ekbfKfmAADxiCOHBwgCV34uweZ64BGqkWvRCMtVHlo/K5Tm0MrWO/jQX
 7FU9mm0QV38j5kl8adhkgeZDAxR8Fl2pngvo5C4Prbnev7b8eUPK44WmzS+q0i0CwErWzLK5RVD
 DE9qHRXUPFFVFhe4ppL74rxqNOakB/1EkQmjGkfyAr1fgMvGWlJfz9YkSrl2mzR69/1ZVklQgbF
 7CxdzQQmIc2NCHDLah21B3K3u9X3nM2wQsLhkhj/HqaK7slasHFGcwCX2jfIVlCtK5j8xKwEUL+
 IJgRttEnZ13en5/X+NsA0fT6WM4R7U8D/sQt2R2NlONgiZdq/+Aw0A0GeotwmARZsp6zy6ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163
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

