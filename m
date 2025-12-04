Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8F1CA3CA7
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5510E981;
	Thu,  4 Dec 2025 13:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqrXyyGq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZsJoumF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D2210E981
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:23:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4Cx6GG1438005
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=; b=IqrXyyGqkxwzt4Ju
 N0ZndfMcfseKRzpl1K2/6RCNx6PIvF/J6kxfEahlF+yZUMDBgBPWgClFY54nPxkw
 Nr8QBBztYhsuZ62ETwcXMaM05Hzda7uj3gUAk/X5HHhyB5K2BH6w8p5m9STU5oKk
 bNtXWuuoztKgj/N9P9syemKiTxqoi1RKKb3CKSSiDoK4fY+lvStrJyJ9Rr1IsCoX
 MGBaw8WCwW1d4WSqIdqgT0TuUgcJaCQ6eOA8r+oPemX6IgYeEapz+ExakTBz4tVC
 nepZJIK4cX5f9LwcfGWBPHVECu8D7OhHNHMmihzvRXkuE7qovCpt9kOId9Qpr2fF
 KFyM1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auascr23r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-bcecfea0e8aso1169730a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854583; x=1765459383;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
 b=PZsJoumFGELtgGKhI4P++316ue2hrir8N2Ci1FZSFiR0rX36tUh2v2h8nvMAemCSJN
 OwqJgOmcQdzCG6mMGYmiRa0hUTkSxBjopSWPE55N7yZjQ0vCoDkOHMD+gsiTzfQPzoHf
 dwXbXp7Y9UU2yji/wZOherJw7WcIHOI5xxp/kdaKSQHxkak7KTwa81+NrXL8g6A9+kuZ
 uTBrWzv78CdRuUy6xarthfJex0vISfh7bvk8JcltcPfxhVOl9yrFzUSsj9rk/k+5Gh8e
 fUjMlfnhyg5ixB14rmhpWUM3SD+krUkqRxWf+mk39RerW3s5jDy6bxb4QWc7yLrisdwO
 77HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854583; x=1765459383;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aTXEd8wP5LDpChD5fpPo8u1L1sTd9Z0jeas5ixGhjy8=;
 b=Oq5vCnwsZmH4nwtQanFYujB3FYqzm2q5VR0atELZb9/DW0mIexUCaXHMfCdi2s5gs9
 wVvf/MayblgF6tzTInONgbhlYXKqbetWlI3wq8n+J/YiHnW2QXsGXej0nDBN1zHQb9O3
 22Ur6vuY8VcdZ1QU5bvPbXHLxNvhieJBy20fny+8rr4upiH8dof3cgbKNioyIafX/Vii
 UsWYZPcdM/MsxD8CHNEpfyGD9mhCoyArKUvZRMytX4MerocniUTSQ1VqfDIaHcCQfuUn
 QZhxipAY4WAhGDxSJOo+itC0IBCus+4lGKUk7t0weiuEDM9fIM1TVEF8+lch1nSNT/Ya
 KGrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuxbHCAl0P+7nEBoLyoy2DtDKRiHsrxEb6o/Sm280i/h0Sw88GdOeC6CygqZcvOuVaF/2jD9CJJyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+ZLVWoe4fkmaQl9HX+ORujWTzsdhujj6DzjN49gIxXhwlJFb8
 vAYLtwSDIkgUZ20bBC+hD4Zvipj6PeQl24DnYFWnKvjWYQfIFjfKm8eI/ljYmYUzZMDiHs5mG9R
 HulTWAS1+v5JRIjCqKeXiskU9iaZ5ncTpj5qtVHdNBZoIJHwSC72dUHS+eA7MwO0KdKXeoDs=
X-Gm-Gg: ASbGncu+pM2yKUTJIth/MQT6sdgt/2jEMPsp+7wkgPfMr7+gldttJ6/rhUaLp7pY/ck
 7QuJyisY68ae+AVo6wYngK4Rwc1ZeA0k3AHNX86pYxNhabC48lTpHyN8/5aJVWSm/yLSncuPHWK
 honhlKLM/DNHlGW5NQ1ed7iM0K2PxN7nilfpfkEFODHDietjeokHV/gZMm7m7hGzEu/5NnHB+V2
 cAneahrmY9lavTV4E5TAl5bDT120NLFRWwL/VP11wgKJMgp5RxYrkZ8PX4QtAQ4tOKsKel/ttjj
 AiXGIdHePbMAU3UiXHOkvB+o1g1XtotT6wYou0Q6ErEfXIur7+zlaItYTWknLU6jn3IkTvAz7XS
 3kKfHsKJzMr9xlkaI2exYjOLx2fQb2JiKlw==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id
 98e67ed59e1d1-349438bdb29mr3230141a91.17.1764854583380; 
 Thu, 04 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn4JZgnbcDINjtOA7+dnAJ8EBm0g3g2oNvPSaAR4vbKS8svkkxZZyc6KCVwyRlizMUdZaVMA==
X-Received: by 2002:a17:90b:4b8e:b0:32e:3592:581a with SMTP id
 98e67ed59e1d1-349438bdb29mr3230093a91.17.1764854582867; 
 Thu, 04 Dec 2025 05:23:02 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:23:02 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:59 +0530
Subject: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1441;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IH4I7WgYz+SJJ76MCxNVByrZLxMvwBXKq41j5sQdwN4=;
 b=d27ZngPAgX4XvtvRb01eTZZlP1aPV4sfV6opmYoqiirXrpN2hXPSTpqcGHopZAK/DSlAOuSWJ
 e3FMup4mnZUDI4x8bpQUOsw5I8blQeGBrzOxvSB3fhjkr2wsSnStFQi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: PqfxV8RwqKV7CBUDy4KAsl9OUhJiI9Zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfXzHTGhsAULU9L
 prn/RHaLLjscUajgnhJJMHqWPb0tDH0iUAyB8DdzU90ijf9fM3KyxUfYRWbIKu7DaURP3DxRlLr
 l3gU8ZPTFgbZhX1I5veKXWfzeEhrmQfSCJwnW4/CSCSs8uuKnNOmaxmDdu7rV2Inl1wCy0laBlw
 X1J9p+G09jZvCWyvpzeJ4rjmfiq20HYszBdxTWN6w8tV+wfO3NWJm154EwWM17rrPOtzKGR1w0o
 k872kPMe1lUVNn1ng1MFRlzTNUqVM7PqGCZFiqaU27992LTXOuXg1VSegnVHdDioMa0rLXLftGg
 c74ZygNVQCKUcRWFCx+CEdnnxEvqV3fbyAIZWNVEFW1/fEhCasKOSmJDLFF2gFCB0hkL+jyJNVE
 +PT18B77+XLZHwF1MgXUXQ73SX+Cjw==
X-Proofpoint-ORIG-GUID: PqfxV8RwqKV7CBUDy4KAsl9OUhJiI9Zl
X-Authority-Analysis: v=2.4 cv=b9q/I9Gx c=1 sm=1 tr=0 ts=69318b38 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index effaff88df83d5e6a0aab45a2732a00cae11e83e..7c2866122f9a13b8572fd9e6fa9d336176765000 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0

