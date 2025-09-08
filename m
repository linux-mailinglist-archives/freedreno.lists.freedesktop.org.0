Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB9B48710
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A497410E491;
	Mon,  8 Sep 2025 08:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhlPoUiC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC3910E48F
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lu3Am023900
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=; b=hhlPoUiCNfS27+hK
 W8kcydaEFIN7wbBcbZDohWadLDBGzBG+XqIIPwt7/lOJvl3HWf1IagYDkhdPuhkS
 l5W/q4Plc2J3JswDd5LIqGGniohUIqu0o5AAmF2zjSU73/vNvqhbalP43AJL3NND
 dMhU46/Pix6wWIY5xa7dvJUb3ZgHv6nbketj6G0VpA6Kh6mL0uqnaBGthAYw09Uj
 //jZJ/LZEeK9kFpl8c9dDrwZDKzsisiZ3pUYGvL84o/qatAhekCZcv1YmuS/xnlp
 CjT6VK//11XDQ24/OaGnZY/Ot/KihuSiibB0cFdnyFZFpCSRZdJPj9Qx8zIiJKPD
 CSQqpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a3q69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24458274406so86302325ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320112; x=1757924912;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxxwm+ypezCwm6BPpi+u2vyfh4HZ0FHZ1ZRXEui1g10=;
 b=gHIUX4FwuQEggZFNXzfEPZEnqGtvzx3iEyBdph2oAHhwqbfNWBF3Z3VAx8rlPPXthG
 oeaUfBFRIxW59ixbvs3PbiO2WIZaMRdOUE6muXl9oaonf0VE11SoNo3W7EswtuXYFfww
 mofMkiHyquN4sY4nqSWZKm1jGdKLUgPx5igEV71ZL/NoXKGDmozl2VwnQB3sVdTLUlxi
 W8btuH3Y7Q9E1ezB/t/gl6UeFqQkjMq4SzOXPmnpNe/B/Ab0gPSgu6F4n7KZ9h+8d0NP
 ijbrPhUd6Dc44WlxllmLqh+/RfEDbtDIME1sQP/hRMszXgESPnt706HtyArU3nX49NuE
 wKVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5NP+lkLJGivhqsIqm5uMPxLE91HUDTCVYF/Wvn8iVAJY2Rg2HSMvfvlaX6CaHVOQ9X/AWorqzgzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfteDnZ+E2MTONO7Awc2j05Gp5NBg2M5DN5FbPGNojJS5P7W72
 Y7KauxRRTNxlXsSKntv0cRw0PMXKshQ6COKbeozPfpU4KmW4207i128fTSDqygTWVXe/OwERjp8
 58Fd5rkT1HvkG39UNcR0pbkXfNpuW1NZnMAklygRruAczQByoreaOWr/viMnAIxSXkWXNqnw=
X-Gm-Gg: ASbGncsbpTTxrhBfHF77Mjp8Yosgrt40PQaE99J5NUlVVV+ZtHtA7CJU65zeTulg8oy
 ROFw0EbzUDSURP3IUvi6GUKLDbRaT689v2urRuUvp+HFCcTEEzgcoail/VS+QU5z+CV5jg/GrzY
 5FhyRaOpEcQUDeMTbGOsPYtj3wWTRwPMaqI5xD2qm5e/TKZ5L0TOFebgppsUUTrbVl19Ya8BsAX
 U6zhd3ysh9b7ss0bUkNguOmLN4V35imbOO8Wi3uQT9gPh2RQVBGZAbPKhZ/+t/vep+BjkW5fWUx
 AyhRd4L/108j738CcRLDmLEN88z7cRcETa8uT+6QBE4DVQgSHIS29iZyp6jPwdV7
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id
 98e67ed59e1d1-32d43fc847bmr8554020a91.34.1757320111812; 
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZA7JoDEnmt7AqwJdt4pyUQnNwI2XcSGTu2xDVrasXY1aPxGl9PN4uLyeJFuDudO5O+4Dzlw==
X-Received: by 2002:a17:90b:1c12:b0:32b:dfdb:b276 with SMTP id
 98e67ed59e1d1-32d43fc847bmr8553992a91.34.1757320111383; 
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:31 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:09 +0530
Subject: [PATCH v2 16/16] drm/msm/a6xx: Enable IFPC on A750 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-16-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=978;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=8YnJ0ONhzBIexy/neyt6NTzPrJg4+1Ll8SHaMIGWprI=;
 b=/l1IvAErG5vS1H8AZRE6E1eJuAQqOfkFg2PgpjJbxAG0YmEzCJLWURhkAddQLIvu89grMp8AN
 7tnV9+P5wEOD63JzvVh74oiN3+mutYEfztOYd3dDeQff4WWaZUvRxaO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be93b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cz-sm3QmoJLqeNSv7C4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CyNgO0WMTMEkrbct2GfCzE8TN6VvDQ9-
X-Proofpoint-ORIG-GUID: CyNgO0WMTMEkrbct2GfCzE8TN6VvDQ9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX/rU9fR3sYYBy
 OrrVo5KY9yVrQcqGwyU0j2X8ccRCV2z/ck0JTVDTz+vEqoXcKUN3E1ivPvaPpFfLF048wzh8+85
 5Q4yC7KZ9Z913YXAMNvODDAVQ/iD/ujjDtYf5Qx6jvI3NAIi8IMsEnVAuC6Y3fXBTf8hHNQRHOt
 siVdCng4bCeRwmYuyZ8akheedTMir70m2Tf+NN8GTLOcqFKEzqzugYryNUgo1bbYzDlBqA5n83T
 jYoZCorZZG/O4f+JfY8YRiZ20Hrd/6YkHBENbYfOgic8T7DkqiHKUiIrK4NFlertFToIgexlo1m
 kdTHYzz4Rn7gcB1Y2lLX15/rRDVnAUhCtein1Wb/d5vNjKhBHq6DwdG20zecMU4ALB+sL5f1Az0
 WF59mfbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

A750 GPU has similar IFPC related configurations like X1-85. Add
the IFPC QUIRK to enable IFPC feature.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 547c046730a9b50a82cc9b27f08a5b1eeb08dced..6008f8b0144456c5652dab4c6393b3abb7d709c9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1525,7 +1525,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_IFPC,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.50.1

