Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7510AED08B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305D10E37E;
	Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDnx0LU4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861E10E380
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGrXQF024711
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=GiAM1wF2+vU
 wkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=; b=fDnx0LU4V7NKf/OHFe3W029fWfR
 KMLSNdTZblHmLjLR4dw5jo8GT82U7nL331ZLB4da2Ebv10vQNaHHN7wZYlOuN8ZA
 AbFWH6WOffGfZEmZF9Z6umoVB38M2p+bvwxkZjlRfEtUafuRHAkoMrD7ZqVMFqxw
 C/wj1zYnnTqFzIOV13KLVfR8lPZcoyixUOICiTP9IO+PHn7PHMw0j9f9Y411uV69
 LPatx/1jiGL1ixD9ax+1Kdq96MaiCpufalbmnhKIHKoUzcNVs7nCgmR9sa5BiLpx
 03EXbT0njybEpmzmMwpMb+Ljh0cdiabMHwcOrRVWZyc+L8vBhEg1JIn33xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpth99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso3183579a91.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228218; x=1751833018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiAM1wF2+vUwkpCq/AxW+9TLh9YmmG5Rgyh/h2VPEqQ=;
 b=JVFrHs0uyL2zWx8kSUCYUZw5tSlzZ47r59NJpitMVT6bXc/UYT4/hPm28Ev47G/2eQ
 T1XAmZ9khKLFiChbY+qoocQ3QK6DnHFRDZmxyb9tlDOFIxbpHdn5ecCfJIHL5WisJL47
 gKOC8UGBjgCHI/rwr8F8a/DCIE1UcZOczLw4xoDCiwLVQgQP1XKK7uAeKkyMUeawzNy+
 4kY9Er4Lz2TY06iCjNsESN2QQA6fOX0o+uA25WaiGA4bZP5dfB2E4vb7OE6vZEQSIyv1
 xZDzMRcySXUsm1N1qF5J2ECtdgxayxOuHnbeuqHrDmwSvy3G2NlBxfR1NbkGEzYIRt81
 IBNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIDlAQ7oTCAHakBdYjiFgdoffHcxuPIY2Gve+iScsQKWEIvrrjiyEWhOHmffvqObgshjBY7Zd6u2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+BohUbmWnTVpsMyo93SXaVgF8P60Sz8IamgOdTdyhhhQlC4+6
 O+mUWa2iulymGpaqRnhlyPW0mJKK5OlXwrQjvsZXoLOYV3SvnBYwnQycYn1dxbCNH/oXt5eYMRu
 M9TpdSzIf3XJY9/DGKUAHIs7DjKe5lQ39Thhf+DX+NzKc9qL8tc6Jmf+lvQay1GadzK0q+F9ReV
 YBhfM=
X-Gm-Gg: ASbGnct0xesfHRTMldBiRK2RrDQgkXkV6QwpePbxYOr/IcQFkogmsU2e4DEdOSluMHI
 mPcB6wt4RGCKNZbwJweCETc7gd0OOqPIG+RPzhSyhvAmMZ9gIsgf+gZ5W6kLVmPNqgTM3HOLlOj
 pvL+QRGyYtncoh6E083+vFyoKXZLjAwG3vaRmUqX3+AQaOs/vCzZwt8txqRuGBrbtj+4qP8I0oa
 IdC+YV2jxj3O7lkCh+M5BE5RNLs7SHicfNJlllQwigTPKturMdyHiIvsRD8qa+6XKl/1bfQbwQV
 9GIwPAdMYxUCyoJfOXGCKzyQaEW+CcPVPA==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id
 98e67ed59e1d1-318c9256c7emr14508876a91.28.1751228217632; 
 Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp24Z6Ubl0Mg+UKuim2CPGQfJhFY6T/tHTvs17eA1pXtmVUu5AgaaxuE8ttGSFY1Jqy5xm5A==
X-Received: by 2002:a17:90b:47:b0:312:e76f:5213 with SMTP id
 98e67ed59e1d1-318c9256c7emr14508860a91.28.1751228217278; 
 Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f02sm11646942a91.1.2025.06.29.13.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
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
Subject: [PATCH v9 28/42] drm/msm: rd dumping support for sparse
Date: Sun, 29 Jun 2025 13:13:11 -0700
Message-ID: <20250629201530.25775-29-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX9LigR4Fiy0e8
 I27F5y5j+/kkP3zPc5acOulDM/9rMcMW/9OQN+H/IbJu8UgmyAacwoFHMzuYrGrF/VjZPGQj7Gw
 LsAB45XLx8JKsxlurViequE6lds6KwnRutWXiIVxp9v3nPgwmTYFESu8l5mhgiszuloqc3pex/U
 CbaJji3NhF6mL1lTB5wg1cU6aVHWO306RZkGE82hngcutDdOrtZkfIpqCk9jxlErP35yj3eiiMn
 cfGytv+n2GDiV6R98OnSuZCC/SD1hhGePbGwro+mnrBJ/eLcoM9B6X4WA+IyuQVyNt8t5/Ud1rT
 Ye+k26LMa6g/O+XNdB+d4goV0pJ8X2VTjhn2tklcmBtLJGmzSMwp+sKKbG8xDlabmgCyNbVy6s1
 uvjQUT+glwPsOKyv4jhu8bMH/2Bf2gqB3CSDgrlcdwTntuJ7IJageTcjuZZgxGTt0W7yg0Gk
X-Proofpoint-ORIG-GUID: NTxK_t6DhAqEICQUja9CnBatX8qZmFsO
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f3a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NTxK_t6DhAqEICQUja9CnBatX8qZmFsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.50.0

