Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFCAE8D48
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E5010E7D7;
	Wed, 25 Jun 2025 18:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ui1VBoV+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5341E10E7CE
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC54ZV022214
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
 aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=Ui1VBoV+IXmMp6fl+lfP2dmVQoz
 K0nEfJCd/5Zr4mZvaokKx6Fii7Tyn889iyNEhz5PDYfWySxA49w42Z7kHSlXhjTj
 p+TQqBv5MqOxoPx74BjGy0of1mVxkZKb8F5kS4bF1Dzrl8tnl5e7DC5EyVlVQJWX
 cJMEv28as7h5bYJz7ULR7h/T9U8U8uP6b0152ZYXx5MLp2LdCcXRyDlr54LFNpkg
 YDR8DApCPgQZzmoxNKNeYZq6Ec/BC3vHJO0Jx67tTWWcwsYNjSisMtmLqt8x771G
 Dc/0NXGyfZV+cCS3AWSkOTctvOQbTaXLSeUvbCaS6OO+74BA29wSfJIu1pQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so323839b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877908; x=1751482708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
 b=IbGziN/F9g/pCSWx1Iev47CSCj2LEZ3DfGlDWCCqKbhUpR20uq64n9ySd3/X5Oozkp
 VkajTrxDbHxyvqbvJyYnIWaOGWhigXTUCrC9JWJwBgxPeJ2PuBzp9xc+lhwd0LsWK57A
 aV3EC1xUilYRPx9pJ+NE+CNdKrxXMyNXPoQL5WvKG4jBeKfOqFoMCoky+5YWc0bKqXfE
 v6mDcpQakF6gGj5jj/eQkbrl6F0wjpXlJzcE2u8b2sJ+A4t42iXNSfgNAPdxisq30KAD
 U71BhavCX8CpfNYt48Y3rWUfY0qg7Gx8xpgfatdvKsHeNUIi3B4LeCGX2WtPaSK+d/vF
 tENg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe8rRXzvrUWCVRvaNsLhkBd+Jc2ApWX6zjAmDZfCNvEovJZbcLdG9WFXEyCgAFqZqed7ZLhnGXyb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk2EGM1DBwblV4oZBQj5hwLEohMUDHVgzrmYWKXnKRGp3Ynp9W
 6M872UqkMgfbgMzwmW0/o73yw8j6udII5CMzTHXcvx4R6DtL3MU5zFjp152jBCYIQhHfFv5U92s
 QZYP8uaWjcIRoump4plywbzR6+2w4FcMnQ6SpQEdUrbNPBlm/RaCnrqbhMzCVnfdPF4B71hk=
X-Gm-Gg: ASbGncvGeBm0SxKZiqyN2UWlx5kYHmuGUNj+S5P/aV/TdezTeXrEE+sVJChAWC/7Vw9
 +Q/1yEwCb4NezdPYgbUmFhxnKozQNEs7m/UjNlhsLYd76BOUtR/f2ybTy6CmpaZkhJIJHPKrv0J
 Lgl/6zKQ1T3H/nk1VC++FKTLzrVDX6DPlj4Vur8XwfYeHTN6vGE0wN2BNsDv+TTnBFzBlfbUAYB
 NvobYhqEfr/2rzFlm13efDwhBiSzU/L6pKuKuUBHcH0xjcqFSaJnE6sSuLlg+R5KTSAKT95o0MP
 pIIMj96IfB+f4JdBU2fiHOPrCqKL9hKC
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id
 adf61e73a8af0-2207f318fe2mr8507923637.29.1750877908111; 
 Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvgejDLBkS6INLNWDK/Gkek/+S3lKYyWdUsJlq2UMYP86RfIoua6q9zR3X9TSiP+SVESMTg==
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id
 adf61e73a8af0-2207f318fe2mr8507887637.29.1750877907712; 
 Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118f7d5sm11937530a12.12.2025.06.25.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
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
Subject: [PATCH v7 09/42] drm/msm: Collapse vma close and delete
Date: Wed, 25 Jun 2025 11:47:02 -0700
Message-ID: <20250625184918.124608-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GLdsdi19dQRRDjBDRA59VDoFg4EZO25k
X-Proofpoint-ORIG-GUID: GLdsdi19dQRRDjBDRA59VDoFg4EZO25k
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX9jEN4Oi3t2FZ
 3Fvw/ENDYS8jpgrOlFcsztweI4ptbIcSG11APOqj7NxZasmH7ietFHMamdxBpNuls5l0RxefeMc
 YgUDKSS7AnVKeLrdeVaMFJdlsNh3nLQE6dCYr89aYMlWZ6rf1Vmvi3+yqog82oxVTmTG258jITZ
 1mqy4mizoblwhrEvaTJk+RpzsNhhNJrp1yDRET5OUggyODExK+d2qS1yBhjzCRxY1HuR/SspuNj
 F2/vHJ/lewCXKBwu1pWGzDILDuauf+CXh2rfOrzD9L+XnJF+X7uF5T0KWFsMvrPwozNj7GMtBvc
 deoVGpbr/yMuS720K4Nm3NPQqw/HZpltw/+JswmUqOm9rb4WNI1UZCSKQK5Ks504W+7AHlAj7QK
 FKIUdx+q04JXQ2aNjZTawza+xVDbRQJIy2ZF7AP9piKNNAv4aNRQIkFaYz3ZLt1bcH6Uv6kT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=986 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -372,11 +363,11 @@ static void
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
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
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
2.49.0

