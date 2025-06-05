Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA94BACF6CE
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A6410E9F0;
	Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I//7Etx8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C210E352
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:33:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555Ge1cp006332
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
 YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=I//7Etx8zRlLq5SrZlnM73W8V/v
 U8OLIX275hpszornK8w1yHVIvocN0tdWCenQbTLRT95l9NmSPzCdGgARNj9MRfrb
 BW1uUOt+Euot9uIF+mmf4zMzwClJxAlaJPxzSayS0lzJRW94+IkuYpFXehXQdgSX
 eEjLgOPyFA/xcdf4OZlXM+UXOyCRIXtPAThqLvPpmyBLMZCvl58haGxoueYusmvD
 LzBOe0nq4JTVuGpBBAf62wPlbCNqMZsS3RYWp66zgyvC1SJntiN5ZNlSZmGwO8hu
 ByMaMiZqZkngHstNtKp+hjpHY9xRmk2OAxlka7kEtfXNd0hNXEuRIaEfxsQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2acj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:33:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235e1d70d67so11792665ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148381; x=1749753181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
 b=G1+hDAav+NFbwDdHRIRDmFg6cXYh2Z6I6oJgiNxeeuisw/xSOssl6NtIrx4BlXPhw1
 U051jKBA1i63/OeEUMET3H8kACulesk7NTuVj5pEa0K4MFxqtM098uzYA0sq/JagM96C
 wbl6l3LBA+NHnxBXse8lpLlwPQXEZ3RXOg7ubF0K1eWg0dbGra9aIcYJGPRS59tclsH5
 sxTF0TrFS3UKIYqKbuCYoOyz4+751oiU3CiKyCW2hNv/6+REK2nvgrKxThH7OwuVVJfx
 HL0h9kNabcY9e8YTej9cXOFWoAcOBVk4GrHM0+Wos4kIXtK6NZkUtyckcVFq9kH8rw8E
 1Rvg==
X-Gm-Message-State: AOJu0YzbaY1LMu6MyxNrbyekOSD6wdCC53LvsDUVrm3ZvQe24lGHn6R/
 MmJcTchIZwDM2CZbOszpmOjr/HIT2UumMEfh9MGyWEPmKC0Txkm1fbly41qnpF41rMha9Qn8fNz
 IPGHdUxzCYoioto9EfIUuD9CZ99Oq8GxEUxJ9WhaQhTwud2QMZjXJpag0WRKQlZ+A5+eg+xY=
X-Gm-Gg: ASbGncs77Z+R2MLOdK7exD3WhwQ92hxdbq9zUpE14icYurt3mQcWXcZHABHV4jPQpOX
 fPN5lMJzc0NrDSw2MbBU3N9bFa/QKf6DL63pcDCrU/Q0DoR8I9QD6mkRhSagwQxGpRk2A1dEvKc
 cxE24ZtFzNPNxqVrUtCRl4TAa1LdWkYcaFsysZzIMy6+Bnh3jjKD3kJBq/dat5cewFf8g3Z3cDk
 +EAHcU+pQok+fnGbJ98c7cjuAcK7jWanAZj0ybPk+B+Zaw8yTrePShyzYVyPIcZyoi01jaNZ8xk
 sc1Tu/IRYxod6ynxY0Sx3Q==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id
 d9443c01a7336-23601d05c8bmr4749825ad.18.1749148380928; 
 Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpPmwrnH8+LJaSqhhgdYBbgE1xYsGuSFpMvCfWrk4O73LnRkaIOhIZ9zOZwzNOMM2oXB4iOg==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id
 d9443c01a7336-23601d05c8bmr4749565ad.18.1749148380530; 
 Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f453e4sm68227a91.28.2025.06.05.11.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 23/40] drm/msm: Crashdump prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:08 -0700
Message-ID: <20250605183111.163594-24-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gfrm6s1TSTCnD6HXxKBiMhObwhKRzsYa
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gfrm6s1TSTCnD6HXxKBiMhObwhKRzsYa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX+V7eTbeaQiN/
 KyndIsY8EBGaAO079/mZQSCmW/yCEzNtHw6WMDycfWlGLCm8b2gSN8yN3CnbbrsETYKHydqFDpx
 dz7Z7KOvFgro8ltXj58Q250rqD114Hn2Jz4n02/0BUTmsopn+LS9nz9JxzI6kzJQs7qs+9k8vyM
 uB/+Q6fpXI0igy2E/2TdMZwfQJAH7hHqG7TeTQ1WpRZp3xlN2B5nVxgNKa9JSD7AO1hR/0TLKIt
 l9ThqFwy/xGNQUI5+Sc1ccW3JdQkXttSMO0fe1yyonysYa4osn35vL0H+KXhr8C7DNkBSs0hE1C
 2v7rw6/pG7rVDMay2uIVpp6zkfgulLcArJoFC7ecBUz2ZDcv7RT7D9fImURe0mvy0hgbO11AJqf
 e62SlUfPiYkE18o7iisUCIU86vqfm2NLIVoIdDKg3nC/qtVM5BOr8aVYoRB9uHkH/d+cfKoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=899 classifier=spam authscore=0 authtc=n/a authcc=
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0

