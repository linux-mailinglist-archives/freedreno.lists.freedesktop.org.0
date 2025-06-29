Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B9AED07A
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6D910E37A;
	Sun, 29 Jun 2025 20:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw21Q6K5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0D510E377
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDqWEt026426
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
 4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=Hw21Q6K5584PMaleLKBvAEKOLvU
 PfMLIfQ/q7iD1wwv4xmqE1S3x0eYxUfgPQHPImWOKTjCbZhqjiDSylHDkI09/tlx
 nocgV8FTfzHc2dnoFkYEvYDctSSkpOo5aP5Azuvi1RQ9tQfR68HgytdjsikfdV1c
 a34/esORWPg7VcPojv1lrrvHNT2+KakhF5qjVia2g02VETxa0kG8SGRUp57ybkcs
 qxTKlcfaX2egg+db7DpV4vedX+bWUb6xOeQzqbtEmgzDZXkKsE2a4AXPTY01z2XS
 jiwGaR1R/nxItrLY7ly3C4qTsdZE0OXqRYAa3Airpff5cie99c92A+7DoZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjps2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7489ac848f3so2673373b3a.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228214; x=1751833014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
 b=XyIYgkpz9chgszVpqpp+sjq2pkdxyc/EhXrppDpsLMalzwMPS7zJal9+azZHV+edwQ
 BwvqXcFi3U7M5/+p5ZgmEzvLMD2MQ+H+C9IXH6Y1/Cts5yIwih2GipsucteyOwYzvfL1
 1jjKZr5GfgWXPSfwCVzID32CEZpPfFaIBFUBlOvWnZvNWZFOmpiWt+tMfYc0Zy/F2UKk
 y99qOTogahP+H3WPelIihqyVajchAKESwjuFVUR7iKZdHRMOvV6Bn8DfGYlWjIWyLCBN
 yld1kWzkfVUN8sK0+mxDi/ExrTeoAA06Ouxnbxsci18mgPM+sX+Cr797H1iKqwae+Cgr
 ftcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcW+4gkJ5++Oy0VigdlgXOyVORgbgwkB2k7X4vYDxrwji0PUlF4a8e/q/p0qOD3QQx7AsWC6b/gKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1XCqL2kpCU0nKV06mukZKYILNrPsTFrCpZKUlnjVoXSx7k/3z
 inLaJkEpq5rLFX7/fND/bvm6e/EF3BAxqkfGOrFCRcxYARKEU0cfQVa+8O/mtMaEKaq3jrmBRN6
 dqf7hv+9iZEUruR+px3i+KR7VBx3Q4VsRtAbLkByUW6hbbuyeLGqFb1Rz8DfSo8v/BS9zA/o=
X-Gm-Gg: ASbGnctrk1HI0ypNPWGX6jo6YixcWlWfMjik+k28OCVPjMRwqk9odXNB/qR9Aav0Nzk
 tPXd51kxSRJUPTKTtm3ubPmASn0yOv/GRu5KR9m98e62oSSHvfm5nsC6ogHZkP7t0aV/5K4yz/Y
 jb2cogFb7vWktlY02raHvi6lEQkidiwREE+xxOVMOIY3sqjCiYYPu4obr5n9ZE2oJxtLXFsEABh
 AZoSJVImf0TnpSDiyCXRkC46nQjxQyUlWTdaphjeF03NBAgOJE8RjSmuBcxCVdzk4yLmBVlh+re
 EN30nV3SR714SbZsJv6zYwuwJpEW3JXOmw==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-74af6f4cf7cmr15911471b3a.19.1751228213694; 
 Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwS0jhkR8kO4XI31Ia1S/bTnmlQi728sKrSzukVGa/mmnt9dqDSkWMQ2dsZWOWEB2qBV+YJQ==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-74af6f4cf7cmr15911449b3a.19.1751228213309; 
 Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5579d37sm6914468b3a.81.2025.06.29.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:08 -0700
Message-ID: <20250629201530.25775-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b5wX4T5B-69aZLWuRAb1H7WWJD9hibse
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f36 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: b5wX4T5B-69aZLWuRAb1H7WWJD9hibse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXwS3X3uUgbd2W
 GAzqKKbH5AkEvzXrX8qQMsa8V9ie6xOYyVfsiMXr3UKIcQQQjwIUs0oDlEO938q2B9FuggE1BBl
 kEU7d8elj/bQhGwDw0jCJBRPBagdv6vA63NqksxO0UubUr2LfPGgwsKsbpdp9c6islcEQcnqtBg
 gpLzXLohGuHsmyB3pZauhPBsdBGoVUTny7hoD9YNuvhfRs2vumBOiQAEYloRtNZtQjF3SePI2yQ
 mEpIh+iQHKGRoO6Hqr1bzCDyn4RiNx1RxlG+8BwZOh31u0reXUjN9VTZ+gCW2xQY3nVxtZEFwYf
 r/4duFX0ztT9JMyqzhsUVe8mtW2q8iZWKqzOUhxheKFuwl3Hiq3DWELuTpLTQMOh8sytZ79FVFC
 2GAW7psiBB5S+NXXvO1xnYLaZJtBXgPlP8M3qfJILb9WiLpr0jXk1g227gK9DqzJEvhumnVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=898 adultscore=0
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

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0846f6c5169f..0a9d5ecbef7b 100644
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
@@ -281,6 +282,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->fault_info = *fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -296,9 +298,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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
2.50.0

