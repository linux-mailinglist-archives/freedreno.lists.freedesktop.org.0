Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873B5B0B5E7
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2220B10E373;
	Sun, 20 Jul 2025 12:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+UdZTmG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D4110E36F
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K2T9Th017106
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZtnI8bcnbJXKJYAmBx3Wywp2wMJJNt4wjH+SLXdqKvI=; b=I+UdZTmG7AIsch+N
 R/lAxZjJeZZvblxgTIpthuHtV3ZsFJFaEnRL1YtNqstC+YesU2PmLf1NzN9dEAMD
 YBdPfgVxqRxaxGtTH4xYXvxsPcmPQvEkp7h0JgUen4ZduE+llJRjTSOUnSC+pImp
 TEaiNiFYLMw55S6yVTGG4LXp4K1rx02vc1bryYryUpjvYQJr7wat24V4vkFvq1FS
 Mj75mY2z6OScDGxbBmC27prhCKWMJN5i8E+qN3jtYQUyiRpPYG1AjctAIf0LZlW2
 YCrhI4X/HcZCBezbJyjQXqWbqLHUpHAeMeeSPPMu230kh985taihug1oCb2Uvdlh
 c3ODYg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q26t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74b29ee4f8bso3202265b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013851; x=1753618651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtnI8bcnbJXKJYAmBx3Wywp2wMJJNt4wjH+SLXdqKvI=;
 b=NRqg5z3CmJrBxBc+U7P3khze4qPlCMDCzyjhd3YNUJSIGjnyydN7PSA4RmzPLZUDRe
 12IEYy+HBP8GdDFj5Rz/7yQfMHR/b3Qtl8ZiBGD+6/HYJceWYMSYqC62d6OViBn9KXSQ
 STdcTxWObho73U5OoZIGDLAHMp8mTMiKwpFVizIWUo6bZvL17FAjHhr2cgH2wMetfyBH
 CHcEeuVGxln/eiqKpc35UiyysvNjiSd3wegLe6KQKeGYn8VPeabmFUa2U+ljGBB5kSvy
 zs4BgA8x0ZVQMdNEpaa91inpn1u2OABDQE6o2uu5fgsGY7FO2r++j/fkQmD3+aa4gTI4
 9DUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDPWzAY6eSfHSmWJ4axGzv9J30XtNxyPECk8INnSGoqHuwl6FYbOc5ElAKakFi5/Y4fkYeJpNtEZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyikUGYhr8wbig2VQuBTG4f2tSnxKv94KQ4wtXd4PHZpKV+yW6f
 vpVCP1itYUcj9XeHjwcWcr2X5yGgal45NkfDs/32Gk1USZxSDFawfnGYSo2GBTWZeIJlSQniNej
 GOAKXBTlvJ0sxNGBp9KmPN5RpW7KMPAgwabiT/NMQl8oieh8h3Bjh8CAOI+7IPi2IWc/7ozU=
X-Gm-Gg: ASbGncv3KK8ECsJNM3/aGnWVXum274FlbsaNr89CyA8uHGQ2buXYMkrpjbob3KgO8WW
 Fp4TaCZGkBhOtJggr231YvH2LYBKMvyZagcXXnzbAQRtTZE3mn27CWIS8OG19HNVJAtebTw8+/9
 wsYXj9AuwfZa28Qxd4m24g2wbyjLumlpNZyb/A26cD0V5fMHhlLTvbX5FatUKEPCEDcoKiqppLm
 /v4y64plcZwnrGKOiNrJrsPaaJ8EQDrmyTCUYOizheHAHIVPfANMYT5nLTOlDnOKe3V5M3mSSYl
 vC7+KQnbk4u+01RgpgPyriBlInIZY9pwINHQk7v17C5epYN0ESS25EqOF70WgNVP
