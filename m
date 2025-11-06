Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3C9C3D691
	for <lists+freedreno@lfdr.de>; Thu, 06 Nov 2025 21:51:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3142010E9D7;
	Thu,  6 Nov 2025 20:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACQIiwax";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tch5DCWR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35C110E9D3
 for <freedreno@lists.freedesktop.org>; Thu,  6 Nov 2025 20:51:00 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6HUUHr3383360
 for <freedreno@lists.freedesktop.org>; Thu, 6 Nov 2025 20:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=; b=ACQIiwaxE+4/mWMn
 oh63h64/SFdH2jMTWK9X6RjEblpxpSntEtqf+gwGXZz92zoQ9WWMaY/FehapgWhd
 jPm/xcDZE4pFGy3yjGG/r8udkf1us3nLl+koHsRI07JSiywaAwdiYrPXTY5IhGlc
 HdBIPnNDH7iIHO5p/UKqs0rck7J1piaC/wAVXWguQFY7V19LR33/dmTTg2aHszK2
 iIfmt5y+hzaL00G7FxrVrM5+l8YjridQChQr/ADJoI7hWJC42SeI5pWndWbFEDL6
 ErWy95R960aU2TjMVUX7sV7lFn5uCzyf9l9EyTWGKHRF7VpBVO2zDZf3oB4t+xuu
 tD0nEg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reut59u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-297b35951b7so1096085ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462259; x=1763067059;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
 b=Tch5DCWRl/ubxlFDm+vyCFxNvRePXaEWdRJHWVM+oR+iwjIng3WAdObbj+strkglC8
 At7gT6tG6eyFLmXYq0Si7VuyEM8aEDGzTddqsPfUmxr0q/tzX/zI0FdObM/bYYEyiWbu
 lFm0bNEyfy+YKGksYF1NL8MkhESRDT4l57OTjgiVTepGjCIkw80QVGOSwHMvQi9tOnLf
 XXITwgCTqOvcGR5MtgZQTDppoWRIXJcytvZqUfEES0iYLXjjEjiMHhsMhpADNzWr3+Uu
 HE7ttvv5jcpbPdCWR4cpi7CyF8e4kc1oLJ+XBicP4TrCbNEQhxuaIf3cl2nLhXcy8ffv
 mfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462259; x=1763067059;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
 b=jBI0fp373fmogc74Hr54rJPvNejeUBfN+PntWHcgdRfY+4d6EWI8fbOlH1ZgJfsjH6
 j305KSoB8TzjYXLGCFB5wS8jAiVj7KV0qXSMWs+FvG4XOjeQuVZt3UJnAq4RKGus6/UZ
 ubNjOa8w/+OF9SJfWeW4KUKDSEMeyd4nj8tIjfiFRPBi581y54kz5vAd1+1/L9BDL8fB
 yd9EYy1HqTO2dF1/2f8Oxz/j6aeX6cX/fT38/6SL61ObcCnsRdNnVsW/7ao5kvK1reB5
 lxnrxABO2LdvCGtmkBpZRElfPiOQQZdyNdQC9Cm1WTVdXml+3HrIFWxrmuKykLQorzT9
 adUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBGTxdiWgQe0oHcQvFDnBD7iuU2P73y3GgbWUj5RAA2xeU8dhf9mGa7H8s81WpOwyNvEtvt0a02qA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGeJYYZU4a4DuFGMEezcAeTPYc9uIF7tY9OSIsNUSaRrDshS+O
 43ZzzF6lG9NU98vDdPEA1Bl2HvOMThEktu6FxCnaJcoGbnMTGCK0A8OV6srFA6b3WdlKs7Q0T21
 uZWYQ/1PsMO7Bx6sd79WP1wW3q1xFRdQEjJ1olYsyJIQitnPyvrZmzZBHxCKiUvxSTBGal0k=
