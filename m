Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177BCEB952
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AD610E9A0;
	Wed, 31 Dec 2025 08:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="haay+MYn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+MVum5A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD43110E9A1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV62Mct2050665
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=; b=haay+MYnSmV8dwpB
 PHqAPXM7Us7ml1+DivxtIfO7Ne00LE4tcZDef/9pa9aJ5oV4eKg/6xuRp9TpEtAc
 8zwFjwv3LJKArl6xz79vEl7buSBw6tUIA7DFUSgVgIvOFJAleixor0UMgzckQolL
 GQCGL+Rpo7fM1RLIetRjl9Ge6UmdYLh3bNgBNCtvqDYHQ2CfW93oivnpX+yElmlp
 vkdjkbJMXUHNatp97ExNgoDkE0oaQ4D2jflFKHPGoil3jRTOPC5dsOi21d/cwtFA
 CQInU1QiODyWiyB+16FkxPL8RJ1oeG9w3fidBZKgrLorG9cyjCvT7m/fd5UE63MF
 clD8aQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74897u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c37b8dc4fso22465658a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170787; x=1767775587;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
 b=g+MVum5A6wTRHRZeEFCgYi2KOb9jJjOWXmkqS9vD3R3eFiTNVZAvYjW278UbTnXbXz
 u56zJURzk1oQ37e5KpR7BR1LxIif3HTd95jtIVQm2clSi7vOIfaZYG7hrUj/c/VunbbH
 FpD93PKRBPeOnGnpQMMysgMHUQsDDzIFNDoZggSVLysqcqdfQ1LX5v8ihoKY2xFM+4UD
 7ipOgNnrNcgGADdaeRXPfBNG4C3dzaVOXV0mz1ZKkuU0rvJGV7FYyky3pFklSP3pPZ+3
 I97hzdkmWFpZ0l7+EgzbrrVIkuPHKdAlT+rdUlfBHq6YbRMPhaJheYe09QsQKoH0zYRw
 bp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170787; x=1767775587;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
 b=l9PjCcT0duZnnBSRAz7iVYLpOIqMNDBVYgRP1/0+GWV3UjeMaof2G0RiRqIz//JnbB
 kJRf6KuFsOzPXDFa/2DaR3IG4Xj9zWrrCPyHcnKC3gYphQtlHz5rFJGcK2W3vP8fwF2Z
 xz8b6Kmmcu3sDYwDuSvhEIA6isAyE8JWY9kqsC2JFRpQivpx1aCQWkyWr3WwpYSvxaol
 5YbyvzVUAjSJ5oE+wXPImg802fJ8KIdR1yQSrPZUpHyst/Yf44FUup3J13I8hsTjpEak
 20XuqOqrT1pXwJmajXQquCZG7DVIGwqVFbgJFPK8hB4zf/Kfjth8SP5503pOchhhevoG
 AhPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPMx97cai5jNyEMIY89Dyro+Bt02aYDu8zulNsVKA9dj2J2Vl8lGB+A2CtmJHUFEf5Yxz33K+ZuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCiByARPjGJpPAzJSyoOyaPLO7xRCOZ4VrA85aT7I/4+umg+H7
 GSwc3IpS5bjJSp6e7IvY5TBdA2Af4oa5y9GYVHscZWzoDWaszpwR9BbsayhFYEFA7S0xcfqq4OK
 cG4DDjKFaEU9XAuCuz0A3ffzYQFiTcL6CWX6OuHqGsNXcI+OlD2Uj7FlpRwh5mRFWFV9fGUc=
X-Gm-Gg: AY/fxX40TCiIJYQOymMO43OwetZCdXC5sQ6TwS64CujD6AF+h54Qmqyx2onL0/2W0G/
 ese54O/RqPOOQPih9Z+6mPKXMdbNujnk7xZvWeSmfpXo1BtNSwi+bZwWTVrZPcDXqHMtxXYGyNN
 CsWUWn+UBRcRtY/ZWoBC9TGRVfZuEcEFTosgwcp8UxhqCDBgsHTyIeKV7iilnm03pk4P56SgUNF
 j2Zh86o23l7YwEAo23MC/XfQPOyd2DQNftV6lxR6TK2VdBK+WYYy7MtSKAtgsTpalEj+GhnZg3c
 uUzOUbF+VpUTNgPF76wAuFN+t6DMgQzKoW9iUFK1pGaQTMp13L+HRekgwpofocV0S2Xe9o7R0gW
 iLCUBBt9dxMta76xOm9ETla4EmubwSqhDKw==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id
 adf61e73a8af0-376ab2df3afmr30047380637.69.1767170786695; 
 Wed, 31 Dec 2025 00:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu/EZ3oLGF1NZl2KMcyUSJhtDfGW2zPYLbNsW86lvNNZKwJtYXyj3PHGDeUbAhfuXdkhwrRA==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id
 adf61e73a8af0-376ab2df3afmr30047367637.69.1767170786180; 
 Wed, 31 Dec 2025 00:46:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:27 +0530
Subject: [PATCH v6 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-6-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=3729;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lPrDGRXmTexYyR40CdhB6xnI9xlISq01WTO4Z8VvcR0=;
 b=MuisKXRywC9OCQqc/3Lssr80BMzgApYmNNGxqrut6L/gjG2mHNSAWdmmrHRC7wg6/d2LxvVNs
 JrFpwmHft6sACbQ0ZH7ZZcuqyYlIXpEfINFz7uZ52+1D0lwQuA4eRe7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: gAbxp5wUc2pxbA24hsVeQTkA9hxSNoxB
X-Proofpoint-GUID: gAbxp5wUc2pxbA24hsVeQTkA9hxSNoxB
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6954e2e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX718tNYx4RlPS
 ab4hk7PRchg3kBBVRLjDHyOxGfLdwd9Hjn1ozJNLQ4Gbc+Jubk8BuS8lqOO4AO/SrRY9v9FX2BF
 jKqZggPy8nqqiVlEGZx5qxgqt2cVGUfLte1TKa5MOlpawF3WcJ4K7fJzmv+TZKjbcBnHDiGH88I
 2k23ehLp/g1GdAWbcgsS/sutJhrcJEGrBuIx8Gr3yhjDAfcDIWy0/OANAfSEJX6e+zOstKIQfA/
 DdUOtBTNfdbjTka24LeDJoA4Gsned0kgFtAcOwPhZAlgTpq8xNtOoQWDsD3gjDEXPE+LiHaB+Ge
 bskX9KETjmJVEpbAcYSbRxgwVtmgEi5Xt9vaCKiKAscuF4tApjxf9J2rm0LLG5akDMImSfklfsF
 afXfT4EWIQnh9WDt7pn7hNpAckilpa4DnIC+63JgK5tJauOxxtoPb0RSECfGT1iyv6pXhWhbgcr
 9gdo7C73GK60X6eZAbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d..6880630e6735 100644
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
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
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

