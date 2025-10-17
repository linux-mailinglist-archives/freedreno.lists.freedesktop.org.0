Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9CBEB012
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 19:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027B10ECB0;
	Fri, 17 Oct 2025 17:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlVAKuzH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6CD10ECB0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:31 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HG5cqU022338
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=; b=HlVAKuzHh6zu+Egu
 DSqD6lycJX5+oBGVKBDWD9ysgND+vCI1g+jjSUtG0Trybpsyawxps/OhKXviOyVm
 9tO75ZywroCnvPQu3u/Kebe2WZtHw6LkS/nhgdbsiiPz9NVENM1EXuT8+sO/i3Ku
 cyYY+isDWLcSVtSJqhhuPFZvhtdpWp9MNBDZOyAPesAAx1/Yb+fzEkNhH75iKCZY
 JMld9i6FVGzectTOD7OxDU0XUoI3BaisR0/TvFs2xV1bre0fTRIsOksiHYzTBu0/
 uZcrWEns+QY/cjP3q6QgdYCeP128qg1bKd5l0VDaSKzRzZvrHKh2+SXUPul67zrU
 Oanv/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-27ee41e062cso29665905ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720969; x=1761325769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=;
 b=fR6vPIfkGdpMBgzyfOLjh+JAvCY1ISer/1Z2DWVp8bMkOmKd6p/hFjyoaKSp6hAvEt
 Yhnl8OMaBtrVMNTSw5hij51S7tb4chSKVfJTuBDXOs4gi5xDmZA13ZbNu80pA2JwuAiT
 Bd5iBDDgoeNeZ/bvFp+9JIYPKsgDCgd1Tc+FzL4PXvb+ncLTGfj4iqmemzfUotjsmBj3
 sOtN8LqCd9Tft01Xde9yLo2NPaS3XtwPRomstO4peYzyENkiu/Knt7mAGttMf55jGofg
 DY8PSfgPlRClhFJFZ/yFoXBnEg+Pp5BJZWrlMwSPLWS6N6bveQrp+1ltnSX4thz0T8t1
 XrBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWloC6y+uAI92FLIl6xE5wV6xL/HzPMaef+LVmWs4dUyBHvCiHVOXVrQ8Ovr61z0kL3BJlpMsfYYew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTq/7kLyhHdNlbYquVQaMswTREGJqNcZr7yg66y4sH4ckv+A1t
 puqM7KErRz933M/et8tzkNJXK7YD9KK2JlcAMOKG8vqHLs2tIz8zYAmbvtYd9s9K43PdnllIfgn
 eOZ1Ny7qjvnvc9ajI6iC1v7SLu+nVuYFL6IcRZjZlbjqksR9n6saqvkpZQ8ygnehz2mkujh8=
X-Gm-Gg: ASbGncud5JHBc8p85RlUzgEZkO/HlanPmcJhG3czcQWwFdfDzb/XILor9F3bzvkcEoE
 XtXVF7qbTjKjQcyRl0VKAkqDkzmoIU6dowZgCyUvfGlmTrZJslp3klSixe6CVhVc+bTbJ0xTFle
 fVcWcmCrE/An7XY8Brp6Ng92+l8sKwprsXllBnBO+DJd94pD7KqHP3Wbpfx25I+PDQKCQ5eiX2t
 yGcN9GOQzzpM9rb7VxFhCiopUeWQGbgshKCdWJ3Nues0exGKdndvNow5Y2vaXGm8NiJodZ89u5A
 9g9LfjydbDlOeWAOZaY/vQCEc1kH3JrEVxlbV1/NOU1CnrUFQenwPtqdKd49wnm+3Ltk//r5Unv
 eYpW0OGsIMpiq4UmKGj4s1/Y=
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id
 d9443c01a7336-290cb17c05fmr56313365ad.42.1760720968769; 
 Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHA1cKYoK5EhzqViS61RGZd6u0Dhx9U4B3Qz8Ha/inD8zekpvuLlC6BeCF7KMumjqYTzq3w==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id
 d9443c01a7336-290cb17c05fmr56312755ad.42.1760720968090; 
 Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:33 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=pYXZ8JyrCel0n/Z58j1178sF3I/9eN/SDHbJiB8QyuU=;
 b=cd5A5lv+d5mtTnZWr7466DoX8m11khu+CGe/Vzv5l+k/D49mAQ3av+THiJdckItV2Rx4iIEWL
 6AMy/VgCXXHAq9LXNnYVs3uZaOSZo+oOIZe7P42si7eYNgLZg0DYVTs
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Au2bpCvoCxRRHF-n2rrXTLfOZXmJbxxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXyg5SH3DrsKbs
 l0Ybm2MtwfHwCzNzXl1Ng/IExTktKxBCwIgXJO38pSrF0CGw51Bxwu/JZkWrGorHf1LIFbuiuOX
 CvvDFKaM0KQkepJB214xYdqe+ZbB+HcyJOelNNh+ylkmBG8qBzpie7XPoOAGfnUmMfKACnpAk68
 b81IN7gGo5ijewJxw8lJdIP9eC2G3q5wgGuWYDh7OlEUVM2/NA7EulAIvn5ytNfW6JirOgiaX3t
 e5dRPmcm19af11mpH5UN5TvjyPcgMDbgAazARbfwweO4JZzpM/jrq/n7IZmji12B493INxaXeqh
 QCw56K3W63U+7pjPhtkjpeF/LJVKj+V/rVXpc8Hy9z2aVm2EKTbPCvWovFiXj/2+PFkXcURYdDF
 WV2OA2dT00u3SR4rh4dW5TycB8YdOQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f2784a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Au2bpCvoCxRRHF-n2rrXTLfOZXmJbxxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index e62b062c543657b6fd8f9aba7ad595855d8134d6..8181f63e4d6838b1d198972199756271707e6e49 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -508,6 +508,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
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
@@ -1687,6 +1692,113 @@ data-pins {
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
+			power-domains = <&rpmhpd RPMHPD_CX>;
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
+					<&gpucc GX_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx", "gx", "vdd_cx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob", "gmu";
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

