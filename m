Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B9AEFF84
	for <lists+freedreno@lfdr.de>; Tue,  1 Jul 2025 18:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A4B10E5CA;
	Tue,  1 Jul 2025 16:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ8PAisH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C32410E5CA
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561G2NAW018597
 for <freedreno@lists.freedesktop.org>; Tue, 1 Jul 2025 16:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ECxHJdh089e4eirAYjIbtiZqI6yOfBriOuAruldttXw=; b=KQ8PAisH45UI77lp
 RbssAwdt+58kpI+c80gw3XOddJyGrj9mFP2O8phh5d7/G4+eeOcpMQo8O4ugscxK
 AdxXTRzyqUQYGNOE+eFDsLCU8EKc6CpsqLSR5V8e2GediDblNu50FJsbLm+fH7IP
 9/Nj2ikuOSxvj/m9fp1yrdifVZWRm9ZptDYLwQI1cvND8pM2ffNzdnYo3XjxR0+b
 gm6Eb4OmQuwAXSNkic6f3UjWep/5TPKPvrNW+7LYeXO1J1zRLLEGlv3H2K3/AkS+
 +2ngknjmXTXGVRniaxuhf4QkqsCeNJ39+XQOUMpcuv7b3dDRsb1au11JcABVpmbM
 qLu0cA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxhn2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 16:21:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74943a7cd9aso5439439b3a.3
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 09:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386878; x=1751991678;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECxHJdh089e4eirAYjIbtiZqI6yOfBriOuAruldttXw=;
 b=dJwlvS0ph6lU2UaJ9k2ZQi9YkBBWqgkn9uIjgTWkF2MqdGKaAGq0WAusV8ikMepbaX
 jZPA76rC7K95ELY/rX/PzvZ5wnuN/bAWGA0enE4FEEVgzEDSPD8rzoz9mX9mDmopwz1Q
 jmnV7DCR7+TukBilZg0eIAr4ia1Hr35CIC5oYQDDZjqY6XyM6hDzV+M3kIkY3USv7sup
 oFJd0SMk26OH9Scm3GZcLaXkJVYH1ZniZ1pohFJlYSHaNsIFYTR+Zb2FNXf7csHYgiUC
 lUjPsRkg8pJJ51736b39jmK0W1b8gWDkbQyYXR+p/6tM+NfErKIdNQAiEzcIPgvF+HlH
 g5nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhgBWp86NndJehAbtP8tjENiYukvfYTa9Mz0KQz7/ElqemqkO7XXcPizbpTPgdBIjbUOtk96tBCRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAouM05BucpWUTyoBEcsxqIUSkb1zttYQNE+pv7RPYl5MA1C4y
 XyEHA7LrTYRXRDpj7qxTKmaj79wCeBRn3084K6Zf6NRTcZthg3vzUF+eME4bDJRO6sC+4xElM+/
 lwtACmErGqJ6pOHEtmAmLa4tGw9cAVXkhWmlH0xjOQHpl8KLxfKLfOnDjkpLrqIXE6CVzuvc=
X-Gm-Gg: ASbGncuOcMtMa0N9Y09Go8LcGczhn8IqDvHv95CBpDuxlZpnJFE6ue+B0/uEPybpFxR
 VIdO8wMNecGXc4Oj+g5sT3bpIUeov1K2Sj0EKNmwr3szr3sFPxxeLSBqA0yUV/7aMDiD/iQkCg+
 rCNtzOaZOGYBwzfVjL0ztLhSHTNR68YX4ffPzBrs04pGeDtWfehHEAVF5L/0qNA8/DjzfQAt4N+
 he6Fex+wvL75b+xU3x2yUxIMg89RjVTQ84mm0E+BPzilDhSzNChGwgo9qw4wHagz9JcTWUtFPpu
 0ptnPOKQvSxJ/umZQl0EwgOcv+sMPfBVlV/a0442cFZWjM8=
X-Received: by 2002:a05:6a20:3d92:b0:215:ead1:b867 with SMTP id
 adf61e73a8af0-220a127df83mr30988032637.14.1751386878021; 
 Tue, 01 Jul 2025 09:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGikc5hlYAw77wNpsHSmV1xvhSCkmessjBjU4c3k6bkM5aZC4AkaSqdgr7kwRC4ZvzWgHmXUg==
X-Received: by 2002:a05:6a20:3d92:b0:215:ead1:b867 with SMTP id
 adf61e73a8af0-220a127df83mr30987961637.14.1751386877516; 
 Tue, 01 Jul 2025 09:21:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:46 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Update GPU OPP table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-3-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=5522;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iXh1qfjmRxzFSEp5Qe43klnLYUlFeXvUPZ+Uu96OpqY=;
 b=Hzh38TN2ttV1DlAByOF1pUVt5sRr71VhCRAno+AkCnms4Y+O9p6yTAiU8WkntITjn1FmwhNCi
 qoxaXTAsCEvDEl0z9YyGuUfVzc5XWsv/5Ph7Gyo+WjTHBffxxaykJND
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX0Ffi0ieQgnff
 kAt6lblbguo5IlAeYAzjpzzWx2r5McbMeYZzgqlhv4GIWXVulowuieJhJbC4Mvo6os+hWw14j1e
 eL/LyZDbGsIKm8FMEPta0qFVVZ+TzwQOqAQXu1NT24DgX0x/uLG8rnUDam4EDsTTmGAeku66NRw
 vK3YWKa0lmunVvMsF2jQ6CtItxPpwBXSz/J4GupCHfMLh3vwgEm0RWWqT+lJfZkPESQQi8GazDg
 FFg+EUoUNFSCrks1NVGM9HofJXnR080R+QLJ+mlwH7P2eEwVklDJdPoXlQJombODk+iQrzihF9b
 BhE+zjMe5TlFoSWdmTIDGsDGLib80PHXbBXD1uKU5ydu9IqIRprjH4wnu/Q2Iy2B2N9wDRHbw0Q
 QXcn+DwzigRHppXU9X01sby8+AcE2D1bXmXUmYV3zDwZ7p4ZCA7Kq5N8FMDe2DHlRtGp6n+3
