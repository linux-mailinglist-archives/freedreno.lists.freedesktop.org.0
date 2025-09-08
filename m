Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA57B486F4
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3081C10E410;
	Mon,  8 Sep 2025 08:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWI9YHWL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996EA10E410
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888GHYq029434
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=; b=mWI9YHWLpV1tGAtZ
 o4n5P0TIcdd8Dy0MGJu9kjUPiyp+vmmhe9xD0KbnlVX6XBEPOVYuJSi6Xxl0yS7a
 yLGEO2LMl4q7K+gPB7FaNWtssafnHdWxze4fGlh6MdwbBpnRkenr9eBrmEt8l1On
 Y+EMMFP0EAWFrCdLrhC9oKXSVT3KhWIEObmSFoC/GgqtWOitn3DTnHB3ecrh6XE5
 AIVjPkg0lmbM+d7PUHhM08azLGseMMeta/KQQk6nB7M3Uf5+x0jXNHm6RGEUU5z9
 TlxWsnSgkzFyvQTKz+Jxdgs9GjC9wtJk+aVNZyKo1albDt+ktUMImG3z29AZP/Zo
 +DlvLg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc1y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724877cd7cso4775893b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320060; x=1757924860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzazIGzZ/t3zV87a3OBQ5k2i0Hby+qyQ7WI+u2m4iEY=;
 b=MCZ7qH6zPku/JUQbE3ZNv0UR7ytwPTLQzNL7YsfNoYnZTW9qbXCX/P7uOcpTn3pQma
 hzbfWZqLtBEAGwi6avQPPxJmdAWcb2xuG2zqEPf2Z1mLCqkZ8wQjy6it8ZnrtU/xxqGa
 BNBhndIeaNAknU7tXtWg5dp7zR3ECujeEgod3QpSMxeg/5HgDLaCof73NiZkYLEmBT2u
 2ahv+8xVlQiB0Oy+AsKqYvDA34iTp1S60hL9Pw+tEjvClCjLFivlS4gev0uimetC6w9W
 JV6bts+ycri7T5It0Dlr+uFREui13sxNriUH/OSxv3L+ArfDjhFvCvQcvt5dboWxpVDz
 e50w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB15hA5v283q+LHKV3AsK91BGapMuwThx6qDfnAef+A+/LvjTO7OAxLGdi50HtTS97vQmFwz5F/Z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnBKVQH9Z2KITfWt4wgumNPiASloFG/FrN8FXqAdxaX92dxb5W
 dQYdHRMkLLOhDqUCnsjSXRLINPK8sS+Q8HalL1HkDEr6uXwD6t82DghUdHZHaYsO5DM7q/ukAzc
 lUbLWKaYIajQSw53uOFZVR42PJ3YQ1vfXzL2CiJQx9DHu59NKr6ATUdLQess5IPu3HKc9tL4=
X-Gm-Gg: ASbGncupBM5w3TQ9SBV1cTHDEmUmqpLY80i232EMLNNc8Zk78/EHPLoQOVfU8DHYuq4
 oWad3VsQjQRQk4TFQSIFAasz531pBRPhifGKXa/kEcWuqko5cerYi6i2E8FJZkujWGBV0dY6Ahc
 1EoZF9iVC1IppcSDJA9S2xqSCeLeZir2jpqw5hmb5QVlvOiJ7oCwldN0t5pGEBtB0horZzV7pfb
 TbU2IGGYUPicqNj50tFmqO6+hXumgNE3ijdQGsP6/YcKYHB61y23ksYmJkffKaER6ygTv0fWsdn
 D07mokS9707q2xy+qmfeL6P5uI2qoxLOHWfVfkdv4I2oUEMvEZRg7vg0bj2awMcn
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id
 d2e1a72fcca58-7742dca7eb8mr7517544b3a.5.1757320059700; 
 Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsPuW308JspzsiBLsT9VDk94w9AdRmHL4vZNlbS733C/aU1uZfvEcmFy4pBw35K0EQ8R8XEw==
X-Received: by 2002:a05:6a00:13a0:b0:770:579a:bb84 with SMTP id
 d2e1a72fcca58-7742dca7eb8mr7517523b3a.5.1757320059121; 
 Mon, 08 Sep 2025 01:27:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:57 +0530
