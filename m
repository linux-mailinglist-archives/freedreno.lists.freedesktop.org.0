Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B35AECD18
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083C010E29D;
	Sun, 29 Jun 2025 14:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOZOc4dD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A40A10E29D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAh20P010025
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
 6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=MOZOc4dDi1ck9L+QRSsR4vZJwBN
 66eV4YkdpLb9pYkCICHe++0gI4JQ3qi17ivoNbzlGqQmEq0KZtVhP/qPSAI230+N
 g7I9mBAWanm13+hoPbJcgMEQ/7YbZQNoTbQ8OXftnNproAOLI2vBTNGhX0tEpAWm
 WWdQ7ojNKt7IqYLGfxZdoalrUMTNEkKUH/ysVIOI6zA4LO5zvimkfl0smBD2vfhR
 cNWasV/YbqBqdohcaeJZNvsitE7Z11iw+kG/JqR2DCy1fRM8bSsgXVFZK/+TvpDG
 b231lke2FfeELS6npd506UWJFulJ004DvoG4D6bSLL5fFD+89CcJ8y71RaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748e4637739so2577201b3a.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206044; x=1751810844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
 b=u4G/YKhfbGDmkgwpYbNbqXcdDXmmUDEsWOEI8aP9IDzrZg+I18qmG0kLLh9ejgAvO+
 aNDd6uHUpY02qCDf9DKUCyzcwZE8n94ZC1STGmXdxTS+j07PCaNAz1+yNB7fpc2PMjFB
 ATV7oENTBKbwoVUg8nghX02VQZG43f3OZuOG7hfArR/wkc1HCleNm58pPZZe/oqlz/4T
 F/uFW/QZewKslbyoYDnlNPvIf8333BvjSMzVdASPFhINLSfHWcxxVo+Wbb4yRGeAKGby
 Xwvm9kUqhlAqK7OmX89t0eCk6gz2wMf+vwtV+qBsSiJrhbtZPI040kbHecW5KTpJ0vwB
 Qgng==
X-Gm-Message-State: AOJu0YxbwMvw6v1MOvQV7/Iec3RWBCNi0r49oqRFc/oaL3kB9ixaTE6B
 mDX60Yn1hCXixW5S2wiiOTPr1KEHpp2fFgS4G4JOJmU86uwRhweXI1Bezxbbq2n20RFB9+Z9uKz
 nFR9KRTH6xg5aZOL+fuhR2EIB+TYalN+zRuKsxDkOQw2JeX4S+MyMcq1LsbzCfkKxeqSMMSw=
X-Gm-Gg: ASbGncunkwWE0/VHb8cCJi4UlF32iFtEH3VgsmjZWfT9UbQOFsZyW3/O1Zhk4oOmwVN
 SV9y1S+Mc07gsYZ/DPx607s2eUuDvTIRWC62lTnQDUWyzOAXMmkmscjwvI3RCFUfxMWlczI5k6A
 sJJdXhHRMyLfAjDpfpvMfId4yfighPcETW6/MUrsZXAhI8DL2gnJSv47EvQUxNr7eFjs1kboPUh
 jKgdcXq+ovIsYqtu15Mz1FPO0fu0zNSIUFHVPklhLFNCtmvOdPW1AC5ZvL+jseguI+t5oz/6rhC
 fb0W6PXyANUxUdv14kha3VBkW6elO74S
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id
 d2e1a72fcca58-74ae3e79e9emr15110879b3a.2.1751206044397; 
 Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzFoHhs30uufRxyXEDa8GNhAGcI0a2y/Q4jf783ZXcR3TPwpNn70ssWWhJXCFQV5WbzR2gNQ==
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id
 d2e1a72fcca58-74ae3e79e9emr15110847b3a.2.1751206043958; 
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541bb6csm6705036b3a.41.2025.06.29.07.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 07:03:12 -0700
Message-ID: <20250629140537.30850-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PUoMCmi2IBiQ-jvRt14oBRp_q5GSx-uG
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6861489d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: PUoMCmi2IBiQ-jvRt14oBRp_q5GSx-uG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX8mm+loZc75l5
 pvJW3MmezLcCLwT+bCG/q1qPrdzHzN4kDaqtU+aJZcVdW+ro2yDUyf7c50M1PdR4xjETkUAy4v1
 XJ0Bxwku/qn3weZ0yKJ7DHY1n48pN1BUjx5zrrhJDZmaD6SUZM32OdzuZhr7uroMRt7TCbaptJJ
 MWjS0OPPMitfJzkXB7i6pw0ugOLMU8KNChwjXp4zI2eey+31gFMB0cqmNNl0ZcneTV/PD7wM0WA
 OOmMRtIpBn1QSIfHrn9rWXEzJIR2++Yl7xcZ+ElOnKkYdNrEVZTPi4wzyJ7eEtRdDt0IVKsStel
 dWvPcDL2KKDU+VBfpzVTtBAgFejZGij1pDlVMjv9BdiqXonlE4e9OZ7lemZe0clCeD+aKzZ/4fC
 4jCrxK0JLvtX/vNfghOu4+0NaDu8T6SGz3eaB9iaTuujUXp1FyRVnsUQtjiOvO55RHDF2wEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=990 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

