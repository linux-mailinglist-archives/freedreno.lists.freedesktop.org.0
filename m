Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4343AE8D6A
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733410E7DB;
	Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5Xb9PZA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38E10E7E0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC2s4Q032648
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
 YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=Y5Xb9PZA5V9SfHTSNZrW2S229Ep
 tf/237o+5A7MKzfVbAdzgxyVjbOHkY1SgpLzhUoHQ9SDemhASlhCZWJ45CX8MtXJ
 qxqF2J0nNrZFlQYFYXVelNk7T4IwmIF1k0RexZk/viAIU4Fsc/Rg48UHw7Ark/AO
 oNywZl1jaIXwov679cvJWjQnJ2WhOD6SvrEYl13wbj+e49gMxSfLU6HS3T7xBx9b
 z23pPwTxjylsKz0DqezgrusMW9OlI0TzHz6LTUowPhNoQbWjI8LQhauB9pNBd/N1
 LRPc+PBaHJByLxz2bvfWRHLl8sdC6EhR/mCTbtvmo1zAY0lyh4JxriZZDiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b68b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748fd21468cso184810b3a.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877940; x=1751482740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
 b=wEL9BWSlX6bzAAKU0c1bCc9BXg1dw3yiv39oBz9/EqlXWIspe7ZdEk2ULRxr6L/fUi
 TgZAuGH8RHr2kUgj0rYKM6JwmO4DsnQ8J1LQdMiwVof4Pij6M9ACO7oUji4zkUalLAgK
 daYw0d/nN0XMiprsK43jCw8/hIq0c4OSoJFR/eIv3TA8+0lDTRsOUFOpF/ioqtHwx4pe
 MgyiwFEumYUcQoTUISfemOlMRPosZ1vvpXnPEEw2gJ1ARexZAJbf5K5iszolVDKw2CmY
 Kht+rmgUaibnZ1w/Cs7qv7ZVGgLD5hbou7e8XUYhI3dWRodm1f8N7W5eakp63WBm7osd
 xdNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYrI5eht+loOfrCA1mj1z/F3ROP6dXAH1EX8FzqkR7fLpimWQ5dbMrsgfOhbrU74VmNzUyY56pYvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsV5RjDLuBkBnh1q34rbTQobNE7JMzVaksCziHAsEAYv+39u86
 jszk8PZYK4Z3nYWa3Mt8JqEUAKEUyB29yGuD3qUnuTIxWPFWEY3NhookZDkShIGUHX3eFmY7KEc
 +XakrOqG6pyN7+XyPpBFRJYJIzIS2OPyWJuka1BYvTauy6lRo1eVnasZs3TaNb/n8qAdNvnc=
X-Gm-Gg: ASbGncuh1BHj+fMlApcTWXy9PqCCgoUNLTCVIxBCU5cTDncM1twO2nRJ+1kdKR25R+6
 0pQrh/e5bPu1W3cbnMPg0b2kdfhuSt/NjEBcw2qQj5YF2sQWANaxkIJ7vKvPgh/Ofa4v83Xqh+l
 tOeHWA77j8jA3+A0hbSuWMZu6g35P2OO0/otPnno2OhYS8xo6hbZYjUUU28SvotRLu5vtc4r1Bs
 BPHmuSQJdLt9u6J1YI9RBOQrdEwhXM9w+YwlwiOe32LQHd3DJTqmstqzw+7IJ/0oM79miPYzBEZ
 AIWarMBN3z7ul5Uv/zlFYAkh7NKuvh0g
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id
 adf61e73a8af0-2208c5b6de0mr1386078637.20.1750877940365; 
 Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjs/J0QvS0VnPAD9ghs0ZXCa9bknqb6IuT0ol4Vr7UUmIFGa/LYVfwR/mtK9s9csP9ptJgQ==
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id
 adf61e73a8af0-2208c5b6de0mr1386057637.20.1750877939992; 
 Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f118ea18sm13411229a12.2.2025.06.25.11.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:18 -0700
Message-ID: <20250625184918.124608-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX47/DD67nXdeg
 mHpv3s5bbHngbllQ23z4SYUQ9/Ql36qZjB4PJnjBU9KePdLZ2pJ2p1bGY+weJg67LIXH3yhNLhf
 +40zKGXME6veS/G+6B+SVwk3oct0lxut9Q4gXm4CzwO0C/LQWBLgE3g1Ii0Mzrdy1utij5/x3nr
 CfL1lDgnUPfGjmoF4W2hinS0dd9PyZ1+bLaj+Q6Ee0wYBXyKF0aewx6yvhQOX1TJ9mlbvJsmwEp
 rJDnNTG4UL+OduNjBFub3xVAD+jardSb2LS40WUmWeluL6vG+UCrKxK89kqpGd1CIkfFJ7wTTJG
 5QjIvj4EgWQ0ZQ5N8hUkgcakp2UIKxnsMd5ySyU6HdyMXg0EbYFbC4SfQQ1p7jyj4vyE+UlbVvG
 8A5/tuX1C7AC4w3lqNsTJiuwZlEhdo4JIHIEnoq12fex1g279JsgYctDcWxAeL5smenrKlGv
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c46f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Anals70b0m97Ci7sU0BtTKERid2VKSPI
X-Proofpoint-ORIG-GUID: Anals70b0m97Ci7sU0BtTKERid2VKSPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=897 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

