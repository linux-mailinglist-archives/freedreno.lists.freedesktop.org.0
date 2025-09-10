Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D2B51589
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 13:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A2410E8E5;
	Wed, 10 Sep 2025 11:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LlqRBcLk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DCB10E8E8
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFa5k012949
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ItLhiyodgTeP1sZ/6PcQUw2zlY/QcYa0Nupckl0eQLc=; b=LlqRBcLkU0vRc4D5
 ifQUNQiL3m4ArNySj1acUu1rY82IiFkQQYf+IdHLUgpxVvHCAXCEryErQkbBNJpy
 4OD8f86UDR6+0TqjPOpAf8Vyt0CCLctspdv9k0FmCZJU2SMSp4MHP/R0/mYTiSiX
 ETereEqGOEbiRsmGaQsYctFgcbebM/Er/+ahQQH3cJvsjZJmbALhIal1Rb3x1FF2
 AHHJR5WDkK8EWBkrkVsCkoNncpSWgeqRiG4KupbSnYfCVZywySKMnVSjMy9HQR/K
 fsiVu/BxjfzWPnSPGD2dXhgArazoC/+0CsReI7Hm0IwJTYK2x7hO8bXbZHIYxVrH
 c29VQQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg3f0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77260707951so11047485b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503590; x=1758108390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItLhiyodgTeP1sZ/6PcQUw2zlY/QcYa0Nupckl0eQLc=;
 b=M/j4btHIsNvYSUthp3n7CxilHGZ0dJcXEHrm2Lu1KqXtIao6UbEYyFh3lYfq9PcSiq
 KBa9a2VnQ39wiMXbn5mADCYGIISa9Hl0vA/08Fh9qJ8k2fF40qQWMzJAB682xxewpklC
 OdgEK0DzcEqLlTSlu45IvftcVmp88fgRh23WA/uWOlLh/+guEvo5eTddUvnLMj9hq1bb
 FgBHxTr/nWraYGA5S3OYve02+Yojf8/b12GAvqZeB2h6z9WxZAmKewQbG3EgWURkUM5n
 racyGetKXHZzYVUfV43BVnqVtBy6ik7iwttZCsBNB+meVTneg3r/uEwf7wgXLk4xejFw
 2z5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlqA8JqvWMXszjvF0HdK++X6D/46LITvLBxdr0qqpgFzyM/o/hWr/hmu7EPjDgFm4z2eB4mOigQl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw752acwPKwifZa+0c8a7+DIfFo8C099wYAAmR/YgQ4WFCagRSd
 LoSXF6YHUKPflGqJB4LuI+elY4RiOP+mr1ZhRei3uRx8wUe5bl4X0LCwrPAA1+7X+L1fcN7FYol
 8McR0gwGo04mzmyl/TBlz0vTcbCEstaaRbof2RdkzyE6YyCZlKo/hmAP/H4zN0ksyDR1/tTU=
X-Gm-Gg: ASbGncv7CllLgPqD6YXz+Qk7Oh5BdPEaIaVls5lbZ4+zYFau4dEOsq7vNyqgZDKZptG
 pTORs3Qe76N0DOjhPvZM0QApeDYDDrv7vsZIg5efESbBcZnrhWpvqsF2byGWXbhH2nDk0q6ihHg
 6sY0keerpHMxELq+QddNKLy1KJrW31mjU4eioeaDFmWNeMzb496V9ZbZAkvv+VAGGWJyN7V2FeD
 g6rKnV8wDGcH6F1jr7rYoO7p+iF+KW90pM3Fiz2tt0VpnIbbYNnEESl4+utgCdmc+fTI1YEebrX
 9nT6GHJYQ+QmKQUjOyi2xXXKSMXjLVuSIsMfDFlUNMnnJRYd1+9PQwgyiKwGay35
X-Received: by 2002:a05:6a00:2316:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-7742df20736mr18098101b3a.23.1757503590183; 
 Wed, 10 Sep 2025 04:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3J8x62G4seX1p9NFkixWLQX1lFKU2WgY90wZyTmN1FLYB+oO8Bqo7Pu/0KMpDEix/eWDYhw==
X-Received: by 2002:a05:6a00:2316:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-7742df20736mr18098063b3a.23.1757503589677; 
 Wed, 10 Sep 2025 04:26:29 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:24 +0530
Subject: [PATCH v6 4/6] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250910-a663-gpu-support-v6-4-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=3339;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=BT2bEOOj1VdnrLSDgfG9mGOBt17PRs5hzWArlKzjxw0=;
 b=y7YtaxeWU40iOFan1dzZVankzZNL4sBpuQofugyhnB6d1UwMcUMairlaBb6SNeGa1A6CIBe2u
 OTbFKENIEYiCCO9Mt/HQFokGvWVY06UspfiBsX8m2pszA2hUHCXQuNf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ws0RbiOoAqItEohx4FHineuLlggU3sLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX/9iOGO+Pw82w
 cBc/mwzri3NQrXT2AB53eikIevwQupzEGo1zRgOYoHhB/bzH8QXqwEX5duWlFF4nIt6UsSV3exN
 rEsaJkpeIHFjccb1QevIyIZ5BzHzRVnX/pkgviZIUk7BFaAGGRvjUgSLBhyRQbAwRgpAaAa298R
 NWYtqNdGLqjuRJE0w6UYHWuqycoh/5xqgBuJK3Xn5dfrcyMnC3fHPFOZ8phVoFOXtluQt0lxV3m
 rn1+HGJuNYCzJvgvh4qn60vhyMcrF9/hjFHQ9Ib2szcQldmJFqyO4fKydsXABXHO1T1gdTezQiI
 5nfbBW5aWcCX2ZDYT4Mo7Jw+xTIiSqNALLe1vemY4RUXnJbT3wLo/aHXOQCg4iAH3/19m0yoy6g
 y6MJmpYs
X-Proofpoint-GUID: ws0RbiOoAqItEohx4FHineuLlggU3sLK
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c16067 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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
index bffce5a5d465b6360397290aa3d948268a254e41..ffd9869cb4579a9a7c6a29ec596126296a5af7e9 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -6824,8 +6825,15 @@ gpuss-0-thermal {
 
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
@@ -6844,8 +6852,15 @@ gpuss-1-thermal {
 
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
@@ -6864,8 +6879,15 @@ gpuss-2-thermal {
 
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
@@ -7054,8 +7076,15 @@ gpuss-3-thermal {
 
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
@@ -7074,8 +7103,15 @@ gpuss-4-thermal {
 
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
@@ -7094,8 +7130,15 @@ gpuss-5-thermal {
 
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
2.50.1

