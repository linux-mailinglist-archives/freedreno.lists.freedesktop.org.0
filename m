Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D161C36C6E
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 17:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7210E781;
	Wed,  5 Nov 2025 16:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjcHx9GB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3b7c13O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA1610E2E6
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A580W2q3089263
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=; b=ZjcHx9GBZ5wBJRJb
 JX8EKzvSfTq5vGXRln+sdKdVHTf6ToHZaSCG7chhNxxOXCdA5Grbit2pfIghwIvd
 29unWqabuiJu2QJ5X+ZUEggBb73GbVYwALg8jpQnFg4N0hPmVR6M9arEpCQ2Ta2Y
 VvgwWwbKIAupucglw+VsVenIzYFtdjsva0Bbamq5kMdr09QR/3PcpW9AZL7Yn/A5
 M9FHcgcFprMOjTOrcN5HTb8wlJuJOZtnGmfsLRoSV8ZP6xiE+n7hSbugQUTkf5nZ
 etavAnlI3R54VaWDQLt8OwPRgtZjt/+356Su5HmPUZ848Z9/ald9IJux8C+sc5Fz
 xr3soQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5eb2jp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33baef12edaso116226a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361188; x=1762965988;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=G3b7c13Oc+Ay+aUNbew3k+HO+XNid5VEQB8Xw++YjZAcm02mjnth4g5HYASOE9X9BA
 GgXyL+pDJkGTvAWYlxyE3Rx5IucykqTCUereZoeahlUY1LF0oqJO+DPPAlsy7nJqy1ql
 eTP4igipj0E9QRVneP+BxcQSSX6qP8H2Ye+TBGaFlP56CKmQ3BN6TWZ5DUVUJF5n2010
 eIibKNnhdEIaXdOsblNz8kPV8T38OZ2f9ozBYKF3TcNhx2E+ORRaUtwkZYfglWm3gFB3
 0P+qh6IH7vq5QIN5HERfhNv6p506bvhn4UPZEUuLSBfF09zFEr07B0EFTR9EuT8A2QnK
 oH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361188; x=1762965988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=HfVEJkK+SGm7h/KUC3Xn/+oSmF21/mkq+eC7cWZrfNUSRqiyQrX/RRS206VXWpuKj/
 Bw+p4qeTWnk6b2bWPCKfUdj42Qk5Tmbnr1/QegSwqt2aZGoi8B3SwpxUEQHpSI9/PX4C
 vRINKVaVXSq8mPj5ltIA+OgxLX7nvFYR4uhCJGzlGw2ghslvX2q3bU6HCJnq8H6YyRFg
 SfvkI2BcRhz+twHj40rWCJ8oi9kexF2tpcU6Y6Z2urYY61/YlqLxFY0sT54NGI3P0aih
 FHR8cuxgTwH8MSkZ0sa67T5APzUv+xW6JTKmb+UZmliUS+rT9QPlKeZyt01aukKUydRx
 SMlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs7KeQKy1b4zMDzpkA453Gyv2n4l29kwkdTpGFuSwAS5ddJa4wQVLdwcHgAB5dSOUt2c32C0/o0tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIrGxWa930rkgoPl62Y8/F6oI5xXlnENtBUCaV74TuWIlMPmF8
 fxXCNOIjT7/Ux1484ivaxmq/LQ9FuFyz9wuRfhOzW2oSVDlBVu+2Yu2OQPRUKzHwEHdlRdIV9Qt
 C3crXx47TQPqlWh109wNHT8XO+X3bvJAWdrFPexrEibEkkh9Kwk7FOiFOcu5tHupzyxCi3hc=
