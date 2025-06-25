Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9BAE8D63
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8254410E7DE;
	Wed, 25 Jun 2025 18:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE+joRQV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6B610E7D7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCDA1f021016
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
 kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=YE+joRQVeW83E173DEBd8DlfS6Q
 1GD/RlzoDgt9mkUKHzTtPhxxyyvWzbs0oRDmViGR3z86K8X6EbQdJVmvoMjS9LGH
 aCoGwGs4f7CoFbPCW8RKFxu0nImD+Acz1RB/QNxPSxhncmr+OH+n6tEm3Zf4RAM5
 107j05enx5cdOVRgumfK2cBxdTRVHF0WCnetEb0iBpys4sb4tPk063w2MOJRe5iS
 q3z3qbp3CUixevCYAQLdD73syXENgaIPdIrmX9ejOgWsMuMySJhm3otxc+CKtitr
 /Y4dhCGCp/6SA7JDF6HWb+Ju9gEAOe4c4bZOZOzV9h8m4VnbMe0QAUQILMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2349fe994a9so1236535ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877932; x=1751482732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
 b=V4rFoDj+434JlFSCdR/Rtesy06BTt5VBAmNgsc+rwOU4kVTpl0JGwmfhhqbR+OtmxX
 YHtwwnyYoT2o9AVGLKFzt7a36cwcvL5xf/rUPozavEuPFNF8R661keuvHE3t+g9gLksl
 xQbS18c3k0hib8vH0DVylrHyjH+nZRRythqm4dXVSnMfNxQ8Y2HpICrVDsS0SfLXe/BF
 OBnICFAXVkmBR7wsrHP5b7IaaQnE9y7Eh0aJ/xswIC1/NxENl8ah1SqVQ//cXyHEBJks
 viHbfCf2Z/cFk//JfOfP7FvBCGA/b4hmyI8ETv21Fmpd943Z+MOnBzL4VRu4tDSwGYlm
 uL2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXONqJEUDhC5XDHWGHAA2HsJAsaZNyqcHMDzwmXXHQVeQ7zDO7P3rfL+D8zkNw9Sxeh5CWDcifKa7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDzZ0Oup1YGWMDno2Zus0RZE9BjeeJbE3AKw+cPvUweiui4ZhN
 2K4mB2W3CoYJlOE/Go1tAN1z2+CSJ/057F8ZsTC+GR8TQCcIX8P4AAdWgjuRonD0krcBrXR9VQk
 x/CjLAkxyTkYs+EE0plrZmArHyeh8qUkrIJa6o6muJGP2vRt+NCzl2dt1x3HQK2RmMsandjc=
X-Gm-Gg: ASbGnctoam5HLrF69KH3IEbW2GJS9w2u9g5y5H5+MH+GOIkM6TJweqn1zCTL6Jkar1i
 dRgPWmMOYOoxvo4tQZhd9LcH4BKJ9aIBMKYfbDoA6UhUWyQZkP6h+dVdDMnNEfNqmaqNljkUCKG
 QcovTduwPe1zziPiNWNLpzxLilwwvLqSyVmtBnII9iY5COTglGUBlOALm6ZilmnhxhPhwfZnekr
 I1bpkrngVmKqYoy0FvIKjdBy4qULoI3/LPZlzGwb+obH6QkLDLwRqviEW+lJQT9ibh9CuyNhXjS
 xZeH71BhleW2k1pKHtV87br80QNvXEmK
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id
 d9443c01a7336-23823f95145mr55316225ad.6.1750877931644; 
 Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+biFg7tZ2NwXXiWCrI5tlm21WBzd0htJGfF806nU5iy7FUrbp/Yw9gOaS7aR3Qp5foqhCw==
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id
 d9443c01a7336-23823f95145mr55316015ad.6.1750877931211; 
 Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d867f8d0sm143513745ad.175.2025.06.25.11.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
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
Subject: [PATCH v7 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 25 Jun 2025 11:47:12 -0700
Message-ID: <20250625184918.124608-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GXw6DNygOTDvJfjaqv7fo8qtrJANSnHX
X-Proofpoint-ORIG-GUID: GXw6DNygOTDvJfjaqv7fo8qtrJANSnHX
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46ec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX1IFROjbZpe0I
 7ZzkRc35qCqb5obheCs66itgaqlYydKwOgcVFC+US+JhVZRDGHDuy/1GL7M2zuztZtu8hU78sdz
 4RT+YORvaDWg3PyXuLeoTwdKje5VSbOfr+tEJq+ftRtd92EvTFnjEqqoZAIKwFxYaQk9SODrzq0
 8dzlHXRDNgadDm7EsrXqLPFHfpYwaajGGoTLw43kT5/nqTW8vK8zqPpaxaXWqpj7BETZqP/4VG1
 rjjHrjWSkp98joxiPBBTUWKAoXVlGvD8k3J9t/7HCFU0Uirvgw/Ucd+qe12SASZZMAcEO4GATW5
 s71ovWS2+b5iRSOp3n8p5Dh11Jz1CahwrqOE9H4bL9TScDQUuPawYwmaZLzuvBcocXMuubQYqqr
 2YUJ/52Y8XtysByFaentLqBfNJROqcgiwaa2E4lWRbRjgGjmwbtaevzd1eWmBKIRKMrvRrDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=971 spamscore=0 malwarescore=0 priorityscore=1501
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 194a15802a5f..89fead77c0d8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -61,7 +61,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -437,7 +437,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -615,7 +615,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2dd9a7f585f4..ec1a7a837e52 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ef0efd87e4a6..e16a8cafd8be 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0