X-Received: by 2002:a05:6a21:2d4c:b0:234:8b24:1088 with SMTP id
 adf61e73a8af0-23811d5b78fmr24683987637.3.1753013850887; 
 Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx30tjF6gwYV7rkqRpaVYmG5lbPA8fIxGKqVeIgZ+j/bE8yXx0Xojg3IZCKQ0lFLGMlIHAiA==
X-Received: by 2002:a05:6a21:2d4c:b0:234:8b24:1088 with SMTP id
 adf61e73a8af0-23811d5b78fmr24683956637.3.1753013850453; 
 Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:11 +0530
Subject: [PATCH 10/17] drm/msm/a6xx: Poll AHB fence status in GPU IRQ handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=3057;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=92w4ozCPNKwCPL77+wX422Eit7Q9t+OWWUxkAhscsWA=;
 b=GQNmGNlfhWDoudZenUlVQZEBDuln8mN+w2UiZ/6l95GobP3bnS2kxBzqeshY1HiueMRoDaGUT
 O+P2jLcMz4IDaEzPlxZEMhTZVCvN2h2PpyhVOzrCbV3vbmH3lao0Xb0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfXzAL65tEZfjYT
 5pyBQ1Zmo20Nd8t/lSgpzFh6vsMYYtKNwsOnlNhWYSYFvVkLXyqDLqxt7JGrJkNWX9k4XsvmFu7
 abY5XBuaiso2dTDaZpcesOyOdZqvoVAMMAY7xM8KHoPoP4j3E1nyNC9Jgtbgst57lM6mWgGArZZ
 aq8bZaSVP2cb4uMTM3V1o9a8FWkQu7ArBD1LPFYKW88rD3zJm426jHi/cNujXs+BX3o4ROG1UKf
 nA0ttD6AvGzkhJ6Hcfk6NblPrte3mGaMkg623YLh7Gu0wjeEfybEnNUNT+rVbADCKMhfTff0ZoA
 jmRAVlEh6Z0hdDs/SY+KvFJi+ajwQkL9R8PKAEKEDWd/TD/pZEIMkdZFtCo6BSPnC0Z3UlXrBM2
 Gp2xmvnAuTJxLHFUxPzB1InapcZvheIcyp2yiRU+HOoS1I8Onzrd8uh5onI4qZ/UrzQCrg9y
X-Proofpoint-ORIG-GUID: 9gSyw7qyfUPIqIVwHA_oMlGg8lj9xnKB
X-Proofpoint-GUID: 9gSyw7qyfUPIqIVwHA_oMlGg8lj9xnKB
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687cde62 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TOkoRBElmyVxNVlyPtAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=638 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118
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

Even though GX power domain is kept ON when there is a pending GPU
interrupt, there is a small window of potential race with GMU where it
may move the AHB fence to 'Drop' mode. Close this race window by polling
for AHB fence to ensure that it is in 'Allow' mode.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7..62c98b198551f26b99bd6e094f8fa35e16ec550d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -164,6 +164,9 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 #define gmu_poll_timeout(gmu, addr, val, cond, interval, timeout) \
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
+#define gmu_poll_timeout_atomic(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout_atomic((gmu)->mmio + ((addr) << 2), val, cond, \
+		interval, timeout)
 
 static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f000915a4c2698a85b45bd3c92e590f14999d10d..e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1823,6 +1823,28 @@ static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
 }
 
+static int irq_poll_fence(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	if (gmu_poll_timeout_atomic(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, status, !status, 1, 100)) {
+		u32 rbbm_unmasked = gmu_read(gmu, REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS);
+
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"irq fence poll timeout, fence_ctrl=0x%x, unmasked_status=0x%x\n",
+				status, rbbm_unmasked);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -1830,6 +1852,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
 	set_keepalive_vote(gpu, true);
 
+	if (irq_poll_fence(gpu))
+		goto done;
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1866,6 +1891,7 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+done:
 	set_keepalive_vote(gpu, false);
 
 	return IRQ_HANDLED;

-- 
2.50.1

