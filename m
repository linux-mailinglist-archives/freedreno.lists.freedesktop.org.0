Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE5B486FB
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57810E45C;
	Mon,  8 Sep 2025 08:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIRXbtpG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE6310E410
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Mxv4B032421
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjYclTunnZKXJ32H+XLcYEQN4yrHDXTjo7er5qBOfnY=; b=aIRXbtpGW4XvPsDJ
 dJ5x9qfdn5dwVNcafQpsl1yGbhxRhdvK5kUkDqyFNmFTkZ4xnJktk8dKn/7esj9w
 9SJZN3HX+rHQU+/D+VIh00addNvpMV5X3byqw6SWZkX7uaeEUZdjedLaicFcSjPo
 p24pviherZ5oP6edHc8LNx1Ns7NgloXdtvBPfNP9Qc7SIWOa/mnuRXujThTQTxTs
 29SIUYeustbSzDkqF0hQoKoZshXVPhMBAC4+YIXY54oOm1cggoEQNWrEgA/BlbGI
 9Bbb+pC1U3K/yZFmX8UAqPZsmrBA4r7cDV9EomWFRNeedAPJPyPoQxolVeACUXOq
 3v1o1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vbud0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77278d3789cso9198999b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320073; x=1757924873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjYclTunnZKXJ32H+XLcYEQN4yrHDXTjo7er5qBOfnY=;
 b=HWgrQtNJ/N3EqO1D2SD9YOBs6WM0RsoXFxsfpqHTmGcTqOjjKFEdG0R5Nv7+0RiV5R
 XpOzHPHh2QDnPIzmhWxvd7F8o58ueoszghL2xCFupjXvKAdbyg3c4CTQBAQJ0Eqs5BH/
 aax8ivGJlYnICPXXtMP5TfFC0HM8JoXnsuvPbN4O01T6AtAdYbHiWjxPiv86L3bKfM5C
 Akh3llMw5bHXBE23jyURRgCfvfnColvLJko3jk6niP/P46NgPHItdPvQVjL1a1a+c/aX
 ta3u9bwToEkZ+l2Sz320V2A6BkRbT2/XHdqfmsJYIYf2v6A0j/OloSohTbkL6d/qgF0d
 DS4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOUa+LvRCeGsr4ZSu3wc9pOZDYPkN4ccoxYKFIK21LMwCVAc4wsQ+2as379xX5N2N4iy2fe0XzIHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx90ek4y8U6wKP+D6vlypahdPorYhzgzZ/Kl3BZg5LlXwrl2H5X
 kNU6kQdnffab0qXmiWnspOziN7saP9eKIwZY8vD+4I3X8Z8qE85bHMMdFvQ6nc+PXFGanwWiKoM
 w5d+HpemYL2qhSiBQr7fWopmOTW0Z8NmbkJXt5gvo8tec5Cinp+aM+q/oe5uV4YYXmnrWVpE=
X-Gm-Gg: ASbGncsq+Xk5CYzpvhCW6QN7d3rKlNkuXwCzlp27Qsoe9dyJhBiknbaiRXtcpxubR15
 VlYqKLgornj0hnoZ+wT9CJq2JKNSeziLpo/BZAqboae7+RipgQKfJ67MHkFn2ymXSv9Fukz7l3D
 Peo/dAvILhKLrMjYKM4xQGs4T9BDrGCE8d1gFI+hY9Rtn6m0xe6aVI7dL7SxabQbDhrCbXInO04
 l/i5+VoFk0iL2bMMl3urjpgYmQj4Zf7dvAJprlbmnhxyWvtlAxC+lVeShrwRxNuDV7IozNp/DAm
 sAYmfUuJAop2udmXlMC+5YTYJU27j1tpd/FTW/GmJjInFzoFsdq3s6DZDkGBhvSi
X-Received: by 2002:a05:6a00:1789:b0:772:48c5:c758 with SMTP id
 d2e1a72fcca58-7742dde288bmr10351118b3a.8.1757320072827; 
 Mon, 08 Sep 2025 01:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoeOm+Hk8wiYTptE53Toghc/9oJAHArmq3zNncrkwsrIFJw9O6pu1iKlKXuhALo7nzpDuBvg==
X-Received: by 2002:a05:6a00:1789:b0:772:48c5:c758 with SMTP id
 d2e1a72fcca58-7742dde288bmr10351074b3a.8.1757320072269; 
 Mon, 08 Sep 2025 01:27:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:00 +0530
