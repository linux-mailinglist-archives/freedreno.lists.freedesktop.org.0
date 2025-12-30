Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1BCE9AA9
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 13:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952D10E8D9;
	Tue, 30 Dec 2025 12:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl4P3y3I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4rwomHv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00F710E8D9
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU5RR8Q898837
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=; b=dl4P3y3IpZiPrazE
 b1D31Q2RUYl4c/3P84/+48wx1jcO5u8fDRX+v7xIkZgu/uDwfyIrrTjCH7HdhtgB
 KZHrAoBIYyvX4/A5zTcmEJyli+cpEVVditFuXSjkIUHNZXtZS3sWxqUCu1n9HR9G
 1aA1o8xm6C20+3Vu0/lC1JLzQvCj5V6/A6iM1D3P5sTPMFyJ5uPXg/8+bUOnzSea
 YxBzO7mLGy6YI5FvLdpgux6YQaG010EXGbnS0oXKc6Fc6FIJ9Ep+3iaQTaEWhJJ0
 QecX4oZ5XTcofZlj5buLNBwVeyjSKwHk16wbm1C0W3Fx6XhQDF0TaG+r/uwhu6+e
 k4Hxzg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky0x4h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2a0c495fc7aso143532435ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098050; x=1767702850;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=;
 b=F4rwomHvQDvP10/+Ut3SoVHTq2siEuYFR0/VYBWuhoRkvSFQ4qkgTVENo4MVceFBuI
 m8dwQnZ+NZque7tbrVck02HNpqjzmQFqxdwQ3FCCssU9hg/32n0AgKKR9Qd58ipJtsr/
 nLaHR67ltk8gyEDeReA2jLE9A12OXY897Vj5bot0NjIJJyt0cc8sCuRpSpEMwG+5Pavq
 3FMtt9gsD4VGv0TUXiFKhVPayfcTTbGCoTY1Vqpro8z+7nECd11E2IC42liv1N+smkDu
 2Qe2HkYRYPcbE4c0QMsKUv66frUT/SqtqN8Jh3ZX5kVt+lkge++Uxhqu6rjnzkCOA2CQ
 SYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098050; x=1767702850;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LTjCczxQCkLPK+WbOPH5ASioIp3bZ0Vd00BaHxdQa/M=;
 b=EXaW3DNEnE9Sw1QmhAtXKl92XnZYNzjXTH6xwVYeMglDB+Db7/7ZhW0OOmWHtBvv4M
 PEHyvbNNhbAiL1xQ1JTPI0KjqnXbY6rWf335BsjtEkwdo3T9fnNDP3aDtDH9yQtqt/A4
 gBXhOO73MmiMTxt5ijzEnocEYTVun7+Alt8RczC5W0h83YRzNUKrQ1BAjxRCylMdqsX2
 WidoM5nE1iZSA01pBhG6dM+spaG1eo6zzQ1B8xeHbiBOByfSxDqPaPQpR6QzNyMOtDF1
 Q77P0s81hUBHUaSiQAW5Oj+UZ8YyAT0JR9q1ftylMTuj021eBT9nzO7tsHImtvJqH7fm
 6sng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwHDppPwFnNEFP6//nbiGJFxun23rWqxQ8iPi34nJUioMMVr0qcNHH0POtTUqMmxc8kCE+8B+qjkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFTqr6taWRjgzmEs3FxbD0hTlsXFPaGHMVMwg2vOe4uemSmq7i
 JuMnwdDAUSC/mfG7AMv5Lp8gZc+/9yuokG+kRtXLhbfs+Us7CKm8mubvmmx2j2/inknJap1xdeg
 FyE6N/OJOB2lYMPliorl/PwAeWAF4h3qPsYVnTARur6+bE4TNqoAlDVPw2bn6a7bsOBflsVA=
X-Gm-Gg: AY/fxX41JJocWnHCzyZs/ODZcP9lzrL+oNhIINN/7oK9ow6yhbDveySOb6eRTvjJfcv
 hEaI8InNZ3mo8zZs66DBWM9QDsQyFQMsLTD9ynTAtYHEzj6SsNHu+OGLFzMwlOQ0/dyAne9RIag
 Ra3F/4gWbYmbaJXb+staHz9WyI82uGBsRt8IwstOEHpwSLPvMKYIpZlySdglymi+gKEVMZY9/tF
 f3xSA61hZNpbvyaCyITbWzt0IZ1yGAp1adYBnb4gVEJgxPo/e2k1sBmk3IfIhPntGGI1UjBsCMI
 1e4ld83Z9LvTb6eycILR3mRpjl+4re7cxJqF63UBDVom9LR7C5H6iVrs3sa1IkUccA119i07bvF
 RV9KDoDxEhOEHZ/wSKkCmC58SGccJNpZ3KQ==
X-Received: by 2002:a17:902:e5c7:b0:2a0:be5d:d53d with SMTP id
 d9443c01a7336-2a2f2a361c2mr339112405ad.53.1767098050447; 
 Tue, 30 Dec 2025 04:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqfJN2cDWF92584+Re8lu9EnvElmXUCIzeEsW46GW7kzA49cBbpur4men3WRQAZBhkjEfkVA==
X-Received: by 2002:a17:902:e5c7:b0:2a0:be5d:d53d with SMTP id
 d9443c01a7336-2a2f2a361c2mr339112065ad.53.1767098049898; 
 Tue, 30 Dec 2025 04:34:09 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:09 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:25 +0530
Subject: [PATCH v9 1/4] arm64: dts: qcom: lemans: Add gpu and gmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-1-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=4549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eEQqZKz8fM0bUMyLjCoySTD/m7pD/4v7DydcvS7v3q8=;
 b=WiGGQTgFluvR4nj9kEstt4ZKHjjLbE6J8pu112pVqDNsz05hGsahiVDcCNU7McHwUCLpiWZqR
 knS9NiEK8UcA5Ewm/ABSM3e8JYXk73MyF/U58CRNXU5gZ4T52qaDdSD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX6RS7+agQyiDK
 eOgF/O+exB7qaJQTm+eUw/5/bA+qTaEIIuGuEA1x+MqBGnPO0/eoHxqwKi5NS66iBqHFyRYvZzS
 k0cU/xG2VLdv+zl/S1m9teXcoeXeyDe0clBi/EH4w1mE7IjqEFyI1Kab1zmVqj2R2TEJfn8+kbe
 YlK0RKTj7SDZ5IHliKQsb2rzDnDf2iGylBeGoe1ytBvFtt2j80VdBdS4nBCN1jtoonygGIrFjPU
 WNVKu/cM75tckvqfTiPMVqV2MI4hC+VMRGXJsrIKFDFoS05wEbLLRs3MzY0/c3Bg47c3Qbaj6VI
 uVp2IKE+T3LrM+rRjHDIEdEgCcJPSkD0eAJJuzhRL50dURVtTYw6cwJHO45moTQmg2gAQsLfEt8
 iVx01aVZWY5Fxwv5HTebmtiyJGWxK9vN/1n9bC0U3SWHlsVdstpozu1R3h0tul4yIk5U2rQbty7
 VCEiK6nvfu7WwvChKiA==
X-Proofpoint-ORIG-GUID: nEcn4xG7iloELuD6lkLzs01QAolRvxp8
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953c6c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nEcn4xG7iloELuD6lkLzs01QAolRvxp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300113
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

Add gpu and gmu nodes for Lemans chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..883f9e0ab45c 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1098,6 +1098,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x3000>;
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
@@ -4135,6 +4147,113 @@ tcsr: syscon@1fc0000 {
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
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.51.0

