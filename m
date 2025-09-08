Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EADB49A27
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541F10E5B4;
	Mon,  8 Sep 2025 19:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WihGC+Lr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783B10E04A
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GhmD7013584
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BzYEXvdjJHcyIwrownt6Vs9jxJ6nvcy33OfYj3o/6ps=; b=WihGC+LrizXzkal6
 7JzKhriqvi133pO1HnV+4qoVIfhjFZ3E7Xb4UQdjd4UWQTxSnWSqmDruydL79L80
 gv3maxYGZBwYdGAaVH+HZaSqXOChOmyOimqbTvhWItLBHzVJJn0pBit/ekcg8Ela
 MNPdLbQWBR89wQGOTF+HagYlxH8sUMtfzxszM+vGH13z1nS5lvitKcQW2Rd+n0fl
 AhWhaj8GvmOkUwe9RTRqwpBHvq7JDksCpPjEC1vwq4S6F7Ev0KRqeX/nP5jb07DN
 iB9idJ1FDZWaP1JyzFLw+CEi2Z2UAPFbZYEgsJbCtCnHH5H14mKye7YBjiZtW/jU
 41kDAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5wat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581953b8so53695415ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360427; x=1757965227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzYEXvdjJHcyIwrownt6Vs9jxJ6nvcy33OfYj3o/6ps=;
 b=JWpPDTSfC9dp8iRTJIu95ZelVQd+DgLsvH5/23Zd3TYBHWmQ+P+XIFeqShaE6b/9db
 BbtnFrnOcs5W2GCgNZ9F4yuuztiLWmu/wrhDvsZpGKrf0QC4ry5us+zqJkDWD5li4WLG
 py3WJzyAYEfPBHv2bxozKkXNUa6v8BFCuHI6haMiPrDpzwdlGGv0LVmLCSZTvUJ0F4YR
 CRzii3T5jKlD1j+lq0g6TJWTpS6E0IVpNcmIq9Lwi600/pSu1sGvqXOtFud8Q3Bp36G5
 TPEjtgaGVRVbJehqGN+LiAwwkt1niVUV+WwQhj7UNaUVcNFdA20egJHtgy7vQ5rdnv5q
 wkJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzC0uFcwU9lmw8XEVafyHpN3PP2ez8ZMQ3yjpFtjiINRLjrwHyGfszKbAhlo2MdRlKO+aEFUWcm5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqvz8KQ8ZbQP3aP7Wj6bUf1mkDBJvPdNsGF8SxfAw0URSdnswa
 AP8qrZBKJePeCJ8djdg4YKfPV5ycUcrkG0VcBALKMd5s57eolgAB2wonHssrb8sYxcAkKfbBgPR
 3YVYWu9tT3XIbidh/K1R1pJyHaFSpz/Z94bS0U2Y/TLe/pvatIVj7pGovBIkVlddbh44Nazg=
X-Gm-Gg: ASbGnct609UlLTIwF+joQGAU/UN6IUJPmMfvaJUbpowZe4+dn9xYSnqdehDJ3PyjlGM
 jA02pveG++MrLrEUZmHB6PomtbaiiaWirTuwTo3aptseNMEkl8vnM2+dqf0vFN4BeHXHrwI0MXZ
 eSkKL2eCObhxYePViskFI7Xu4CVxEHIFp29tsr/IQUVyAxY1XgCQaGOVU1PVzmCZ5dWwPCQ9v1m
 VcB3Dw2W00YVv+YgIY/o6dMZyakz+JjGbRYADG61bPkSaEx+0JNuutHekLUN6n5+I4DuLwaurvs
 GG7dJNXW9VbjDtSXi9UFEVt4JAQNyM27wHaNA1FzwJqQA2rCfEEPdB9f3bL369wi
X-Received: by 2002:a17:903:a86:b0:240:48f4:40f7 with SMTP id
 d9443c01a7336-251734f2f64mr110307695ad.39.1757360426740; 
 Mon, 08 Sep 2025 12:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt+2g6aVsxbb+YMdB/kcZgcJmHNy7QrMgRUWz/B2tQqKW0XbprvTQHJgS+j3uyAhM9x2B3YQ==
X-Received: by 2002:a17:903:a86:b0:240:48f4:40f7 with SMTP id
 d9443c01a7336-251734f2f64mr110307225ad.39.1757360426235; 
 Mon, 08 Sep 2025 12:40:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:38 +0530
Subject: [PATCH v5 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
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
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=4549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6zGrMCJTSPdrvTNao0mk6NK8QkI3OkgPqzaJ2kGlCJs=;
 b=88LYd1g5CwP/izlPMWR4r+amOExVQ8ER+AAEVv5jlcstqu+tke91LY1EWXaeToCK+tEI3BzvA
 dFgtVlz3MOQCUPXzbQYbYQ4u8HrEanbqLBkuA18u6EkdLbWWyZsu5AB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: EPNd2ockEtGJ5qIS6Xn_432D1Kw7iZOt
X-Proofpoint-GUID: EPNd2ockEtGJ5qIS6Xn_432D1Kw7iZOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+EeFPEDooqd7
 8f3TZATXjtW+JSxCBRb23aSqzl240gtHxuM+DLGyhvwQ0MhMaQZBm0gfb++GCGi00ns/d1Pjtnf
 0IS+FCST+vy9pPTn6WoKNzfUe67AGmvcOtVj8FUI6w+8cSp/hjetyID2a/WLwIgMnjv0kxTu6Sz
 WKWuHr0p3wSDDifFumHX4k9CXCZ/aKfxlek8uWZcvc/cwynmwqfH6rgEIi9gEixhpBt12qnuq8j
 fak2JYccRqVqd/z1kubpoNJ5Pn9a+zht0eIjtMJWEjG7MdhX4lwVpv7NGa4/FLaWBWjeqe532fn
 e67j8XBXAWu8eHWQOGy5wrZ9QAeS5eEb7kjpkzU0hJq1+O5M/5CZny2X4WtbYRcpqP72uN+jl4y
 qcAe8x5U
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf312c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..52c2533383920fdf34dc1eba11e5ec01209f4e8a 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x2410>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
@@ -4093,6 +4105,113 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-663.0", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0xc00>,
+				 <&adreno_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
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
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.50.1