Subject: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=6919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gCVnHvNqEFHEXeSZVUKwjtK61YZKpfeHrmYf0fEaxvU=;
 b=6ZHRUDeA8ijXXKJL/1600PFk0POlc17dUEsZ7EHSLWucCjIqgHyYg4k91yZdJnKkXCUlbxpRG
 vkz9VG/iKKGA9n8yX/E/7sJcGMOhrRtvJz2q0/CjZcFRS1sR1PfhnRW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: pkkNQb6ocRbiB2do-a---5tpmGWEQFxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX+lhzx2hiuxau
 i5uX3hnJDidWTdOzffXo79Dh8rUchdg1OJmD4+DX4kUSbnBFhPgWhDZJ8xzaYSYppbVuAohBfJ8
 bIDf8BGiDOzEoBPV1Vgnh6zmh2uyCLJVTL0aNZpRYuKRbTlWHXr5s70SXOMRjN68ShLX+lqauEd
 PXbBcpgvmWo9/zZXD2LW6/KgADY/tL6Q9sbCwszUSa4Oi5RJ59VJy89tSLA2DXeT+ueHByz/nPu
 p75Q/i/sggX4Ssclr7Ey3H8qOJdPe1lDFJsGM2OVUMTIM38mHp8arrGNQrbFbI1SmePZmkxtkP+
 NdzORSpHyaxnjtdsUjaP8bQRWPuR8936oksfZ32ZfXnY8zynTM4zxNzxfgbZfXM3VMRLRPZtUW1
 lWj1JSSP
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be938a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YYoBuv6U7x1zitwOiNcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: pkkNQb6ocRbiB2do-a---5tpmGWEQFxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027
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

There are some special registers which are accessible even when GX power
domain is collapsed during an IFPC sleep. Accessing these registers
wakes up GPU from power collapse and allow programming these registers
without additional handshake with GMU. This patch adds support for this
special register write sequence.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
 3 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,84 @@
 
 #define GPU_PAS_ID 13
 
+static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
+{
+	/* Success if !writedropped0/1 */
+	if (!(status & mask))
+		return true;
+
+	udelay(10);
+
+	/* Try to update fenced register again */
+	gpu_write(gpu, offset, value);
+
+	/* We can't do a posted write here because the power domain could be
+	 * in collapse state. So use the heaviest barrier instead
+	 */
+	mb();
+	return false;
+}
+
+static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	gpu_write(gpu, offset, value);
+
+	/* Nothing else to be done in the case of no-GMU */
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	/* We can't do a posted write here because the power domain could be
+	 * in collapse state. So use the heaviest barrier instead
+	 */
+	mb();
+
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
+		return 0;
+
+	/* Try again for another 1ms before failing */
+	gpu_write(gpu, offset, value);
+	mb();
+
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000)) {
+		/*
+		 * The 'delay' warning is here because the pause to print this
+		 * warning will allow gpu to move to power collapse which
+		 * defeats the purpose of continuous polling for 2 ms
+		 */
+		dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
+				offset);
+		return 0;
+	}
+
+	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
+			offset);
+
+	return -ETIMEDOUT;
+}
+
+int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, u32 mask, bool is_64b)
+{
+	int ret;
+
+	ret = fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask);
+	if (ret)
+		return ret;
+
+	if (!is_64b)
+		return 0;
+
+	ret = fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), mask);
+
+	return ret;
+}
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -86,7 +164,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Update HW if this is the current ring and we are not in preempt*/
 	if (!a6xx_in_preempt(a6xx_gpu)) {
 		if (a6xx_gpu->cur_ring == ring)
-			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+			a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 		else
 			ring->restore_wptr = true;
 	} else {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6e71f617fc3d0d564e51650dfed63a18f31042ac..e736c59d566b3fcf8c62a212494e3b110c09caa9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -295,5 +295,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
+int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 6a12a35dabff1e64aae8440c2a8c88f5feb4803e..10625ffbc4cfc26edc36efcf11dbb4efd55ab3e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *gpu,
 }
 
 /* Write the most recent wptr for the given ring into the hardware */
-static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
 {
 	unsigned long flags;
 	uint32_t wptr;
@@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (ring->restore_wptr) {
 		wptr = get_wptr(ring);
 
-		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 
 		ring->restore_wptr = false;
 	}
@@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
 
-	update_wptr(gpu, a6xx_gpu->cur_ring);
+	update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
@@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	if (!ring || (a6xx_gpu->cur_ring == ring)) {
 		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
-		update_wptr(gpu, a6xx_gpu->cur_ring);
+		update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
 		return;
@@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-	gpu_write64(gpu,
-		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
-		a6xx_gpu->preempt_smmu_iova[ring->id]);
+	a6xx_fenced_write(a6xx_gpu,
+		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
+		BIT(1), true);
 
-	gpu_write64(gpu,
+	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
-		a6xx_gpu->preempt_iova[ring->id]);
+		a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
 
 	a6xx_gpu->next_ring = ring;
 
@@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
 
 	/* Trigger the preemption */
-	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
+	a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl, BIT(1), false);
 }
 
 static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,

-- 
2.50.1

