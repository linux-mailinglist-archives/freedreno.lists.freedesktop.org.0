Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68FAED06D
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4181210E368;
	Sun, 29 Jun 2025 20:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfFz9SbT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491C10E372
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDwcO2013374
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
 CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=JfFz9SbT1oIaF0VZxe17kxpx1zQ
 y42O5dIOd7+otgw4y2tjiZa0ga+TJDQE578F1Lj/wr0MERp9ePDYYLEy5JP1MzTn
 jnu+KO38ASHn+07D+1JLTOifyxgSwAwc53gbSLc+Ga47lve5WwLrHJxqSOGQ8Ome
 nA8OrHRYanXlgpUKyj9IGU2JoC0BXzo9D15hDjIeTqmomR12ORLoAUyfD2mCBsrb
 xb8Qk03W8a6XfhCqZL9EcP6rmUiv4YLSEv9whb8KViPBsvgfmrNBxOxkubP4BgS6
 uTLTigHSMhzWrDZT76x0dK1K87z3zQDfsDNz8D96yaYm/OpLexdfwa+GZZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2tht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23494a515e3so27567025ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228205; x=1751833005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
 b=AnnWwIg6Hxqtn0nMDqpqWUF8hXC94be1UrlZOE31zYGf1eXK9u9/xFw5hRuhR9kNdX
 vmI6Vg+3icN+xvobRD1y3Ov/aJuDiuJT/sjwVa8VOjFQ7eK3ybAgRV0VQatU3LB2F1Rk
 cCqKaOJQz4dFrRLLvr+sCSDbheg02kpf8JCJNPhZPsbCp7RE/SO1LLJOQTUrm4tUU1RP
 uxgPaWKUVuesWdIDHZdYo5RyXSNaRazp1c0tCGar1qbHPCosc8vQBg5QGoBQaSWW8yLb
 siClpgai7QcvOnq1C5zHtZpZfQd8Hlkg7ho6dkmqJVmhU4wdCHeEAXMIdVTE4/43vAAw
 zShg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMpNJrjA5KjEOR54fWocLIEBFVpIYskf97sjAbLzETCW9fm+M/Btfq14NQrbG7jiLdHJF58lQwhIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYnTJYsnPdaiRCqLRJWSBQnDoZ5ZtKR7uwmLbpE40aV4ZxzjUl
 O+CjRTt3vTRZDu894rZtd5f/aY+FuePyldEhMnKh3A/8asJ+tDj2vnbvKLdvlXA5ingHR+IlP3i
 FxLeiiDRTrcj17OMPITYCihPfheNYkk4322fpG9VpZyZX9VXF7Sw96mIqQcZX+LoV7QSuByM=
X-Gm-Gg: ASbGnctgw2cShTMPijVGTmZmtL5AhRavKZUdD1L7ibplMqp59KJdS9AiZ5eiQQA/lGB
 inNH4WuhNQNiH7zYjjWcEj31dzhIZlrJvUdyRWLy5VPKrf/Z9N4RtdjER+//RW4zUyJj5AIyRAG
 dA+tAIliyDhrpXS7Mz5tUNv5jYozvRv8qU8lVaLbz/lncQSha2pE1CYn20x09oz5uLNB7cnyB3r
 +0x2Cvotwyr+vByLtB/8ZzG9TDaNls/hMfSDfrtEJbjMGMzdcI7N0UsZksHN5yFbeW2v84WJei0
 q8AzOg3EY2lHKGnTo12/j9BdtkOqoZYV0Q==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-23ac460838amr190149755ad.36.1751228204910; 
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi+FCZAiieRq2GK0HZyXrffH2uO26d9xwGr6VDhBhxu0D5CBsaqa1z27xVMPNiaaB4jVB9mw==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-23ac460838amr190149445ad.36.1751228204550; 
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b0052sm64461035ad.158.2025.06.29.13.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
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
Subject: [PATCH v9 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 13:13:02 -0700
Message-ID: <20250629201530.25775-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX9yZNvGi7xlGT
 fMhRuMJu8Zz9erMHdQB8GsRiXC3kh/4BfLaviYkihYHMnU/qUd5CbjCjQ0LbNM4jwmYDCzBj1FB
 DHCTNnMCcR0DMixpPgfSJu1X5NBvXsUmxJq7uU+be+Tx0JfbUnTeevR5gHmc5sdFavD+t19iMNW
 vkYC5YsMXVzozV+vKBEeN62FOknD2Usq1/N337arZinSqSvnYCjsTIqPCFhVYmlAh0M0LqA9aVC
 3X4Yza94E99m+jZzA9BfKEQahPvlS312wpd8oapqkM0bf1YhA0MgQbky0rLTXRi9X5J5ovpuxfg
 uzWJLu/IztHuNPpP0MHSve0CsUX5Xd9EQwhDSBsXFm4F17kODrVtuTuNmaRG+j5qspknk3LSywz
 DAq200pnc9mZuFvbEAy/Sg/QsNYBHvGAnu2mFq1NkkIHsTbZ1UGbO2Fa1Dpxda9uw4By5Ymz
X-Proofpoint-ORIG-GUID: 6PmDs167VrOBBbWVfMN5WAYf76yupl9D
X-Proofpoint-GUID: 6PmDs167VrOBBbWVfMN5WAYf76yupl9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=972 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5c71a4be0dfa..186d160b74de 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -57,7 +57,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -433,7 +433,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -607,7 +607,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0e7b17b2093b..b5bf21f62f9d 100644
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
2.50.0

