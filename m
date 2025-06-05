Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D35ACF6AB
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB5610E8BB;
	Thu,  5 Jun 2025 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU+I33u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3CE10E8A8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HIVAd013476
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
 aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=RAU+I33usmA4f5r8pB/+83MjQkd
 nKgsaG2tXLsDYbppqPQXrhFQ9cEOS3ywU/JfEcPn+zjix7z2kjfQelMFU2j74uQs
 WEA/QJWQLT8jZHTTf3FivbTD81qu0lJCsAxVd0myzt53FUz2AGloc6iT/38hTF5b
 zqGtx//1a3B1gKH6HLqgqGVQBancscjVIpqlRmFjuch/EFy0CJ3QZ7AeILzljkv2
 tPjht7o4fWU/Mx5i8oRTR+WHjRUqfQ7ywMMaNclDNB93Q4lXNA6Ji99IQEHSYSI7
 IHXDSCx38TBNVsdCHjhUzCoQ+dGwAewCnnwFGaUZ6ruPo93RoRS3lrqmExQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234fedd3e51so12374955ad.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148349; x=1749753149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
 b=pO8kz0Rnt4BYc6+JXZVkSf64cIzAZqbQiLmbKHpIWBRDAK7qilVArWVg69mqF2uuN/
 RvYdMKM/3PpHpfL/1U07k4DMf/mDVqwhsqD7oN/RDMFBew/napCFBrj8Svo/MVemmVWG
 sfL5z5fXLsPniJPR9CuoG5+NQK7PiIMc2LRg9bDSdlFaY5vdDXj9QE4J0crKSxli9vlu
 PZszySWxe8Dyot1T/00q1zM4IKmUW/3Nvcdk+HbfaVq+UaXmETEmDlXmeUW95Lr6yJi+
 ljCcmWeoa+kr9tcfUdJqNGMfCJb3iqvsheSWRYlxHiRsxVhh4r4QQtggQDcpdwP7rdIF
 Y5oQ==
X-Gm-Message-State: AOJu0Yy9se57LCxDTBgJwNFuSGlas2yEUHDVd1mY5HVtyrkA8P9oZx8N
 CpISwoLg0dBMGhs9jftfMXiv0v56t0MMn84//Cq0qDm//vu1nXaCaBwUMvhEFtGY68ujcc7kDgM
 bXQ/ZIa/poMgliJLuMzyU2h68trjkoWfVdTL+Ake0p1c0/yedl0w13XGFKu9t+ODvezJ6xuk=
X-Gm-Gg: ASbGncv08/U2CRcNRWG9B+90E4nwWarmjj/P04lagxFfT4ydllDKFTkaSC4f0aLY7Rg
 59SxGK0c5i7wB526PqjuekznLvCevzme4qtWMxgJiBCwveYPyyUTNRwLoLOFzWsEP6kaAZlcat7
 5HYu2FOY7L64jI2Jp+azK1lDnaiAmrXLBf/xZsD8iqsN1BflorJPrEySe06j3PCpxSM7P/ElU46
 3789US5StAj5owMXYqaWexUKP06EroRoUO/HvlqKqoq0IVz6E8DEH5OehbQNy0FmhrfOCEaG5S/
 8bPRLlPDGStzUCtUEjbm9UKh64EJ8b4V
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id
 d9443c01a7336-23601d22bcfmr6076365ad.29.1749148349355; 
 Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPYl3bi4wrAR9P4qs263RGT6xV2qooQoNsSl5TQxnW+d38CFd1PSGOkF9JdpsRdaUXFkAvA==
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id
 d9443c01a7336-23601d22bcfmr6075895ad.29.1749148348947; 
 Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf47c0sm122361975ad.175.2025.06.05.11.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
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
Subject: [PATCH v6 07/40] drm/msm: Collapse vma close and delete
Date: Thu,  5 Jun 2025 11:28:52 -0700
Message-ID: <20250605183111.163594-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8LuCwwokaKXWRv09505qqXxEtVQmxMiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXy0ApOcbTnvPd
 J885GIit4tkFY30nPKZrV9NitPZLvNJbVjXtsfZ6yrgaGHwuUkUby8Dsh3tSzS+knc5T7fCOrrY
 hkR6R+j9MV3MBzO2sDKrL9acTU/QNh0FInW6uIVApllhg1JHvJfOBId9awqHP79bA66FbYCDi5k
 h1tdPBemA3pZlqGoS3gl7sS/7X8i7SL9JMg6fFxFDi5xVNJOM9eaV38TKBKf1pLY7qCX+aRrNPc
 9jGUakf0w98J43AaBbGq8/Sn1pf2aRPP/sa4UsMMtNBrK1j0V06kSmycRrFJZCJPFI9C+GedzkK
 vwFLUeSv+VS3/LipngQbbc3TaLf7cOl9+nUn+VfoqxGL+fbqa38Xv/fgh9uCQrGvXwQAFYBwZFn
 ESdcdvxpas+/Wt9N42ApQFK4WIpjQ4AXFD7Kw+AjjO2hScqY/J0nMDHAFyRmD8oXv4J/12og
X-Proofpoint-ORIG-GUID: 8LuCwwokaKXWRv09505qqXxEtVQmxMiN
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=984 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165
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

