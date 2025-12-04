Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A1CA3CA1
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4710E97F;
	Thu,  4 Dec 2025 13:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNceVEqM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL44LpAf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE710E980
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:59 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4CwYF81436063
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=; b=LNceVEqMWdgQd8we
 UYftBz0UMbuvslXrESAVtRCXr5kA1ZAErHkLjrNYNbg1Osein7n5TTRnqYsfUqfx
 7igfa6geIhGqNPXy2KutSgW7LlJQkQ3aIPRTpFgQRK+1689xfw4jofwl9bkvRFEG
 geGXL1tYM2cG3okq4T+YRbPZlZwYVf1GAH6h65//CaL1tsmcr3kTP8BfcEtO2iUY
 QYl7ZtSVMlu36COPpylQbRvePKLrNwRm79QHjUDFOUnoO+ub77w03cXs0W2YLhg/
 eZu6L5jzSvl3sp5ePUpXaQJKqXbaFOQ+zkxuTqdj13F+ftKf7WJIUHuVZIneWWjT
 IdNamA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auascr23d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-343823be748so902084a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854577; x=1765459377;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
 b=WL44LpAfZKilUO2SYdmVsKNhkdZfo5DofQGGbr112xzv7QApmC0UAIBzrYsuR6Idej
 /Cv6baUqNKPHauLdsaRqCMulj7HL1QNxlQ49ljOwoDq4bRrzwQrj6a8HW84VmoOM2ePD
 rWppg56z01n7dNph4r2IsqDwWh44CfpI7eeohBahGSQs01p+VfEzxf914VOg9Fz5aCh+
 gyud28k6tDcKwKMabb8igHJSutS/BcnCor/WOIjIVhtPuv7ICAYVImZz4h8CNEn10NuC
 pT2mxy2ky28dX1EbktEORW4BLsNLS6OxJwzPsNV4XLPAeQkIJZq8mXPLpLmQwxafsycs
 VN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854577; x=1765459377;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
 b=bG+f8m8HoAzbtlnj2CfVdA9Qt7WyJrKJJxFVaZ8JUPUh2uKKUJf6qzH4sCuoYtIzcP
 EjXgiLBW+wV45IPJE26LRR7rTRQykR5Wohs7+XbqhrtW1H+SGh6Psw9Nz15jzOZaUjB6
 8lXA6FXVbjn+xuDNA+e2dwXRR3j8moKaZT99DSbe0zB6usjE5I8ahNwvYCASMadmWnbK
 UVNJwf9/qQexOFU6Ve8XgjYpRnYrpCCH7K5SK0wGgnezaoptudAD5DYf7Jmm2igBu3WX
 96+torI5OqQORguytjqvt1QCNNwrYMH1bCcEryEvwyGiL+nbcsSi3qVf+E6yS4zrxvLx
 yqKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbzSiQs7bBa7Rre/l2I+C0BIbmhkbJx3AfAJ04NlC65Avn5Uzvw54Oxwvu9k9CNecUUIohiwwQpu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzup3PN/SsnvHsjGXkUal5MsP+j8AOQGSmpRM+B71iRMdgvjCbv
 SqrgZBjBWyerExwtL8yUn8CItnecviq+ysEMfNBGNzOsbVQr2WACuYk9eEcs3G5GGGY9kx7VfrQ
 ENi2r93/QTc4niI6K3yrBuwUImNtU+674rCzEnVFlJrJrMP75CpOjrjKvBpFS0sdwL2K/WIQ=
X-Gm-Gg: ASbGncuAmVYeXhBLiPuIE8PXNsEXkvOp9ZqDC0TqO9OM9I6iH/XC5wtsLMVfhD9vNmr
 62GVguUd1KlliN2qpKVjWaBsgDUq8KD8vYuM8R9R94Ye5BHlelhRFnmO5x5vzMljLN2fg1C1fU8
 faqoDgHJTd4KcnYdhBko42ag84kDQBF0pTgDQl6Mi1oXvQNHyQl0UzJPvG0ajoG7bz2Z/hioV7G
 J6TJTBtg4J+h8qmavw4w0fXQitTQHWiMzRkfMlnW0PswEsMf6zA6Gng/wZ6l/iZxHwcHahP81CE
 sR7l1Z2/jhYBByBD7mlRRZmpgWoS1kBo/UDEs6PdQ/yNLGLatt/Mup4nZmYYDxrvOwp+y9dpou9
 vyNJxkesbYEe1BgwCs03qKmQPX7Tc7B1bMw==
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-34947dbdb27mr3128648a91.15.1764854577098; 
 Thu, 04 Dec 2025 05:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcpCbjmSwssoTfYUpxyXaMGpsyHUOSMYz8k1GAE2HmcLSOMIemcOqA+wI2mgQM9qIYfbIFXg==
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-34947dbdb27mr3128618a91.15.1764854576598; 
 Thu, 04 Dec 2025 05:22:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:58 +0530
Subject: [PATCH v4 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=3724;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/Ic4dCF9kYuINmZwU/AYUbdQteygU/T9WSrlkoT+d5w=;
 b=qNk4tAwrnemxEuK5xd/GlGi+oYz+dXGri6Ad/Wph42i1wZHfJwjPdz9TvJvDoSxLhIIpH2bZj
 eEhW9mtyKG7Ci9yHdGZJjQj4KVdmlJW+9/uLNnasWAkIq5a7NaFjVnv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: FNhNDuIk4wIOo727U0F6dNEnAKcV8jzb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX5bG3uvlg3tLJ
 xXcrEtuSoM5Iy6kZ2NImG75d5L8KtCH2PLAz5RuGoKsKkKcdn3iv01SZEWm080DmBizYy4igdaW
 KZjqzQJvYFOl8smdQTdzo8Cc35p9JZQT07WjEtBELvInXWYM2MqXdCwdf4aD0vT+CgH9JCrVAIT
 1Gk6mhPCsTMXKofCrbnvwjSZgMDBpewoDe1rhiagBEdcloHMzF5MkPhzbGe8GvBD2t+j2H6nwWT
 CKaulIQq8bLrTlxRkd8xvtnhJrKOPm+KmsXRXpsIivu5cDEq/eQ+8ebIfYaI2q6476L5c3msxUu
 kAgep3js2d8p2kQ6eLuR34Kat5p1YD3Qvlm5Xx/80xErhE2dhjG419nFy0LuKrtzhWtt+Eqft9/
 8LPjYgQnGn3awI+vnheOKLeoObdIvQ==
X-Proofpoint-ORIG-GUID: FNhNDuIk4wIOo727U0F6dNEnAKcV8jzb
X-Authority-Analysis: v=2.4 cv=b9q/I9Gx c=1 sm=1 tr=0 ts=69318b32 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=j4o8-IGns93TBVLKZIsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d70133bf82928e9e0c3da9653a5ee..effaff88df83d5e6a0aab45a2732a00cae11e83e 100644
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
@@ -1826,6 +1831,111 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
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
+			qcom,gmu = <&gmu>;
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
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
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
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
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

