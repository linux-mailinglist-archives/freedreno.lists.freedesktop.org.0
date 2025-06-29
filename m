Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F541AECD3C
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8010E221;
	Sun, 29 Jun 2025 14:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvrQEOSb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FAA10E342
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:59 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T6TXH3016217
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
 4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=AvrQEOSbhfdN0xqwsF85EH/HC7k
 xLezfbooaKotPeSRtMFPQsn9IMe+mzcDe9yto3tMVk5+QHx7J7+w9ddq+n1JOege
 Rnzd5V+LUM2ZyzveJ6zDgWQKrwe01uTn7E/iN9zIVrRekDcOHMUR8MegjeBz7Eu8
 XLUzfN3qehP6pAi952Ef5rSqmjpa6UnNPPHjmkzHAP1tGJUWiqDy7KP+LW8WpvGP
 4abIDFyWCv8oUoCbE6Cj5ul+Af5BQ7yp1FFXljWtQ45H4yzYpZvMQHI92dpudn+D
 xPDQ/SMcPHweHw4+ocJTKdZdrYYKz69Ji6j9+eYtJOv0IQHPsE5JudZhYSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-748a4f5e735so1209312b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206077; x=1751810877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
 b=s2H5sQe/KT0veALRH9kZDiIbeJoSyD7jk8QUHcsZJig5ZveXA9nyACibmkrddlf3dM
 dDGFPwp8zpVST82pEwffIvaAdTaD4or3yKXjdsM7hzvyGBuwMJ8xKtacneDjJZn6igHJ
 66ePAZAHLGDcGLPqefKSHGNy7KAF683CcvwEn7+JYn6CPrO0xPGyp9bmR5fsW6meOgMs
 1ED9nZXnFUVPGeeEPlXZTYkjZlesBh4WzRwl9aNQSYqtMUajU981IBX2qCXWYqlEIIas
 +U9nzke2xZRMrvJdDIClu4aAhy8Cb+dNWX9IXq7gPWsrI6O2SJpTqedw9pVQwiTCPxiF
 IoVQ==
X-Gm-Message-State: AOJu0YwKNIwpIwReax+5Ji2n/gGhKVjFTlkoTpu7SgMXdPEu1HeSgM42
 RUUUNKgiaRxMhjl/r1GMSd31rfxnv+N2zqMNVJ9UWfQ3NtF3J0Du6KHe8/vTTb1quAeBHe/h1uH
 k+QOSQiMOoRCu4Zfxw4fSUEgIHt0brcdd+UjON0Bt7SfOh79cxAL/xzrkHH33c0Ct+X0mTIw=
X-Gm-Gg: ASbGnctphhVWp9o0jd/LhQ/711lx0GfH94LK3S9BlUKvv3/yojpeg/JrDy84KqyUrZ3
 1rESlnsQSpYyNLWDItCf0HoK3eAnwxJHh5gYBOS7Fh5lCuv+dRYw2k3UI/ehV/KDx5JsHMGT73Q
 MyXzMFMiN8V9w8SNEopAd4ZJZUTsKTURWtZ0yauKAP21UNIlLUD+8wg17BtT0yj2dQk603fqZsY
 KhdADIdqBCYPxPWL83Dq7NofZvPrcxmqveZBEFL7uviDBGawmAarvhyBJQFogryLJnzvHBGi+/v
 MLGIvIkCV7Mfjbuq9957PKi1CKHeLQ7I
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-220a12d79demr15914440637.12.1751206077501; 
 Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtgMbaSrKXdEfb5QEosJVAua6RMUWIaHI/JgTIvRcRP5uUb9uPs6eSyW6TYvQFd3rcAy5Dqg==
X-Received: by 2002:a05:6a21:6d87:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-220a12d79demr15914401637.12.1751206077089; 
 Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da944sm5864319a12.60.2025.06.29.07.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 07:03:28 -0700
Message-ID: <20250629140537.30850-26-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DVL5QpVjepmc4aDVqLwZdCuMxaHovU1S
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148be cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: DVL5QpVjepmc4aDVqLwZdCuMxaHovU1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0XHl8VA1R1lg
 9j0Y2MgFzrUTmkVXmdr50tYt6ZUjqtrc1h9k//oVOM1a2dW67nZTeVdq4eNwhtKH0mD9u1O3IyV
 yij2cUynZ+vS3Y1QN71Wd1hT3U4ADGGxBgCrExD8LQ6o3C+25nP1YpCqM3ssIGwWlodLq2FyJcY
 5tBYTphYo2fXkxDPbtb2GvlVdGsWNVgeqggtwtps5RzfByC18G9GQueqRFT94hPKxsc6HR1Q1BR
 aNWfDEb6xk7yKmbwT/rsYsC9CZDo+2FGXU/D8NAZ7yNBsdlSVSI1lHJbMbtUiNlrUqh7nUp3Yof
 QEqhjxsn/OmDjkT5fFg5YInasVpPieUlX5JLlIX/aUZ1mwjsufu93gusrwN8wYLNcu+G9wqdFaO
 uzwM/uVq9E5xTo+OHCorPkpSTv4GJ6AIkU2dydpunBWKww05TpsJdguzQfBEPXQrPL8Iqy7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=898 mlxscore=0 malwarescore=0 suspectscore=0
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