X-Proofpoint-GUID: B1ohvFwGIOe5AVUHpgVX7fjVCL1Ta0Zc
X-Proofpoint-ORIG-GUID: B1ohvFwGIOe5AVUHpgVX7fjVCL1Ta0Zc
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68640aff cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=y21bc7L5uEJNErKunEYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=920 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010110
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

Update the GPU OPP table with new opp levels along with the
speedbin configurations.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 57 ++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/x1p42100.dtsi |  1 +
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 558d7d387d7710770244fcc901f461384dd9b0d4..ae3a84e95bbbb282edcd8e42a860618ca9873b27 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3773,6 +3773,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
@@ -3785,11 +3788,28 @@ gpu_zap_shader: zap-shader {
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2-adreno", "operating-points-v2";
 
+				opp-1500000000 {
+					opp-hz = /bits/ 64 <1500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x03>;
+				};
+
+				opp-1375000000 {
+					opp-hz = /bits/ 64 <1375000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x03>;
+				};
+
 				opp-1250000000 {
 					opp-hz = /bits/ 64 <1250000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
 					opp-peak-kBps = <16500000>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-1175000000 {
@@ -3797,13 +3817,24 @@ opp-1175000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x07>;
 				};
 
-				opp-1100000000 {
+				opp-1100000000-0 {
 					opp-hz = /bits/ 64 <1100000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x07>;
+				};
+
+				/* Only applicable for SKUs which has 1100Mhz as Fmax */
+				opp-1100000000-1 {
+					opp-hz = /bits/ 64 <1100000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+					opp-supported-hw = <0x08>;
 				};
 
 				opp-1000000000 {
@@ -3811,6 +3842,7 @@ opp-1000000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82b5ffd>;
+					opp-supported-hw = <0x0f>;
 				};
 
 				opp-925000000 {
@@ -3818,6 +3850,7 @@ opp-925000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <14398438>;
 					qcom,opp-acd-level = <0xa82b5ffd>;
+					opp-supported-hw = <0x0f>;
 				};
 
 				opp-800000000 {
@@ -3825,6 +3858,7 @@ opp-800000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <12449219>;
 					qcom,opp-acd-level = <0xa82c5ffd>;
+					opp-supported-hw = <0x0f>;
 				};
 
 				opp-744000000 {
@@ -3832,13 +3866,24 @@ opp-744000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <10687500>;
 					qcom,opp-acd-level = <0x882e5ffd>;
+					opp-supported-hw = <0x0f>;
 				};
 
-				opp-687000000 {
+				opp-687000000-0 {
 					opp-hz = /bits/ 64 <687000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <8171875>;
 					qcom,opp-acd-level = <0x882e5ffd>;
+					opp-supported-hw = <0x0f>;
+				};
+
+				/* Only applicable for SKUs which has 687Mhz as Fmax */
+				opp-687000000-1 {
+					opp-hz = /bits/ 64 <687000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0x882e5ffd>;
+					opp-supported-hw = <0x10>;
 				};
 
 				opp-550000000 {
@@ -3846,6 +3891,7 @@ opp-550000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <6074219>;
 					qcom,opp-acd-level = <0xc0285ffd>;
+					opp-supported-hw = <0x1f>;
 				};
 
 				opp-390000000 {
@@ -3853,6 +3899,7 @@ opp-390000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <3000000>;
 					qcom,opp-acd-level = <0xc0285ffd>;
+					opp-supported-hw = <0x1f>;
 				};
 
 				opp-300000000 {
@@ -3860,6 +3907,7 @@ opp-300000000 {
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					opp-peak-kBps = <2136719>;
 					qcom,opp-acd-level = <0xc02b5ffd>;
+					opp-supported-hw = <0x1f>;
 				};
 			};
 		};
@@ -8250,6 +8298,11 @@ qfprom: efuse@221c8000 {
 			reg = <0 0x221c8000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@119 {
+				reg = <0x119 0x2>;
+				bits = <7 8>;
+			};
 		};
 
 		pmu@24091000 {
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 090659b8bb8942cdcc46f8d4a3e7dbcc043a0f78..c64727e3c00db1e4f8f34da2701061255caa620d 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -18,6 +18,7 @@
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
+/delete-node/ &gpu_speed_bin;
 /delete-node/ &pcie3_phy;
 
 &gcc {

-- 
2.48.1

