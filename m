Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AEB486F6
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1E10E45C;
	Mon,  8 Sep 2025 08:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7fO4S1h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D910E3F4
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587M033g030096
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CJb7ofyHe4b7qn3VxGuLfEoQ37LPPZSsF0k+bZB0okM=; b=g7fO4S1hBkoOAA61
 u/VNyRsQ+q3qPIKQ9YGMPgfYs3KC98+PnA/MEvt51RYedctiZFW7k8Ntpa4C2Apd
 1IL5iRt4CJOlWuIjVNcFT8piCobIMtAp2eNY7AwGcOSQeUezdzoiuPgmOy9UAOVE
 aEB9hnJs75pOeTVKIy1FpHxDomzio9DKxDd1v7AZM7Ko/ymnWaRP66eS/2+KaAYY
 TqwLZrUOyCojwrJZFxXRahVE828sHB6//I5Az8tWGnB7/VPqAMEuf2HCHAGoqn0S
 tZ/OCaC3xJ8nf42lxlIZno9+aDGL1gqQCiDK2NExPdw9WToxL29AwYIo5ZuGHQ+x
 mxWJBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kuqhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77243618babso4098012b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320064; x=1757924864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJb7ofyHe4b7qn3VxGuLfEoQ37LPPZSsF0k+bZB0okM=;
 b=jUUku7hjy3+XUlbo3gCZhXFAZ5OjFs4sAVoQxqbD/fvh0m0hVFzQ5qqoiOffMaD6+4
 Qe5g9XrtJOL9OlnIZGE9S3TK6l14qsOVsXI8qVjsI6QQeJqf2q8Q7HLdopLOYloDeMlL
 F1WbF9amvgSvXtBlLYSzKmyEzqtujDp6MyH7pPBgGGQFXxPejrnuIg2zHd6Wfm+F2wpu
 +/zjkQWqUMKRvyfOoenMqcbxZkFP6UAlDfTxj8j11PhrxOhVB1EDDy7ObUWDdoct0ogF
 fdnip9WKIoXCQylmAhDWiWh6CJLGO7QhODFG6CKkR6H+jui3Yjw649P4Oi+uCQ6LQhvA
 WF5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZMwDkds65Y6jNGOmc6DYUBi5bMRLFwvfTPtWTJEB6XmU6oVQor3IP60R6ehUEc8XRL+u0BCTmrLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSu3sNtgEk43ri2zXgA3ht2y+N3zhW6f6U2eu5wPitRjDNlyRj
 ZHSsG1YriQTGINfcxB8jCRrG232Bhpu23IUf31il4hiVd8cZA2Jr18+OxbZU8bMq22u5VKOe3ZR
 lDGhNMfPzmEwazZL4Iy73aHJywCvOlyrbcxjyqKP66BFiP9v/T7SLmM8NtaurYa3ynKz9VqI=
X-Gm-Gg: ASbGncuc/Uwiw8DW0JQc8gazvCAj0LjR3HUL0XMsbv0FSc5oKENygYM+gP2aVaLUock
 LLXPRln7Z7dLEOd73eNAcFpBNhM+5vwxGTR9y1NXEeTM0mSM4pk4cIw+Mj+v4jl31hS19+eSCdh
 LuTuzuyXs3XXT3BjIeiG+rQiD+BqXQI8wiTNehhp7Mq7RSRJ4xWLze9/K7fUW887yvOxQJktZ3Z
 yDvkFO5QanTzUS+kaIPTW/itQEllTOxp2mrw+TjHlLLpOcRrSRDLYMtvkVphIAEBG+Lfu04Evng
 PXOjiou4aPj3/7KL8WqfOXOCCsVyWPuSKql24Wj0+9MQGj+TXOSKKvhbmiiXeEeH
X-Received: by 2002:a05:6a00:3d48:b0:772:3ea3:3218 with SMTP id
 d2e1a72fcca58-7742de3a755mr9297809b3a.23.1757320064003; 
 Mon, 08 Sep 2025 01:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8rtHApLprXs89baTrw5Y+tS4lxiZmePj06K6HadPj3deSzqDHtXN7z5VuOueh7Ev+7QbiFw==
X-Received: by 2002:a05:6a00:3d48:b0:772:3ea3:3218 with SMTP id
 d2e1a72fcca58-7742de3a755mr9297781b3a.23.1757320063559; 
 Mon, 08 Sep 2025 01:27:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:58 +0530
Subject: [PATCH v2 05/16] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2096;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eXZ2rYau8RPQwm/75uAgTgpHfByWoOV2COXky3jbRmY=;
 b=8HEhpCUzuc7S9PJ7OQWqGbaucUWSpnfKaq9mOpMAJZ+dBfBnPhV4cF5kih6qpWasIOrwuw529
 VCWQyPoBSz2B0HDuxtCDQME4mh+8rpe3QODxD5ntDtT0ROeO3BBTMUJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX520KGj0Ov90C
 nyaEWM6Zvn2XMcHD4uwzv1oNWcew9exDoakfjTLs/7Vu/oeIfWiKUptgoGS6sZQLwF28okLS6M1
 JQlReKsPZ4nxAU9ms3oLXLxNvgPossTdePLnw5dokCVuJQzBr6NOw82glFuelsKvgHbm/4QDuxs
 kPfKjFpmvQxUxkjhVbZBs8RnplRRN4VzLbF8K0voA4ecP8ZdCqxgGB5pdfIJYACFx4q4AhJdnLg
 zm1Qm4SUEYT78uDHjbRX/d94EjT2VtA+xepWqmiHjoGxkG6HIyHPr3WQB7K1JLcm+5br8SS53Lb
 CdtEJ4SB+Tv3L4fYFNjBZjUsVXeEj5oDODPWoT1gvF6PNWedmyoq+z6nptLNglviyTUZfvm9yZ6
 lOvq+OmM
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be9380 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B0W9oA28b3er_avpQGoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Mh49V6qidQuKejSdDMKMH_Ez_c-Aswbk
X-Proofpoint-ORIG-GUID: Mh49V6qidQuKejSdDMKMH_Ez_c-Aswbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

A minor refactor to combine the subroutines for legacy a6xx GMUs under
a single check. This helps to avoid an unnecessary check and return
early from the subroutine for majority of a6xx gpus.

Also, document an intermediate unknown low power state which is not
exposed by the GMU firmware.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ba593ccfe3c6a2f3a2ea0db3a1435d0668ed7bf2..18f5fc2c28e33d81ccc248216cc018300c81eb77 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -412,7 +412,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (!gmu->legacy)
+	WARN_ON(!gmu->legacy);
+
+	/* Nothing to do if GMU does the power management */
+	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
 		return 0;
 
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
@@ -936,10 +939,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		ret = a6xx_gmu_gfx_rail_on(gmu);
 		if (ret)
 			return ret;
-	}
 
-	/* Enable SPTP_PC if the CPU is responsible for it */
-	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
 		ret = a6xx_sptprac_enable(gmu);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 069a8c9474e8beb4ebe84d1609a8d38b44314125..9494bbed9a1ff86b19acec139d7ab27697d7ec8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -50,6 +50,9 @@ struct a6xx_bcm {
 /* The GMU does not do any idle state management */
 #define GMU_IDLE_STATE_ACTIVE 0
 
+/* Unknown power state. Not exposed by the firmware. For documentation purpose only */
+#define GMU_IDLE_STATE_RESERVED 1
+
 /* The GMU manages SPTP power collapse */
 #define GMU_IDLE_STATE_SPTP 2
 

-- 
2.50.1

