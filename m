Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2936B486FD
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDE910E469;
	Mon,  8 Sep 2025 08:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iX3t+CH3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5640D10E41E
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880P1Km001510
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7S/gh1bczo3bWqSmVPBhR4GIaagB0w6uTNlcN/zUrto=; b=iX3t+CH30bsAcldE
 TcZmu7UIZKINgPzcGdV/H07bTHImQbuX2wKBAA2v6+Siu4wGk7aK8p82r8zbKOPQ
 AlfLIw34/7Zt/Y01LJd9WTGwEV3PNbzL0j5L3s1rHPRl+tO08EGeWI9/8mPjQQE3
 692jN4xXziXPvAjkqMhIbZSr55xlQtvLCTATdHQRKpBerPZxYyb4Ep/BjZL2wd8p
 sr1FTUGfuS3Z+AS3+7rSd8OOG4FIIwLUdPHbxXkzKRjHNskoUR8VYvHIn+ioyKiT
 9Unpv7Q2YT++okC7Z95gElY7rQ57h/oId68NvNOjME0buQuV9Zpj7od0pL2OEUQe
 tRNsyQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uw4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47630f9aa7so3361386a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320077; x=1757924877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7S/gh1bczo3bWqSmVPBhR4GIaagB0w6uTNlcN/zUrto=;
 b=N16u3HBP9FoJMFKtA0vYUh/1TLGCqnuH7CrTHLi5VRxkMvRN1pH3biL2pdkKENxsHA
 IIpvf6pSoHxreeI4b8sgr09lWH8fCvZxczS1udVCrbbiVnMrJeqVf72Nj2A5HR9cOAZ6
 xAfdBpjMW6ZykzFWy+DtiS3PYkys17ORx7KXpNm3lGayUikIe5iInF/HI8cyRG8EOJqw
 Br46cKkbCcyAb3lepzE1ybrSoVAfHW0PG/2e8afmY4LyYKYrIRa+u9sEiu0g+/nGdb4x
 BWFr3bgBGYI5nCbvirNHs2Kz6vx7119bsDWaWYnldTnZq2OXPbUKElJhhVrNH1pbaAtL
 zrPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU7zZvwXPxAfn2kJ1IvUlfGWqxDET9vKVnodw3Ho+dhWxusjD9V8WGasJbIr3ZNPYi3bOQDH/tHbE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKgPEN/wPSywUg7cdq4ZMDY0uVI+3uGeadRLgcwkHNwCjKslxU
 zmD2anoPm9SghgsDoFgUXPkQ6oOQEiHmeu8KVzCgPV2m+KeSWooIQp8jvivHQ0UOuypNEhCFwpR
 fYKaz4iPCb0AvrHVEDMqUYETscJsTPjdPSTi36aAs44jrUtZdudO49mRWlfFr/Z75pweHkrM=
X-Gm-Gg: ASbGncvTQLGi+qBiULf+CvGlgzxQK35D0GJktF3dfTawvEFk87t7sKoaoggL4Cyn61E
 4v4wOfayBXoEt5I99HtdrHoVc3LoAUi3QVmZEmB5WEZ6Dxu7REsVZMgzmp/B73mcSfLGlFdOcIO
 2x4+QbykyzNArQtN3I81sdv7Jf8w4+HIcG0ZV+2PSQPsYQdbnnRmBfOs0AcmFEQb14XHYSxF2BC
 YjmYq799nQ3UpKF84DMVI25V7QPTdGMQDc3zbBj6WXj7j76VP0vKUy7nMs+zxgeUjbH+7yPpAMy
 7NRqXK0zJJ+8MgMMQZxOuLBC3gK83ctZvLTYg0hCXPPmWuF+RgOx6Q3QIkDcMD/y
X-Received: by 2002:a05:6a20:748a:b0:243:b190:d132 with SMTP id
 adf61e73a8af0-253444159eemr11053969637.59.1757320077057; 
 Mon, 08 Sep 2025 01:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZlFnS+EY2NJveViSCLM4wHil2v4/UFqOr6ytHlfYM/kiyIpu9c26cPUorjQ/8HOTDxcG2ag==
X-Received: by 2002:a05:6a20:748a:b0:243:b190:d132 with SMTP id
 adf61e73a8af0-253444159eemr11053946637.59.1757320076598; 
 Mon, 08 Sep 2025 01:27:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:01 +0530
Subject: [PATCH v2 08/16] drm/msm/a6xx: Set Keep-alive votes to block IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-8-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4220;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IMBo6N4wzsS8MDmukZdsfvnrZM7EWF31g5XLtxm04N4=;
 b=+VgSWY81nQLwZQD5J4hnvjnTyQ0hi5MRgtxHYndfiyxkmyBM47dDIsffcPx/aUo5/5YNVE8jL
 e0kAaPyzkRwBxp02eDBLkp+Ho+QDDfw6mTSvxLz87SMovajI8VRQ3LR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be938e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nUj6x6g8p96gposalbYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: QArQsb-3FrKlj-kiHL-UfZE6FoVHeC6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX2HjWmTTaYTr0
 5BKmA6Cv/8HzF79eK6e06J5DyewR/ylN0wdWm2ZGWjCqXlekJhqQWj5icP84lVKtNqv1jhjf4tk
 rn807uYxWNI1eXvXyreoieijFRIsNt7q8QdAqox6mvNX7OvMd6+K/Ly3Al6p9yJcNnu0MfktSct
 kQ1G4CxlycwKa6PVnLYNKKzMsrkLhzn+R2C7nnsVofOUE5h/nx+cM1JzuWqh2a2HF3boxkUgvIQ
 ypGcGZjqmX/ml+q8CDW4L+5eUJuVCzqJAronzLzFWVczjS87xf97DHnNvIZVRaT7PKTSc80wWp/
 Kfo6NcWHI8Qk9X6MXkRqxnzTx7W0feuzzlnd1EXliQwLNqr+La5yfWKDG4hWCjAJwES4NLQQRBU
 J6xOsXQW
X-Proofpoint-ORIG-GUID: QArQsb-3FrKlj-kiHL-UfZE6FoVHeC6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

Set Keepalive votes at appropriate places to block IFPC power collapse
until we access all the required registers. This is required during gpu
IRQ handling and also during preemption.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a63dad80ef461da45d5c41a042ed4f19d8282ef5..33a26bbd245ff49784bf1219a584936b4caa62b6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1771,8 +1771,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
 
 static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	/*
@@ -1784,13 +1782,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
 		return;
 
-	/*
-	 * Force the GPU to stay on until after we finish
-	 * collecting information
-	 */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
-
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
 		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
@@ -1829,9 +1820,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	}
 }
 
+static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+
+	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
+	a6xx_gpu_keepalive_vote(gpu, true);
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1868,6 +1874,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+	a6xx_gpu_keepalive_vote(gpu, false);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 10625ffbc4cfc26edc36efcf11dbb4efd55ab3e0..2ce073d1cf8cfd7c774918851de03d6e367e5625 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
 	a6xx_gpu->postamble_enabled = false;
 }
 
+/*
+ * Set preemption keepalive vote. Please note that this vote is different from the one used in
+ * a6xx_irq()
+ */
+static void a6xx_preempt_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
+}
+
 void a6xx_preempt_irq(struct msm_gpu *gpu)
 {
 	uint32_t status;
@@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	a6xx_preempt_keepalive_vote(gpu, false);
+
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 
 	/*
@@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
+	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
+	a6xx_preempt_keepalive_vote(gpu, true);
+
 	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
 		BIT(1), true);

-- 
2.50.1