X-Gm-Gg: ASbGncvZ/iQBVRU81cxH+vwaK889BmZnNK7Jque1X0NxsJbKn7e8Bq/ia5SO6tVgGri
 U7m39GkZ+POTWk3OzXrVAcb7gJFB7j9vBs0Ni1sa8L1JMX5TnEmG3zAUkY985jP8KIBwGGd0U43
 R64eAaxOMI71kUAPSp4QWu8pMwoEdtLVxWtmunQ+Cb7h5b20w5xnUd7EditSPgaouOlBYJUWm36
 /b/htV4Fa0hjKpeMREx++197zpOY3g0GLfpMEJLRtjkCh93ynRlyrcI+Xo2VuwxvLLzd/Z4zo6S
 FEyfEfgvZ7Gdh3avFGTr7ZpKrlXwimPYC5v+/AiTjWkxuclfZ2VpvUgTJD7iDkrAn3SA0n9Bqq7
 HN6a89pGLsgF7sm4Z94Cc9vs=
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-297c03ab66fmr8998825ad.12.1762462258825; 
 Thu, 06 Nov 2025 12:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvzjLUzykk5qQIPuXJFJNx8GRGolqHLiDIkvgFyorR08sPq55A5GPVLpAmt2J6lNFfm5dTPg==
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id
 d9443c01a7336-297c03ab66fmr8998525ad.12.1762462258295; 
 Thu, 06 Nov 2025 12:50:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:10 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
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
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=3661;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ct57iacDgaVMt56kXqWeRFWhEb4Wd5ogLzmDMijMvgs=;
 b=e/BqN8mgOUhXSRNrqolpteNBwbBYXhn8yVoEJAQU24ywpExTCCdo4JQAZUDl39nnqVHMjSSmi
 nEk4WIRahHqCtdIsmGZFSZMBLI7z2vBtWPVJCebVLHYsPrMPQg5VWaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX5Ja/ZudWYZPf
 kwKol5OryA8CIzZpNR2yKwcwlcX6rGPxdVGsGgzA97t+xbotVDcrDVE8w0GmolYqEwyBlu3zrYI
 H1FZi/6QZSOao1ZeKwpbqFGAMxHu57itNNwgKI3XZA/RiIc5wEjoauPfU67YvnluLTTtyh04DEB
 Wr8UxK4/bLdcotbMNls4BT7EJ5uI7THFreK+4cvMZmgGKTJjld4WQWVt1AHDc6OGXFJtCra8iPE
 RrdTd7z+97DkiZ7Y+M9HJxpIxwhQ0xp1eC2XE3XEXoDzxGUnG8D27WXCS9k1UiyMnwQM3b4+fbd
 V5adwc1NBhF8rjv7yYhc34kHMZo+/A5uEz5rJExYaOZJj13Tj1MNB2hmYkc/IENSYFywRb5Hpgw
 sQRZ8wrFBdUz1cLeTnyPRoK0ImAexg==
X-Proofpoint-ORIG-GUID: UMitHGQ-Rqj6KV_B8oxuHubAwsysGxWJ
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690d0a33 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UMitHGQ-Rqj6KV_B8oxuHubAwsysGxWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for qcs615 chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index efb753ba1747..500587ea9ae4 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -647,6 +647,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
 			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};
+
+		pil_gpu_mem: pil-gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1826,6 +1831,114 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x90000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0x0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&gpucc GX_GDSC>;
+
+			qcom,gmu = <&rgmu>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-845000000 {
+					opp-hz = /bits/ 64 <845000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+					opp-peak-kBps = <7050000>;
+				};
+
+				opp-745000000 {
+					opp-hz = /bits/ 64 <745000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+					opp-peak-kBps = <6075000>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5287500>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <3975000>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3000000>;
+				};
+
+				opp-290000000 {
+					opp-hz = /bits/ 64 <290000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1762500>;
+				};
+			};
+		};
+
+		rgmu: rgmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg-names = "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "smmu_vote";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob",
+					  "gmu";
+
+			operating-points-v2 = <&rgmu_opp_table>;
+
+			rgmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,qcs615-gpucc";
 			reg = <0 0x05090000 0 0x9000>;

-- 
2.51.0

