Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9D0B30267
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 20:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F67510E177;
	Thu, 21 Aug 2025 18:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGjBJFln";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9310E38D
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:33 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9LGa010875
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tPLB0lOSl90qjv87azKGiAHlMSsu88zpljXIRtVwbjQ=; b=YGjBJFlnVQhEEWkZ
 S+x2kx4nwHhRT8q5cP88FHWG8ygji6d7he5zz8QGXxnbsIBzskIKIvEy62VEHS7T
 Px4PFnxxix9YYQ70WgDGB0xn7TNVyVybToDo1JtXe1L0alellQ5VRy8PZ2hJnE5N
 SbtVbDEIiSGgI0uCTj3iEuZkun7EjR+FNo8vKzaz5SiB1DzyGAWp4VtlVfGBKJs3
 npIofUQKQB2CzcjAUHkcJWEN4S64O9iWkbaZ8nVv/bMT+xsyQiBN+vqL9UyK8b7G
 jTKaypFeriZJawT4FLmXLVrqXztM3vWq9CLyPd9qyqmoZB3MLyLViHKSUWUzKvjF
 ElskNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8cb9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e364afb44so1095378b3a.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802591; x=1756407391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPLB0lOSl90qjv87azKGiAHlMSsu88zpljXIRtVwbjQ=;
 b=UjSSmb62NcMXQdGrzyJTkYbDtSIh4KzRTxcoUdw2vJr/GUvp7H0eK+FGujgRSNVjUf
 zqjdtjceyd1P0nDYNlZ6IoXwZ2eoDa2DGVXVa6hRgbGfI3PSmHkgPVm8GyX5LJw4qilf
 dS7tfZb3UNyriOjZ4g6hkcIpln7QXBESk1uIIUckH56r5C4Qi5km/jZrcwVB6t4WmbiG
 3IEDbQecDHpHUqboy9CXH4IMdp42VGmVTQZXzDlBjg2l7QF9pRhff/2cpbh71TcuFA2D
 FhHNnsSZRV/pRk3+t1wj47VU2uA7eKb/IqmjIeEHA/a4nCi8qY1vmmbUBNxNP7cwaUQg
 /I2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYWLuYHSGZLo7S25cKQS8qO+EQ5xmUJEJM0ldYUwJcWDwvDHr7Y02P6063VbijDjkpCZSVDxlo1vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPDdQYlB0xPqbx5Iv18AIYsNaaaCmdfQ0i3A8pz0kZLiYVur+s
 uJ7Yq+BR7IlNJQUDWevJ1pu/lhMT8F5RG/4FXvP4nGaUv7rHcfp/z7EgUAcmprKlgt/jCkI5Ucf
 KC+gRRboDdg6KQIimyeb7OV9wGMndkQExy6TVuMgYlQHGFCE5yvaGS9o4YfvFmTzPQHeTN7/TgX
 z+3e0=
X-Gm-Gg: ASbGncseZGx1U9Ci0u2zvkiOZZL/fgpQM9BmHIaZc9s/8TmAjBMDwaG4sz/csRO/D+X
 EXcYrCABGMum+Wj7hDXBByA/GU+xlA7PA00vM+WkIXedL1ynZYlqglDVRnpzF5cQwl9droQzfKQ
 5gk4QxyM/f1hvV4IoWjymSwXVztWioqEVFfVp5GSSLh+jeZhOf/eXibq+oIoRVbQEvFQEgqmyo1
 L0es2FDyN1woP7FKzm/qzeSKxArBcR5OAO+wD3hK6x/quXP2g4Q9Jk/4mf8gAC4InXC3kbLorp4
 Aqzo+vTq4W/MPMK4bBIrEigAybMgmyhY5YzQOToFDKj88oRhF8XKWDx2WRnVrs0Y
X-Received: by 2002:a05:6a20:2585:b0:243:78a:82a3 with SMTP id
 adf61e73a8af0-24340e4a4edmr270000637.60.1755802591171; 
 Thu, 21 Aug 2025 11:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgXXMidYmQXFpqBRDLcsODNjXVwWerFYBzO2zoS70dDoedtPxh2rZs542+/5DAWroEPgZTFQ==
X-Received: by 2002:a05:6a20:2585:b0:243:78a:82a3 with SMTP id
 adf61e73a8af0-24340e4a4edmr269952637.60.1755802590729; 
 Thu, 21 Aug 2025 11:56:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:28 +0530
Subject: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
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
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=4497;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nI41liweZfTMu604YixzPD6RJqaIWEkGUI9JOPsmvDw=;
 b=Dc8lSBNBKRNBYdzfgozV0uhBRvQ64bZE53SgZopfgFk3sLXSxqDcg92mzm4x+EOOQij2IrdA5
 4/s0j2HHGsEAVbEtHg9bAJD3doK7ClVrT0Z3RgIm94q2mgxETjjI0PE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX1A53dcNvTk54
 CGO86Vrds8dXFohNMczLfVqKEzW4JE9ZFib6QCgzt0UYUkcQfzwuahLod0Bm4+sCdcC+lb9VhC2
 Ue+LEmk2BLgB5wg2l1UxbNU9Vu5OY9nmdrZE93xAvyZPnqse9rcqoKdGfSiqrCzuNTEiSftPWc6
 5Z4KCF0rjryV2QYVAnbRxteudKMFtEl+yUABixp3VJIaIPW1srGDwY5cyr6ZEOC/8AdHwYphBZA
 DN8WTZEOCd/MYvnfn/u1TaBt3iUJP4n35338sc1rEUsbhOLk12icjU2yhLdV6ddgfSTPWLJRRQl
 Sd5rYeeKDYjL8xFRU7jQdUg3jrQg+FCJ/qTYYBHj2n910jUg0qp1D/9OeagSSZJ+Jyp9WkF/g+S
 /S32xm/b3hBk02Rk9lbuMSIPzN7pGw==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a76be0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ol_3AkvvSFiqtAIwO3dp06SeMbXw2hKX
X-Proofpoint-ORIG-GUID: Ol_3AkvvSFiqtAIwO3dp06SeMbXw2hKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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

Add gpu and gmu nodes for sa8775p chipset. As of now all
SKUs have the same GPU fmax, so there is no requirement of
speed bin support.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
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
@@ -4093,6 +4105,110 @@ tcsr: syscon@1fc0000 {
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
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
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