X-Gm-Gg: ASbGncuEdUhKYFMgFY1gutFdyCp8Qm9vuBJXmmdbzTs4Hr1f9IuBdttYP1AlTdqsz7g
 uW5ezJNg1hRDEiJdPIyfliS2+A+lZUqZnufdsxhme2F5uDzNLcNP5bwcG4dhUhsE6yHwgbOa03K
 Dbq9nhyq28uBdzPq5V4vlN6u6Rcu9OS0zxXJcz7uTRmcvopLE78Xdjk83RB33XCnhRsNjAPDEyV
 qK4nGAOT9avcePdx3jjSMdG9AJOGkNtLgyns8JNKL0UNn6+Hg5O480fcFWcwpk1LxCwDa3zOpKu
 DyABKRsIZRIQAQ3azHlE1cY/Nt/yk6Of82aHjJOe8KKaEs2FR3ziVBAGHy5aVgpk6WbLiW59B2a
 lbimlTHDqxmksU0QXBzZ7Y9U=
X-Received: by 2002:a17:90b:2c8b:b0:340:a961:80c5 with SMTP id
 98e67ed59e1d1-341a6defed9mr4743924a91.32.1762361187739; 
 Wed, 05 Nov 2025 08:46:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErV45t9cw5tYMY+0WjKP4hEQIrl8N8Y/Nqn4TdUVyHIcGvNfAcA385wy9iWWtGX4qk0KmIEg==
X-Received: by 2002:a17:90b:2c8b:b0:340:a961:80c5 with SMTP id
 98e67ed59e1d1-341a6defed9mr4743892a91.32.1762361187240; 
 Wed, 05 Nov 2025 08:46:27 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:26 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:47 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251105-a663-gpu-support-v7-3-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=3334;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dv8fOd2JCzTjOzv1PtyfPnTYZUgbOREKQ5dEyRmj6Ig=;
 b=2yRxXU1F198LEM8Gl5ffmxyregbyf9QySegDIWZqoS0+y3z8TQLulwYf5Ifre5T/VshOrtyNb
 oxTdks4MnMMA9Rv/1sXm+QTy0UikCaaiFfwJD+gjjp8Q1pFFWZfkUbj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: qr-9aBVkpCZL7gRGkaWGfv6ZcQZ_VPAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfX28V0T/BxHB+R
 V7mLNA3VcGgY+tMZItAHp9bTV1+st+eqrOwSPUMcBBLDqte4YnBIz9FlrAHu9jrZqL17agjY48H
 sMh+i5zz+VaoqrMvzsdpFs4yynchllfCFumXwMf5h4VIc9zz9b/y99xwjJ7/qiPlJzcSDSWeCqF
 RYGZZM0LQze8k6sYkFtNXStEDAWOPdg+Jz4LNkfbBE8vpkrG7zbZ4oYUXW4znhNk6P4HW+w3XVh
 cQ6WdukVgbxVcgUcav2hXrG3WXeLd6R4xgwFIzrAwqMcLqrblHisJPAFnjNNVpN9nGKa+0/fL1p
 4pVenWM1vUjJMKgWhms8LZzg6QxwZtqVBKfmM+vCNaKUoMt3xjV3+gLtYQuawoXCIMw9JbYzc6P
 vVBQXXIuQqFF/zM4TY6qkSu4FmOvZQ==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b7f64 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qr-9aBVkpCZL7gRGkaWGfv6ZcQZ_VPAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050129
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

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 55 ++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 883f9e0ab45c98b9e128f3fa141d625431d89831..14d9f31e7086dd337c658cdb3989a4fd1c83092b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -7514,8 +7515,15 @@ gpuss-0-thermal {
 
 			thermal-sensors = <&tsens0 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7534,8 +7542,15 @@ gpuss-1-thermal {
 
 			thermal-sensors = <&tsens0 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7554,8 +7569,15 @@ gpuss-2-thermal {
 
 			thermal-sensors = <&tsens0 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7744,8 +7766,15 @@ gpuss-3-thermal {
 
 			thermal-sensors = <&tsens1 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss3_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7764,8 +7793,15 @@ gpuss-4-thermal {
 
 			thermal-sensors = <&tsens1 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss4_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7784,8 +7820,15 @@ gpuss-5-thermal {
 
 			thermal-sensors = <&tsens1 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss5_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";

-- 
2.51.0

