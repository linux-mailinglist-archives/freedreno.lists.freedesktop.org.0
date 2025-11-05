Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA7C36F8A
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 18:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAAE89233;
	Wed,  5 Nov 2025 17:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvCFJefH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImvztRwv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DF889E59
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 17:12:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5B393W655254
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 17:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=; b=TvCFJefHSbB5LraM
 7j8yrZefkmefvf7qVaqzagyWMP54pHfGAxCBe4JUbqlvJTK1+kuWtowv0s0gYnvh
 Wpm2j1icNps2RVFLVX4M1tf79/PMnd7bgr9nhzE02+4ItIDcAJg8uw2j8vG+TZ6s
 sttKNU941dMkFLOur6DbgJWYfbGMBbVrGAoUkLDI+A1uHKoGRFom8DLZNgXDG2N7
 5GZAqs15h8cAs4OGQzCTqKzfkn8BLIPvZwo+Kro2ujkBMNkdmfavZhFPBGLBkAyR
 TePXVTNPNzHt0nUIvWAgeYRB0Vne+dokdNatnWB9w/hnWL3JW8kQgo+vvW4pZw48
 8mjVdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a85c8h1j5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 17:12:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-295395cedafso1185595ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362719; x=1762967519;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=ImvztRwvKsTl5u1WwxP7pNb8Er+Bnwxgq3zZ/nTisVIapSKTu14KWLWrMbPFW7y0iB
 Z1CoTHOMXOhbTaH5SEm4PZNGPP9NjpMzxFEjSGI46tQnzmVX1zr/3tCneBuJGgB0/aJ9
 KcRJ7UwdjaGNE76VPpsNszCih9n25S7XrlJzIoAIxQre2/gpeWl4t+WDt/0jTYJECRuz
 6oi4CMSuAyoIDjG3sG4tVDb0jKROwbwjUh0mRpRF/iMoeUVywOfQRXd0r5ehyaS9YmFK
 wQot1MZQxkncFOocTC97HUd5ph0YCaV5XF4UugoljJBolClWETK4YnzYOlxi05cWZMRw
 pgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362719; x=1762967519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
 b=SR1zqpZ3d9krIoEdLO0O2FROXS72pszccABIl+XaC6sX2cl2OroDqIzrZxRtwl+lzX
 AEKPvPVlEcOlagHBZSP/94KmsPznIAVe3o9/CXiAMDh51mcPbHd0WNPc9yZDY+6d5IwN
 ZnxnY2t+GUfocJMjXRJuBM61AdDAkKrdWjgN7tOzG3d55vSQFg69ynXsefhIHjK0S7y+
 9hTwRlaNOhDhMmefWinl3MT7tD8BQzXZQGeqqfR17hsUQVocgKdP6He9+2oLiLUSh2+N
 hE3MI2f31oMJltVzf/njvHHCmMmQZcJjJ4NdedTcZIYdPopaZiTrMnlMSi9oBtgGJ1QQ
 yeow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm3L+iFDzPNMslB7JviRGdUdn5ieJOsTOR0OdCODB5v2X3WRiYeoIrL+hpP2ox0ujrsyzLdz48pGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKQ/G45X2d2I6h+pV6N61jGmMlfJXwsgmSBLZCswlBMIx1iZPN
 n4Ita1GYqMQejbuzZ9tmhFll99ibUM3mrGikxX5W+KmCy9LSUtVPS13S6yYBVKKWpjxqEWryUtS
 ID2Vv5YJygl3MbZtjE0WCJj6fEPegFKQ6iP3FpuU02Bb2HknS0izWy4id+hA64kPxGnuF/2g=
X-Gm-Gg: ASbGncskB6ixF6jla4Wy8K9yIszNM5YWm76GINzHt0Nqf9SxKOqmpxprCxZQA/Vvvri
 g0A4BiNjpbnJbvVDbWvMuCHuBxuuGc8z5vNNchG3v/m2WYsI8dHtvGZJiCXzGi04UsVU0xMSzxk
 vhJlWlxxeo9LMY5mVs4rq/KkzVpQ2eZfydyoNHMMY4xYS2jQ18OIxuy9Tm3uN86j0DRBft1wp/9
 uSnJy6cubnk3wcOAepVr5G282a9ZNS1bG9EP8s8CM2lT/aZIt5dOVPlzBYZ60RT/mFmS3XLQYtV
 +0JWGMtM4KQ8oaaXwRfpbg0WhU9ZlQSRA7ivEvvaN5HpTTi7nvsqcdEHdkanj0PolwbjZcpyL+S
 RIrQ8MU1plj5V1g4sa+DvgkA=
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id
 d9443c01a7336-2962ad82751mr47925235ad.4.1762362719285; 
 Wed, 05 Nov 2025 09:11:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7vx6gRi3vnn4VoDJjmVj/WM+UJYf70Y+veIY5RUPDoORE/IhuQFEYI/vOAmVMsKNxs0eOpg==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id
 d9443c01a7336-2962ad82751mr47924565ad.4.1762362718677; 
 Wed, 05 Nov 2025 09:11:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:11:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:33 +0530
Subject: [PATCH v8 2/4] arm64: dts: qcom: lemans: Add GPU cooling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251105-a663-gpu-support-v8-2-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=3334;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dv8fOd2JCzTjOzv1PtyfPnTYZUgbOREKQ5dEyRmj6Ig=;
 b=DoDXbN6jLUIZNAoa25vhI/IM9EWA9bQQ16qz3CoxDpGRSpqJRLyXqvCVt8BGN683j6Zo0Ghqo
 c2QpoSz2/+zD04sjTQ/uxjzaSXmnBTES5ddxYfRo/kZzIDgstrsfWot
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 96-TRGuGxoNkGVwgZJt82PLQ120N3xSX
X-Proofpoint-GUID: 96-TRGuGxoNkGVwgZJt82PLQ120N3xSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfXzgCcPqNcbJk9
 IFMdOnckIr7bp+hHwhphlWt8edcDTcRLGA63bmJi/cCrY35paXMyOdRXdFIbMZPwmE+4Tn02F3D
 ip7Xmr8gOCmLXEKdp40dz3oWT0huyz/FpEeBj5zts6PXZWjdxXQHBtJY/+OODwDhLfCAPPl5jxb
 UTSi8SczVqDZHJ3/+yAUZBda5OqpZ5MV37TnHHyvQQpXMzNfzzTQPK5W5GLusuiJcMQiuXOIMLW
 yJLbbsZpVu3iTrdgZkJpIoau2ny7Y/gi7rmIkk9Qbkda+IbAgrMyjn51uQW1pTVV+09W/WaaasS
 5sQ0EoU502DkrqZpQigQwWkKl5MDDzdfd/ya6fSDSvBo8p0xoU4LktqRT8pmPLeFOb9U402QHW1
 6KzxcYxSMPNO9BkKOQzDI5YW13HEFw==
X-Authority-Analysis: v=2.4 cv=apS/yCZV c=1 sm=1 tr=0 ts=690b8560 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050134
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

