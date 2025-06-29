Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BCAED083
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176A310E37D;
	Sun, 29 Jun 2025 20:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXakVDdU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FB10E37D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJTUcl008856
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=POLN6v5Lpeq
 4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=; b=jXakVDdUTAXAmDbl8kMVcFG7Poy
 NYeUqU4wYtJYTznqIKlLMdkB64iRMu4VxGlEf7rUxr6V4aj+EYwBcXxScLXkN6E+
 I17FoWrVG36f3ft2xOxNoPEAjMBXmiAgkiLPyDdPKJoabrfhrPjuHs221FxmkK00
 BFAUYDkiYV0/LwyzilPfBq1FwSAIGfWz/P/7RhHz0wLC2tGT1lgh5EvudVXMnX+2
 hPAKJ6sRQbLVDztGxyC9ibOo7aq3SHFXMImizRKHK7Zj388KHIyqoOrtN5PkhhFQ
 UCGdhhGMrAYEszD5UH6Dbq5b8B0/soxZczk9roq+doV6UvaNyxg3Al/YcMQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjps9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74880a02689so3017131b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228215; x=1751833015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=POLN6v5Lpeq4YKP9lCUNA2S7d/qpjdY9Nd2TrkcfwLQ=;
 b=fU+lm3WIK8p7CSb0Dubag5U7nluYcudgYnbDox7r0Xmj2TwqtJnduR/u4D6iuGl4ap
 YIX2r8XBngModusjWqlLHlik4m3o+CnOQLeY0nbqsYxDZjRzC80WYB50B2LBA15Lks5A
 rmsIzNURV2YjSk2tmjL08cpdjFGmI2w3alPDyO/68Lf+//zAWEIHxE5BcGUh/LgwDe39
 1MpD/Y1hyDeLbRw7B8V39jy58939dWVVtYe3B8oiTuR1T0vqigjKTDSrPU5OPTUSJbkH
 Hrc4ufDps5+aBSl2hyx1iQ6UaP89tREF1sMC1WnUNhtiigMF0gdJ+DP1zPzDAjrgUAQM
 vsYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa8F478hDNDiwvSmtRkLX10i2tPtjUqzqen5q+dU2s2frxg5i+PLQ+c9h/BW/9NOW506MaXuAeEJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycp85nn4bjJ+DGNAgC0PVgxCZmfx9EKv71WUKbnxVNlsPHDU91
 gW1Tbi7sNNTaMuShP7mgSArWk6esUku0cxhS1bRYglOGFEXCZQ15agLiQXc24GPByLevR7aX8QO
 vyhyeuWu18XKlxD6z76q2+V5dxoPfrzxYncLUBoX73yz19SCjsJPkAHYjMHBLIjOcYGryy2Q=
X-Gm-Gg: ASbGnctk7CIKHozgceUe2z3EG2ogqakHg00WvzVH6q9Be1b4eOnOT22L5lAW8cJius3
 Y6PDeg9xWXX5u2Ruaw+hbqU88nXu2h1eseHRSU7H+LZkjRdMxNtpcvijoScFc73SbezlbMd17fQ
 WKeUl7I8FSt6doBj/yQNVSXmmwV4GJNVzjDxHQzlUwf9hn17zQgMv9lM00+8WvC9t1lQybz3+5g
 9LjMu3K8bNPIjOvuvKcrh79tVGCP7LMDRY8346haR9srLRj4MOnBEdRDjZmzC9c6WEXjcKway8z
 1w4AHBFxwkKTKpEehbayeN3LCwgSYJV0Ug==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id
 adf61e73a8af0-220a17fa94fmr14766055637.38.1751228215136; 
 Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHLdPOpOfhHnUXca9fxgn7Is+j9F3do3zCU7Zho79ZKpG8mV5KD0ItKS+VliQr14UVvffFHA==
X-Received: by 2002:a05:6a21:2d4c:b0:220:5c12:efa3 with SMTP id
 adf61e73a8af0-220a17fa94fmr14766020637.38.1751228214658; 
 Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54099casm6902136b3a.3.2025.06.29.13.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
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
Subject: [PATCH v9 26/42] drm/msm: rd dumping prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:09 -0700
Message-ID: <20250629201530.25775-27-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U3s1IAX2hT1sCwkLiZNlg3zIgAOSnOoa
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f38 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uvlqqL4q8Y98p8K7alsA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: U3s1IAX2hT1sCwkLiZNlg3zIgAOSnOoa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXwau7tM7HTNiH
 01FKlK7HboRKrfR8FBqKl+vRUrOhfF4kpyiY1I65goq9AmLeyGOlIDFsUX+3jkFrsM1eLj+Svv9
 hzLqXIh/uAlUxxaHIzaIZmoITB6W/rV1xF9oYesn/G/cnEdTFWe5BYZBdppHoe18/QM2VUIIyYU
 3Onvb08Kn67erygqX8KN69dMO5AgOpPmpDo4sx5Mxf3aXrM8UqzUDrDtVDnIdDOzkOxekg5POKH
 OZJo5Ny75P7Yn5zw29BBeifVlZW3ukfLXfSB1PpsypCxxDWuhQRP9EKol+gzSx/bD4XVlHqi7iF
 ATqOta5EAkuMuK2gTRleobzo4PGsxXizbukXjjAFIT7aVrv2fUDuVwOm29zS+am/1CMmR4rEeGd
 B9eEeKbzoIED1lPxsT1QxZQ99WIfWYMqD6n4TQ0/wPSiDq90ZmeJ+ce8kUQ7JxCzJNoAbDKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f2631a8c62b9..3a5f81437b5d 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -403,14 +403,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.50.0