Subject: [PATCH v2 04/16] drm/msm/a6xx: Fix PDC sleep sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-4-631b1080bf91@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=4096;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=giC1WMM/22jbsYABWcvDAeFCcEWVS1OnTn0KmBBmmok=;
 b=Tb5Zcomn1I+DstzVX10EQ5FnDJHdOVbMDBWYloXfnfItaUHkTGKpcpE4K3t4PP6tKwRxxju3G
 JYCJ5GOSGTTCayUcml6GNRYQLBeM/t+yZ0BwdS03XPaBqow4gw9U6UI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be937d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R1CZgRJynTePKTnkIkwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: fIJJ13Qqjxg7LNQ9dmgnbDFIqDndfsBX
X-Proofpoint-ORIG-GUID: fIJJ13Qqjxg7LNQ9dmgnbDFIqDndfsBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX6wXXrtJshWXX
 kfplwHX4tGCSpHcHoRiXwK1lG6y+Y2gOYFSFeOctsKIeBOOgKrpeDS/ljlQ7Gp89ASlKfURh0UA
 gZPy34ct1d0fscb10vEZKQloTcxrk6cwlz0+FXZrSL+lnhXuke++abtL/Rp9A2+btNatUKgVTqu
 WJLMYrUZy51/uKA3TYpIYiKFO1Se71SGLog2kxNhV0gheSjm8aBIEJIN3RnmA2lF++LwFIhqDJ7
 XQfKjtF9BzcvJZN8SC4vPICN+vBOIA5LzHkUaRus8QnhqAHhcEi8bKU5OQPgN5yG5571okXir6E
 9guIaAznQiel03qFf0WL0W67/+Ga0mnMA7akx4ChfRjVQXpVFFDBAqJR8HnzO//8zncIcmD94U8
 iCsXkTL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

Since the PDC resides out of the GPU subsystem and cannot be reset in
case it enters bad state, utmost care must be taken to trigger the PDC
wake/sleep routines in the correct order.

The PDC wake sequence can be exercised only after a PDC sleep sequence.
Additionally, GMU firmware should initialize a few registers before the
KMD can trigger a PDC sleep sequence. So PDC sleep can't be done if the
GMU firmware has not initialized. Track these dependencies using a new
status variable and trigger PDC sleep/wake sequences appropriately.

Cc: stable@vger.kernel.org
Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 06870f6596a7cb045deecaff3c95fba32ee84d52..ba593ccfe3c6a2f3a2ea0db3a1435d0668ed7bf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -279,6 +279,8 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
 
+	set_bit(GMU_STATUS_FW_START, &gmu->status);
+
 	return ret;
 }
 
@@ -525,6 +527,9 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (!test_and_clear_bit(GMU_STATUS_PDC_SLEEP, &gmu->status))
+		return 0;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
@@ -552,6 +557,9 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
+		return;
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
@@ -560,6 +568,8 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 0);
+
+	set_bit(GMU_STATUS_PDC_SLEEP, &gmu->status);
 }
 
 static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
@@ -688,8 +698,6 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	/* ensure no writes happen before the uCode is fully written */
 	wmb();
 
-	a6xx_rpmh_stop(gmu);
-
 err:
 	if (!IS_ERR_OR_NULL(pdcptr))
 		iounmap(pdcptr);
@@ -849,19 +857,15 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	else
 		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
 
-	if (state == GMU_WARM_BOOT) {
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-	} else {
+	ret = a6xx_rpmh_start(gmu);
+	if (ret)
+		return ret;
+
+	if (state == GMU_COLD_BOOT) {
 		if (WARN(!adreno_gpu->fw[ADRENO_FW_GMU],
 			"GMU firmware is not loaded\n"))
 			return -ENOENT;
 
-		ret = a6xx_rpmh_start(gmu);
-		if (ret)
-			return ret;
-
 		ret = a6xx_gmu_fw_load(gmu);
 		if (ret)
 			return ret;
@@ -1046,6 +1050,8 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
+
+	a6xx_rpmh_stop(gmu);
 }
 
 static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index d1ce11131ba6746056b3314dccdc3612cf982306..069a8c9474e8beb4ebe84d1609a8d38b44314125 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -117,6 +117,12 @@ struct a6xx_gmu {
 
 	struct qmp *qmp;
 	struct a6xx_hfi_msg_bw_table *bw_table;
+
+/* To check if we can trigger sleep seq at PDC. Cleared in a6xx_rpmh_stop() */
+#define GMU_STATUS_FW_START	0
+/* To track if PDC sleep seq was done */
+#define GMU_STATUS_PDC_SLEEP	1
+	unsigned long status;
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)

-- 
2.50.1

