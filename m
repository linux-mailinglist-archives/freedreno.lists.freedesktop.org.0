Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134AAED059
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30210E362;
	Sun, 29 Jun 2025 20:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B73z6o3N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F010E0EE
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TItM50013587
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
 6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=B73z6o3NUOnTBeLRUz/v4CmCQuC
 NG0NvTygtQIVavwWwnSyU+uTSygQRtJT5ZZoQXGzz83y7ou/2k0HwoL0MboB2Hq6
 COEAlCbEjz/+hUcF64VO1IUF4pktiFoPpWxBerjO019dh06E8Gjtur8f4ErBeQiy
 CDIN18t6q/1/2slPbQrTJpzHMu+dGxmJRUDQEVbUHfocOyDpIoaq97VkBrky8R+9
 19/Tn43glh9WVt9wJzVC/9YAdiq4AM+L8uxkNE5kA/J8CpKCPs9zyiKMvfe8VUPk
 VCmCEn7B+XGmnU9GnEKJ4/SE50uQcWQku2UQ1UewhRHwJ4gUIh0WAldycXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23632fd6248so10722685ad.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228177; x=1751832977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
 b=jNbsovc+49swk7vTq1GiAPimIfJJ6Ecy5jdT5BfAIv67E8P+m3INK1t78nFQdbHtss
 ip+dk6S9PaItJlSIdH3JxyTZH3mB01AjzfQvALmQbjUlM4dFqotIqnDitDopC7a6ZRuO
 ujiwYj9f4HrFF9e3BxenQfozWKgLlqbeCP9xg8SnoV3G4XLe1NYwUIAFN6b2Int6Tr6/
 4V/fpJMy8eyBOyGxMDTWU6VrzdqLF3UBk+jhvoYIeqi69IDe49/OgDf1UfSYlMCng0uG
 8cADACCXjPn+pquEkdIXP6AU+AA7RQAuPWreB1GFpe3H8Wu5oXFHbctfVoEss3SsjxJu
 RhRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNv9+SOLfV/UlaPx8MAgjAN6V64Uer6vP3YFEeKa6kJHCpbgF7CwROQF+A2w7LCF8M8ss7heGPCd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi7WeHuK3Rb8925V683YxpoI/Yqx/EQJGGOT9lXgPJjc+BBUf8
 JBeVrxa258Y0aLLieorlLqIY/qzkmv/EL6jeKjvhrdt6uTY4oSdPFxGb/sL9+BWc6w6BnBZ2KUi
 c+kF38hy1G/JsTN5oNLlgmjWbY4FsZpOnfgF668xtH8/102LrLtv0Y2XCAFffkSfhoIjYzkU=
X-Gm-Gg: ASbGncuRuXamls3pkBgwH/u0q2dXrpUNBanAeIaQMf+UuB4orF2LYV+MRnzm+IiqlZB
 FPy7doafXg4sbLCQ3F9H2b4abYTcpXssuznyJY9hhqvlEVinxpU2NBnXOgwz6l4uxIbAHjsZWs4
 2Yu90EI4neGxw9q/fQSkCQ87f3li+j7U8KEtXnQ+ncY3XQLlZ8hE8zAYNSotFwOOT9pEADOIH1H
 pm84TbwYTHvMjqAMNnJXGIrHa71mQ8tZoMyKSMSCGf1PqB/fjlhusTGnNxBKEA1XR4B96FGaX1r
 nEK0Ncmybo5ENKJpN9qZssev7ZK0Sf6OFw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23ac46342d3mr183275245ad.35.1751228177200; 
 Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZqvQxwClmeSyChDksjaanlaNbbsqfLSli1B/K5dWQvgddHns82/yR5/PricjffDUOwiSEw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23ac46342d3mr183274885ad.35.1751228176702; 
 Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bf26sm64300085ad.107.2025.06.29.13.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
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
Subject: [PATCH v9 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 13:12:52 -0700
Message-ID: <20250629201530.25775-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lq1k4YCgApyyuS0Tzplr5X9bFamXb4Gx
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lq1k4YCgApyyuS0Tzplr5X9bFamXb4Gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5vryTPiImZNY
 K8mTBHGHIqOmqUkSwvwDHZNh/DUhqOBN+TFucettqVMq1M7Bm6iBcIn/6GSJAf+RrDMqTF00j10
 u3/gBHw5fLiwmEjs2AQ7Ccy8cWg145eDMCCqcK/uxUlcbSAT1w8Q1R/9DREh0gFhes8wxdj7J2e
 XdGDh0gIonwRM8ZPenKyFqmEeZ2ufgPkhfT9uR4M5lOUzRasonh3rJeGmZEsSKf89DdfF3graCD
 VS9aQMCQgQmafCUWXk2tQZZv00wfgjQNZV70wEghMDWSz+c3FeGXe6RtnB6oPMFwfJwupY/XAUp
 wQ6/AG7ZLDxXWXjk1M/S3APNTzIW8xsAqgokx6OiY/8LuhTN4nLcMXn7/SHf+OUhXYt6FZYMEee
 4kWrBHDppbve1DaGnOUPsm07mrpZAg2ZJABmlUlNwLZ91V+paL+0aUVCvpsZRpTIsscmI3tY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=990 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9fa830209b1e..7b0430628834 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -368,11 +359,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.50.0

