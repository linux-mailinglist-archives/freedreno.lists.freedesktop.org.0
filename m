Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2ECDEE66
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CEA11AF81;
	Fri, 26 Dec 2025 18:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXUWgU2J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGj//lmt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600EE112919
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8beFK594485
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=; b=fXUWgU2JJCcwiRqc
 T7eQ7CzOk1aO7EoPZ9uIHsuhvC/HH4Ltk8CHP97CtBdo52nqWH+5SpDoKNXZzueh
 bf5kUpfDRY3abMVHY/tBTxwcCZqzCBq6EjpgGSwCPd333InSAuBHh7QuSDF/benO
 B5VE1bx/1vgYMNEOAkFRRxzmm7r8P8yq6mna9yN9L3CcqZyF9x44O3+Kgiv5ZYmF
 Qc2BWQSSamforomW0uwtwnwi+//gxpwTV2qsyHfDcQFbHYsIzF6k1w0baN253vLV
 SftUqgNVuNmNh4Qsp3TiaNCresh/Gl8yGj2VItNsyxex18ih/IGLRCq6qzQkMKBa
 eRcVpw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9j1d9pck-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34a9bb41009so11768242a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773844; x=1767378644;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
 b=eGj//lmtYHtoQuurUtXFa7fyjX6yzsgqzW5Y3t79GLBUDVF3BzaVHlCxa1pK/tFBsz
 Xww4J2ya9UdW/0lLzfKNt9OXf7Tc/XaKVJijcNCK7dRVaU+VTJ1UrNPn7K7cC1sOv+hu
 okEW++M8UY4A/5BRuGQXXfKNb4CJFgLOghTcwr1Hn9xtO6CWF65pz4W7kAlk19VIR2jh
 uk+iYiVGMCnW7OQXyIraKTCYuQHEMNAN1eu75MkacZgc7P0rMVNodZ0pRDfvEqlNkpjd
 LawgthS4hO+6JdVYekoBAfxkpumpcePl/6uSVcmMlBp8dr8idPpX26j2rxZEe9UGRAlx
 lc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773844; x=1767378644;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
 b=Q91uPg008WQbquPC3lvB90d1XxFrxYuR8s60X1dLVmylGOV/+M/GZLk7I3qodBxhjG
 EDXkcXKQGGfRG4TVM6zDjucfxgvRzS5/AheZmpmsyAX2x1h5VQOxwvpvJ6yfJs5zOip2
 MNXndUjPBo9Ubxze9uQXICiN2TCJC02UDOY9s078QS6bRfdDNVwLR7PYR1oHmb2mRR8p
 Eo0frTkLQz3Z1mE7bZlLZj5CAbXrLyi3YXLrw40Sux0YUEKu7kVMi9y1qnE5Jje0tnrF
 e7zKS5SkLQKIw3CwauOc6ufSniAX61D0i9Jj62SqfFgIEZAsX5qbt/qjY4NL5Ca/pHFN
 MBLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNIyW9g3c6jGLfC2O0Ml/Qfxq1RNuzCZHdxPPdbZs/bP03CRDNzacviNg5pKyvT1D3HwVO1Sd1GTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyycK2PVbqJhEqQLeY31W3T6VXdWytWQtY1cfAO92sdsmmPX3CF
 7HDgCN2Kj15mXQSmFDf7bZ5raOwgJIi1vWPPDIc6Ax4fV35ek0dpJK96Uu2N2Y1Pbw4/5H8hJQN
 XmyIoV9JKNmB005CLHXOua4FHt7uYpDyqUoKi4rrJkoIhWwtXJDQ1yq8Vs3eqGQnh7pvL1C8=
X-Gm-Gg: AY/fxX7b3jrLQkQII4W7vb3KAQz/xzC2fLupcG2ouzJKL7+KSbywqUVo88bQe83CmIy
 XGyh6INvS5838ooVYbiMaIOWJGFw8QlhRtp2YGV4a2KgPOwyzXAZcwAfrIreqBfWjZeyh/bMFIt
 Nga4qnA9gE6dM8KlpM90N1Yjd85TqWA29BAlVdqPnD7Fco1OHKLmeu1inWKzX81OCOs3kuwxXjf
 bzJK0T6wm5TeiP8fpoR7gcuojBZ3WDAqAqHfXcvu4+XpY3Cw3qk08sgxiFzpYaCbG+KHDSSUy+A
 8BkyXXox4iAneynOBJz0mri7Hco2Z6tZV8HRj1VSUdrslc1z8Dk7bKOSJwJGxIr9wEILNYaeBsj
 emxL/JkpB+r1NEPErwIGGVE4t8SwbWSdTIw==
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id
 98e67ed59e1d1-34e92139d60mr20093584a91.10.1766773844251; 
 Fri, 26 Dec 2025 10:30:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsISMnhPRANRV8HGLXZG9P12WKnd6txaK1ZJfD8PdYetiEIEZ2uKy0+fbOWtVju1/nWgVE+w==
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id
 98e67ed59e1d1-34e92139d60mr20093543a91.10.1766773843749; 
 Fri, 26 Dec 2025 10:30:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:39 +0530
Subject: [PATCH v5 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=3724;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/Ic4dCF9kYuINmZwU/AYUbdQteygU/T9WSrlkoT+d5w=;
 b=Q0bKa3g7tTottDF1rl8WZKZP3QKMRcDiKitHVNeE4RofYvkg1E7VGFCt6h4RgZ9tqfFfG2ljC
 CsUZfS7k1mhBsjxpPNO8JcBzeLnrYifehFu1H39ZVFn3+WIoofM1sjC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: mXntHBhZVvioa6Xib6ImOx2cMqivRDyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX+hynSKJJyX4v
 XlCLsgJfBeuydYnj6o8ZQaG4CSqYLwaWdMluNHsTy/CxnzPQAjD9/hd/RzJhGPJ9TEoRISQM0nN
 2jcsQphSksS+qM+ZKB8FxPi+B1yG6pux0bMRvq2zAamDAoDUM7yBhjlrT9PC8JTeKBVFBSrftxo
 IVJGe9iw2xF8uG+7jjaZrcCQpGqhJlrVAgCh+ko3l3Lmb5PwnnOwhnF8t33uPi9iqJyenbG60zq
 5RULXBemrbhA4uERZ4qPXDAi2953tp6AZNQXuCqVWzhFzq5WC3BdVKk/r2YstsuuNT448JflsyI
 tlIqLtjNbvQne8Bt0K6rLWej2eomfuyMsdwwNmkjqX37uyFBUpUUZnI0Q6vIJDq2UoYpuIxW8UO
 w/Jex7bn8rqmwrFoy+V6fREmLKY2Dl2bWBlka9OYdDrYTh6WreJR3JmZ2DVnXnwfayTBZAK2/El
 ufD/OxXCdYeCwY6hnAw==
X-Proofpoint-GUID: mXntHBhZVvioa6Xib6ImOx2cMqivRDyU
X-Authority-Analysis: v=2.4 cv=Z5zh3XRA c=1 sm=1 tr=0 ts=694ed455 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=j4o8-IGns93TBVLKZIsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173
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

