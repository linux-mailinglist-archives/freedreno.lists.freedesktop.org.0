Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00357ACF6D4
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7ED10E8BB;
	Thu,  5 Jun 2025 18:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsuQiSsJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29D610E9FB
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HPE4q027289
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zZ0/1Hg9ehG
 RWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=; b=fsuQiSsJj30cmtJOeqGzFAOFOOi
 Mo9g9UZe8WJq1PPD7eQVIt8R5IZUIh67C1TGbNLloUQIsOTxpMNAv67WMWJTDFNT
 B6tRE2tNQKmSJCfsGadiw3A24jpEeY51zWCBGKhANib6A8v8Rp4B2b27lLQcOnzF
 HZuQSbSmzu71tfRzKSMeGj5AKOr5W+oPGWhEa7ojUooMJfCn0rEoElpo99QzmmN3
 ekLfyOl7t2TgoE4isly4ZCs+sPVXtv8YXJHk6PiSOJgv7TwS2usKykUNPE1vGuQz
 N2ka+cPVXlqAWV/5xR+xBOUo65tCfP5hyeAlYlda0jF1PwHM7/UCm2UEYXQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t29q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234f1acc707so11271725ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148384; x=1749753184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZ0/1Hg9ehGRWkpUmL2vj2q1yR8YxmohRbA6KHUWPBw=;
 b=V/+Nol5YS0ONxI6QW7B8/0B0CQq/Q1QKIiJ5LKP5bj5yXXjbkPECa4oiYG7gZP7SrY
 M9Ssf2xPOuZhstQVcK0HUm6ZH+JvK3x5Rpr972hZBSOfVvNHwi9Wz/T65Ze5dAW6UbIC
 KUibWrKGJQMbA0uEohGtQp6BNihP4Zjbxxi2hqPswjcn9MUhgIAi8hC4GSohNobaLsWu
 mSGKydHHH9sFVnA01rV+UasNLbjS1CfL1FjvGiHHmnR05aBxoWXvH46qhepDDnp+Sv+f
 3tOeR8b1b3f/OU/FLtmKg0axbJ9B8Ce8om/lKf3QFvgHyeIVEuPfGOXB2coFhAZPYIvH
 Cftg==
X-Gm-Message-State: AOJu0Yx/2ZV9Zo5ty3aLXrJjOkKmSBQtKXoyrxNYuk9/Axxfzyr1reqK
 q578Cg14zgZ7Z5T1U1zOHrsiwInqLmgDYu4Fm3YrlG+xeGVtdcNoHLVVm4q4JcB8J0YTY1/BDhp
 VGjns6YTyqFwh5ueyRdn0BPZ0qDHEysLynBNUt46IdQ+AlXNq3mffQXsFmrfuiW68gJ5sFOM=
X-Gm-Gg: ASbGncuq7dyGbUWD/AwBwkPJ1QJYOsMENZQM5w/WND1RJyxwLHG9I+B4UND0eJ6TZhP
 T+shYSHyUthvbEi/bnb/wY9JZeGPYEKptB352mFHaRR/lIn3NEs+TkuLk8JeyWqqiS4brzCmnF/
 hpQ+HWFrr3ob0BYfyUich1IVYSj6ta5rtU0PWWy/AX3onT6i7bEcDqAScFEUhheeHDqlQrj51Se
 kaFF84nRxSKv1pBxgSPz7h3ez7/H1tCjR80TZmdwK7K/r6GkuCYCTw0D2CyBIGs2LmTHDArKUoV
 nbEPdvvi6Z55CrZZo2eReg==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id
 d9443c01a7336-23601d19e7emr5805075ad.31.1749148384407; 
 Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE26cHcfxJduxTai3lL8l1HHuGp3dVml0D45JxZwDr8TR1f4qPISu/CmoAgjVwvP7kZpTw7SQ==
X-Received: by 2002:a17:902:ea04:b0:22e:4d50:4f58 with SMTP id
 d9443c01a7336-23601d19e7emr5804655ad.31.1749148384001; 
 Thu, 05 Jun 2025 11:33:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf471asm122647135ad.164.2025.06.05.11.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:03 -0700 (PDT)
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
Subject: [PATCH v6 26/40] drm/msm: rd dumping support for sparse
Date: Thu,  5 Jun 2025 11:29:11 -0700
Message-ID: <20250605183111.163594-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6841e2e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Oi01P0gpvwaEutKy2E0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NCBTYWx0ZWRfX8a0nokQ7pDwz
 4Ji7lMXKbFA9LPnZgPfNzO5iFDeVyo84zFdIjFRYIOGvx6eAftFYiPUJzgdiJLkc5gZ/fDakFEr
 Q0cXUuWaY50y5iebrno5REGD7dOCsqSxgBVcmb3AUVGTukJyUS6bypw+AmONozKiRERDiOWFy9r
 jLz+cJQdnTXxb1NrIgY5Gkp/2s23R2rhw+YMtJEMUzdM1+C0I6nKDhOoTp21jvgLhouKm1mGWbd
 oXuL9ulaef5l6hpbuCOyCnR8oGwRLHCd1myTqeDYEdxq2MwnVBO3plLxpB5waMCLA1Kgxo23RnY
 V7mS1vZiw3lPBpPP4Y+BH+bfKVUd6HdpzdvT3+rpBZYhA9gOe9vDd0ScIGsimvG+h0rmUgE/tlW
 yQrxRt9ftmuKiX0jSBo4qfnV1dVAZMP2CL5pSasEAJDkc9DkTz9tkEuqbmU67d47jOQZYQcw
X-Proofpoint-GUID: sj0RquzBww1Nu7feXkrHFA9ZnQ8Zcxyq
X-Proofpoint-ORIG-GUID: sj0RquzBww1Nu7feXkrHFA9ZnQ8Zcxyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050164
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
2.49.0

