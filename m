Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D798B486EC
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F410E410;
	Mon,  8 Sep 2025 08:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DL/KVD5S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD1A10E410
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886gQes006157
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=DL/KVD5SICPxQjay
 eFeelu87pJEtE6WyPpe/TbrQuhFmqAbxXEanWRa/HYkLRTbZY7bI0FXBkaVzQdIE
 XPtj0wNfimWN/yIk+vkgzff6kxC5Q2xAjGeY3SYxZzOodUwVAwhXSkVelgDuvbQ3
 UhV3NAlaukznrCuXfrc5FQ5GUFVW9h2EU6MAC0Wpl+rQI6wcPOb1nAghI/hmaUpS
 qeHVDlYITnLeChBHx3g30JBfcuAsa1o3z5mORSAhs/h+kz+hcuVUOFgIsdNudpHb
 /opQeMcoZhQ39scN412unwnlClsCTwR9L/vToA1RvX+TJ/4DY9R4tMPiPKgHh68v
 WFRR0Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r9sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77288e1ce43so4215433b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320046; x=1757924846;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
 b=rjEb9qRKsCEt0CtMIfVd0HgpAihOWBK/p5/bfvlp7Y/brTFu1wJWoYDAEwbDQGyJPW
 hbeElsbqNDOvA053rqvl/6aoKbWy4XKOX63Y2g15F9d7w3gKOgo1P63oKtMggN90yjLS
 7rHfC4pE1HKMyouJgui5zKpuiWHhLVgs7IDYKYvmvXuFLmhWpae5aNXzITRiYwsLsicH
 FUhnWdeW+7MvbRMX3kiO1fr2ykK/RU2wv3VnacI18Uz7LhB5aUEWKNc6E+Yu/rXPLY7m
 Io3xLILIiLTwzUXlkgxrNM/mu1W8D5huk3gpgv4XMrva4bVjIcHXY63r1AmikhxTxRbL
 WmYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcBFg4SrKJGSPM3t3MnNibtzx0lG6xyzTtq9j/rQ4vGNGTxGL4BwJ54KNAy9kp+6/Iap7lCNku0/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLexMqBGlRi54R/v3iAgXa4O5eEfD5FUHnwy6WXCMxXmJc5gmb
 mihZp+1YxlIQRHDXh3dg6/1UvoaRT2bAXGEnGdRfcY8U22hvo02JsHnR3HMNCB5weQUhZpCYoUe
 qTyAfCNW0dSSLQ+KXGeSdRpnZAAqFY5qio3YAAkAudow3XUsCAtDYnH8z5YPj5LotCF/KZMg=
X-Gm-Gg: ASbGnctSsKyGbhQBY9cbEI7h3t6ABCEWk81k9jLgdP8aeGXn0Ph05JPneonbwAQEz8Z
 3y0FBeHGaFu6tT0XCgxZm3ApanywADhSFfWAxCVC/LU9Q3/oTurTcCtziD5E6dZyW6OGBpYsfRY
 HXfZbi1RPdu1fyWdkLso/YG7BERKu7QGscz6OicF8oXz3G55+9+A+Cxi98n0L5eE8lXfdpTK9FD
 rDyjTQlVER+hV/iIDGwM9H2ZF02zdKNkJlGapZWSWVgIIQV4zSBTLGchqi4VHpCNY18z76Lc2kc
 HpFlGokTS8tMY1WEGzEs5rE9xXjVjWEs60DXx1B80gzCPf9XqJtS75vZMjFTmi2O
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id
 d2e1a72fcca58-7742de69de2mr8431462b3a.30.1757320046256; 
 Mon, 08 Sep 2025 01:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx1RcsKkYV36SjKV6SXfFHKm2oYnM/mkT0SUBQ3saOJZigojpOYtZEoUOvIGnympk/b5UAYA==
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id
 d2e1a72fcca58-7742de69de2mr8431408b3a.30.1757320045741; 
 Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:54 +0530
Subject: [PATCH v2 01/16] drm/msm: Update GMU register xml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-1-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=bIRH6FXgHyR7N5ev4ctKZhftLdIKx0rpAmxgC6FNREj2Ax/ZvRvRsRJ3P1WOqGT3PxAMxB+2i
 sTYaqLCBQxkCyNiUTjyCpWkLVGXVXmHRSBynKixHcZVw3pr5Q4iSj6O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: gQQLV4wXdNhropSkvQ7k9YRrEYtC-hqP
X-Proofpoint-GUID: gQQLV4wXdNhropSkvQ7k9YRrEYtC-hqP
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be936f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX/i79EEUMOFuS
 H3CbHmMM8Z1IPgahENmbtBcwpYAneeLbVkCNPrCrrury125pBE1uXW4gzl2SxVG7FAoVxzHuoNc
 2aUDRzSptPG5K3B2SZVC3opMsORmaE8IVvt34Mth5RJyWyNzqvaLohqi1LiD/Z4AJMckMLcTsae
 wvzRNaoZBoRVW0mKZYi3AlWLnaX3GwJ4YQCoYF7o6V2nfspz7gp3q+nXQhk5V8ZWzZiL3gpcefK
 qAsvsarZ6sgqyX0+Pc97J6kQAe0jaZAeZcLtZWTjMILefTO1C92w++qI5ZXluUHK+ZhrJ9fF95P
 Ir94Y8O1JI60IJBnFTBHCCCItikiZ53Ny4xUMFheGZar4sI76+QKKAo2BzpDvseI843VaPmjc+l
 aolHVp1+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

Update GMU register xml with additional definitions for a7x family.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 3d2cc339b8f19c8d24b2c9144569b2364afc5ebc..b15a242d974d6b42133171c8484d3b0413f2d3a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -99,6 +99,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
@@ -127,6 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
 	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
 	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
@@ -228,6 +233,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
 </domain>
 
 </database>

-- 
2.50.1

