Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD598B30268
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B26E10E37F;
	Thu, 21 Aug 2025 18:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4k0DPqa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FC210E37F
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9Mei023012
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uCiVz/zM6eCSXhCxGTh6Gbw0PH5ybtYshudhhtAkWDk=; b=i4k0DPqa6SEj78m+
 KEjyKteGdmOwoSeJZJrUd+8MabTB+H+4XsNseQDPZOboSmAyBctDQaIJUaHGCUhR
 UsphKsSdCj2IVBWBUGMfQ6z0B81MVu2aoFLJ/+HM8v4TWjQyC+LQj/cZ3Q4Wnd2l
 y9txa5SLrwee5XwAKNJMBwCzcnizDD8C3UvymH27W8Zg8xapLef2ffv8treq/rFY
 9jIxB6FgH4giA5Wig+/6lsMAIIQh8aPtBdBw3ModBbS4hhPtfPFTlh/Da2FA2PwM
 m75b07bxrxncYLbNXGljvwYTPCmL+W3Jt/fG0rkUu4uEqfbfmk5BipjTHRWw1eut
 xyLYoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aejwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso1354460b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802597; x=1756407397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCiVz/zM6eCSXhCxGTh6Gbw0PH5ybtYshudhhtAkWDk=;
 b=auIBqrp7UR3I9jEuhGYJawlDxPQoud6toPNN1+8ZtjpLAsV4RBZnB0YAQtrYqevLGl
 S/5HSqz12cF8lsXsLRt74ExAIqaddtICnITZ1SEjOSntX6EVbl8ioRp9mmgIGLZbDjOm
 s2abJIZBsmLDti8NWsqlvLDgAnRWLlJz+LtXflx4RWV2Uw0U4GwfeH1OCUewUcqL8qE2
 NAMfIta6IzOVgHKneFjrTKRMmzaJIdmVWw9ULO5a4hMMKGmK9K2JM0UbGhQR3+egvxJ/
 UZftK3V2rZ2hf2VEByT7/LBVMmlMpbBfTiUD24DdS7OWceRJQ1rkFuChQa3MUZlxB/6R
 5SYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIDvfoWGOUF7u+vozXeMu13GN9FfNGTbpIZA45GSOmi0rdJyBAiM8F3X333xz1U1C0r6BKkpXq4lw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI6mF4tph/+I/2QHxF4+HUFYxZ7osJ7rHcmSzDbZMAN2bUTTQF
 f3uigs9cYd1YGuw80YyMc6MAWEeVEiyhzXP9sLNKE0a/8Ivyyo0pc4SG/w/3Bos0CC0qKUtb1Rd
 wXQFqyo4odBllHQNnyw/vzo7obA5qZfjQyjpCzlrUjcYpyd8l9zVoIYGudaZk874CwIwxBgsbvt
 CDKq0=
X-Gm-Gg: ASbGncvxkJJ6tIzvERN2/3BxLk4eZllA+1OOfI6I8DvxNoy0Flm85qKKJtMmJTn4nzZ
 yURTXOfpAQE+A5rdchie2qnYM5Nz1jcJAId+FqNs5qkp+I2/SS3IoI2nu8TF0vmLD9/DbsG4L1r
 PwZZRYBPCVuYgYZko1sfp/4ll86dCUeT+/sHpdi6C2Fcic0JvmtoxIau5H35rRlsqoDGyIXMiOB
 yj6pm1Hk4kdq9ro0vqJtNwBL/I4QajrM/vrVRYJyzqO+hdKphMi2OFfcQika/rXfU3sf+BRCKfK
 R/pfXqX/2ng0viT9nVlPA/P55+ge4sLmK5+SV2crDq5rlI8c1LsqAxXrRtn/oT6b
X-Received: by 2002:a05:6a20:5493:b0:240:1b13:45a0 with SMTP id
 adf61e73a8af0-24340acc9cemr358039637.2.1755802597477; 
 Thu, 21 Aug 2025 11:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9vKMYrMsGc/yz6qfgqZd3fzJRBHQv+esspB+E8W3hqgkJfFk8r7z9RArSzZ+ihqeZMXb5cQ==
X-Received: by 2002:a05:6a20:5493:b0:240:1b13:45a0 with SMTP id
 adf61e73a8af0-24340acc9cemr357992637.2.1755802596982; 
 Thu, 21 Aug 2025 11:56:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:29 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250822-a663-gpu-support-v4-4-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=3939;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3VQznur+3xYt9Fe0EWhXJS8SYw8qMf3aItqAFr+fB5g=;
 b=Ok3JUUHmwn3kmoPssXn0r3Zo6MqD4g7gXv3kqJv0v0HijYzISTAZdNTqWrSdmluI+DYtuoML/
 AIaHut49XkKB9ZJe5MhGtUkDNHyXqyHzBW1ssjZn/UMP3EkyauVWsxN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: LAIX8Jy5QainSeFiZVufz5jGJfx-lSuj
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a76be6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LAIX8Jy5QainSeFiZVufz5jGJfx-lSuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1xXNCc9Bna/E
 rWxQKBimWrVBjMc2E83wec9mgjSrgI6hBlq1hks3UNtnz8TyzipxAKIw2c48dlMsBpOglwdFcGu
 DDxY9ZiJA0YQC7S2va+THL3fmSlyKEcBTfwPdMWTvWrgbIKASWGsPCuPsF5GnCaxLQmqHb9hE22
 wihB2chLVnlSrXyIXgVwaWbQ1z2jRRTuU74Y+CzyeAWu1o7OiWNMAkJ9aqmuXfsSrqXwVWeUux4
 d2udRGbkVUrZ2apCmBERtlhg7jpg5sCbRdnUGU0icPwfooLMe9kqEpWbpk9coMRc2NiQueJot6y
 7ClLnD0hzI08VqP7cArTUNFuBcG6+gQKAUJ+R99MsvzAEi8HwgKM3G88TWX9ekYGhJku5uBLZ1E
 +anOqIcqK9Z/LN9YdltOFQ5v4bSR3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 67 +++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 8eac8d4719db9230105ad93ac22287850b6b007c..b5d4d07b2fd9c14a6f1cc462c695e864394cade2 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -6816,13 +6817,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-0-thermal {
+		gpuss0_thermal: gpuss-0-thermal {
 			polling-delay-passive = <10>;
 
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
@@ -6836,13 +6844,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-1-thermal {
+		gpuss1_thermal: gpuss-1-thermal {
 			polling-delay-passive = <10>;
 
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
@@ -6856,13 +6871,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-2-thermal {
+		gpuss2_thermal: gpuss-2-thermal {
 			polling-delay-passive = <10>;
 
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
@@ -7046,13 +7068,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-3-thermal {
+		gpuss3_thermal: gpuss-3-thermal {
 			polling-delay-passive = <10>;
 
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
@@ -7066,13 +7095,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-4-thermal {
+		gpuss4_thermal: gpuss-4-thermal {
 			polling-delay-passive = <10>;
 
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
@@ -7086,13 +7122,20 @@ trip-point1 {
 			};
 		};
 
-		gpuss-5-thermal {
+		gpuss5_thermal: gpuss-5-thermal {
 			polling-delay-passive = <10>;
 
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

