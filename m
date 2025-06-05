Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7EACF6C3
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3BD10E9D7;
	Thu,  5 Jun 2025 18:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiM/bpZ7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6212610E96A
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GmKgO006326
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
 kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=jiM/bpZ7zNpc+vJjH40exJvMVGF
 sZ8pOG32e1uWNY98RpOn2vTEfPgg2z8nRX/v6Hr+jtG7ULbmtdlrrB9JftRTwf9K
 ozMd5b3w3V6jH0IjilHt8mRfgnarcyjCxQKHYf6pVqotbvjYLNkUKnkFa4Z2v/o6
 p4+JqDHJhtEr6mzhhmxuA0YOFELOqo0XX3FBGbjBQZ8wIglcAl551aLY5lPAf8rp
 Ww297rmTeMr85hLtEENlbsY1Q62Gfyf6LtIhIvYj1JBwNMrbJyQvRl2+PJDu2Nlh
 MoVNMRI1663AVLQzl2BDICWj2hdq3QWfjgoxWWsxG7UT704SnPYQ/I1v2IQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2abp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b090c7c2c6aso735892a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148373; x=1749753173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
 b=cHfFwIHHInzhR5LjqEKPiDaF1m9WGNw6BIat1cI6YT9j8Xaqx3/1nIj50u4Cic8Xpu
 sMmG3xYRCYo4xwBxgjMYLhJaR5H/uWwl37tEgp8+gg/qMGw3pF1N7kezjt2HbOmikQEf
 FBGiyJ6cqKqjReX8ZVkUOy5Mz2bCinwCwD2/A8IzUw+kuh7Ndif26vRT0W2524bDHI7Y
 iaM4NrhTZXF/5MR+4/QT+BEL0JblJ94NhyxLslQAVwoz0/DINDkCHNT+9/yc5F2OV1Dj
 mEYe6Sa7xFMlsX3uDlNyiyFLreoE77jrg8t+yTQmq6kWvHiYUlei5cqYyM6kHuKv5LS4
 1tLQ==
X-Gm-Message-State: AOJu0YxjiF8Q16gOQQ35ryV3oi5qdMMYNOaYkWLVEnxdybaQ6BZitPNb
 BficP3X2PxwbwM5rRCa2cbbh3v38znruX+CHbLD4JKIew2WpTfCPE3RBzhqIM/6XYecE9ZsB3CD
 FyQnqeLOFQLlgQvE9qoKILlk22v75zbEMXaNuLxkpRZtWefomgCMOFMI7XFx3/P9wJpNyAso=
X-Gm-Gg: ASbGncuKJL+OquuPbX6yTqGl5bfcpcVv6aen53HdpJEOiKYlhGLhiLYCO0QvvmCyLwt
 fGhfbtV1JdPh7KgxYrKq0kwbKpHoc1zBlt8Nf1/VQkVy3Kumrk/RSfwd5GEjIOXRoYuwciis42/
 RpBh/j+86kK/9bPdrHeyibB88D+V2D8GmLEcYOQ/kwD9jhQfigbk/kX4qb6ARdneHo4u2UC4iiO
 3sDK85bG2bQqI0y/tqRDqMq90cJK1DNuVilAHWeZhxgIPDc/3fxWb2wVSBhVkolF0TjchXUULyA
 gW0seavnTew6lvN4oobS7Q==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr888503a91.21.1749148372982; 
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyetsmd5uwbFaFtMcmZkbXRpee07zjRboGQZE4XMHIFA39QakUNWJDzUUaxfsPJ5Rk9vOEJw==
X-Received: by 2002:a17:90b:554d:b0:311:c5d9:2c79 with SMTP id
 98e67ed59e1d1-31346c50561mr888471a91.21.1749148372577; 
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349fc5460sm61213a91.23.2025.06.05.11.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
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
Subject: [PATCH v6 17/40] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Thu,  5 Jun 2025 11:29:02 -0700
Message-ID: <20250605183111.163594-18-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kcS-TtvYW9wjQ_zA95v9BEmjwr8B4GfT
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: kcS-TtvYW9wjQ_zA95v9BEmjwr8B4GfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0q+ZVWoQdRui
 bOtxcmpovAAyW1qIPIXs4td/OgpD26eKDcJ9iQVjGYCumCXCOHgYNVg401VJklPsr8yqxK4uw1N
 McKDzRqCczHuFyu8mJweAVC6z6oogOocagBbQu3OUQeT7yCZrgabt5QIJXnyIbPkGQx2xuuT9eX
 fcsNS+nJusVipUO4OhzAgL3qjlw2UKzEp+PxBvBPSgfL5/IJisyh1vuIdshb+BAkQf0C1FB+4+i
 TCpL0FHudxNcTA2bnfSt2NlmF4c+ae412pGMPle59zcAK/vHYzj6VB5uvq6jHvrq9N2l7LJEn8a
 83aG7UEvskIoKqNlPNUjnUm/fAtYw5dcgcondfDxhPr7Mhho6WLcTLo9s0VqE6JP7tHkTfGQlQl
 CnYgZpKBPWjFdCuueo5uGAos5N0ypZsJdLpbslZmYck+jbKTT8HqoPKmDzp92UBZYUiR0fOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=974 classifier=spam authscore=0 authtc=n/a authcc=
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

