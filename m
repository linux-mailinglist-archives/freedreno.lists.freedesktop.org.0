Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF4B49A2C
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A7710E5C3;
	Mon,  8 Sep 2025 19:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZ5ZIn3l";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296410E5BF
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GBuIC004401
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TlQf7uI+N5nmhJzmx3D5G93mBC+iv1av/YTKYfSZVQM=; b=WZ5ZIn3l5GTRI9uN
 ru4PA799A8l8dxZvAf6oVvuJrlr0mF4YeSedHAdOSgE5gGgb2t8lFH+o11Sw6SxO
 f5X3HHY80+d/MvbjwRTWZKoWhzx5a2PVYKYrqi79+UcPFEtc+uY1CUssNvs2zqH2
 /swvDNFNxlI9OGjZBzMRpMlKmA1betwVyS7n8+9DQVzc4RZ9zzJVvJjxgQOjlQb+
 wrZQV9OSpOWWIJxMeRBdgieG/UDcEQeHOiBwVw8RQkzITOSSrAacraWgLrgxMAgn
 U984+3Bvax6nj78P8YqVgagZ+1C/Pc1YNDNp5JzsN4joe6/JjYuaBqz3N9ykvrx8
 J6dwiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j5w38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24c9e2213f8so65105035ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360433; x=1757965233;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlQf7uI+N5nmhJzmx3D5G93mBC+iv1av/YTKYfSZVQM=;
 b=aPG62l813G7ujNJ8Edgyk9OZOHM3U48/DYs7BB1amjhsLrp14OVN9t7YJ/HyP5x4Zi
 7zCKewJFtXlLg7n2kfRLH3kp55Qac4XTcKr3KCpjufWDPyK2bFYxV6QLfdxoEOvUp4Wo
 RM7P04C2PI1zTWD0fdRw51hc7jYPSLCnAkEgoVuB65+rpDNQdnGHtR08j1+lD1AUH+OR
 n/6cly+d8GaA5xeAOkEN/RcR6pC0xanQBPkWkxi+Y2cVTj0NCt26NbkjTwi2dZZfYrXz
 BFm6EvgcF4tNatZKtkhx660M2RsDZ8PsufiOFlZRfoPUmNeNc4IN29ZqLlZtA3BTohpr
 oKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfWeK//oQnrWendKEiqXOo/txmRZAiJ1KBHyWMo2tewY4S8SWfOb2GbOj7bQJnp0VQKKhUTVAchO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk5ca7KDGMg10JnMHUdPMuNGfUsryjyz62bU5yUnq4hDSls3hQ
 ZsnZJzn8wk4dgahGY1VR6Jjn9UKg9mlGbi36kvhNPoyBop3nmVNIQv7EnBL0P90gu9dPwnFQV27
 uny+l2oOybBEcrH1SFLx3Y8QRIS8lJv+M+Gs/MlmyG68L4oxee25mriLvscLRGcxeAh7epDo=
X-Gm-Gg: ASbGnctYNHkpEI9hMOopAZEYY73KF7mBsujKHNO/wB21Qu6XyQMbvmmuyuHTpp/IEqv
 6zc28TcIqolvBEt0kLCNhGX18l5SnNqLCnsSys9YKcYVV73U7OEwxjwihthk17M2+OAeYk++DWH
 NnS6SZpjNKuDrn5t2tt+x12SePYS6kY6fWFhg1eFdhEjpFdq+m4Y5jO57Rk5suBdQCFWhQtiSG8
 oYgIDzv06QoK6rbWPzTsLyPAZFMFzT2kN4TvQxp5upIyn5UuC3CEHt33lpUS395ekokz7OSq82a
 MYHn0jJ8b7GZDg5ksK16wGbRzJ8OQNmp/AFGwaXCywxhglm7oRxYeKlgvEskIFWq
X-Received: by 2002:a17:902:ef51:b0:24c:cc2c:9da9 with SMTP id
 d9443c01a7336-2516ded4545mr113956435ad.14.1757360433136; 
 Mon, 08 Sep 2025 12:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+UOrd5zxwYCwQsqJjJ1KQY0ewjFqba/O118Yvv6S2o17AqrHtZbIPybHZDLljRo4tPn0ZKw==
X-Received: by 2002:a17:902:ef51:b0:24c:cc2c:9da9 with SMTP id
 d9443c01a7336-2516ded4545mr113956015ad.14.1757360432585; 
 Mon, 08 Sep 2025 12:40:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:39 +0530
Subject: [PATCH v5 4/6] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=3278;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qegwpgAioEKEmVS8TSb9ZldColVWRJ+OCeiisZIO6Sc=;
 b=p+OrZ+BgX/ZDX3ycIm3MeYIOuBHQM2L/9alIYx1TLY+d+MHtpshlnTtJD4Nd5Spr2wpLI8w7/
 Fuu13Rket90Bcc7CtGMI/OAv8wScHAI90zbX4vviDIkuuDuHdOkJCs5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXyRpeeMmAmT/C
 AFkkwDAdiO73xBZElgKtn7SCTK2a94NneaPu8QIo8z3cPs0/5qbJf5HIjnXxufN1shM+0u4fPzr
 6DGCuALGAjCw78+4DbapwCsNQ2oG6neWmZdqVl+BXbBVYL7yB6wGAT5ePGgeowEkXiFzcO36Z81
 9H9RD/f5WMG8IuAyEVE1zSZ49LeQ4Po/OdZardCOn8Bx26EPIghHCMvLw7gXoaJrXS5kdDyI+Vs
 Lt6Gp2kG9zUluHRHuB8Ft1t0j7ngKof0aWLLJ+YfrX6xoWnzcs/CDb7wcTZifSEDXD/qt6OJs+v
 vmTmqLOBiExse/glpg/1Eyq3MVbFxx3YKDK1ScUQG8i/ySclI6zVTe+iwUP+8gi0VQuQogRovuu
 wWP9lR6d
X-Proofpoint-ORIG-GUID: Rycg6QEkVldPgN9SWVQrnuDJBI1K-uyc
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bf3133 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Rycg6QEkVldPgN9SWVQrnuDJBI1K-uyc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 55 ++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 52c2533383920fdf34dc1eba11e5ec01209f4e8a..cc64ff9aa8dd1f2b610548e5a5f5192bd4feba7e 100644
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

