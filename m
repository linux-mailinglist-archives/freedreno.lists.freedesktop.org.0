Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE2FBEB003
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445810ECAF;
	Fri, 17 Oct 2025 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwzT3dgM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEC310ECAD
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:24 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGSDOw022163
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=; b=OwzT3dgMYIBGJkgP
 ryQIdBp+caDt5nzx3XIkgHp1hCfFQwl1kfS3JAr3L3XlVOhkjZStgvJ9I4WFTLq3
 MrUzDzYx5q0Sf26VCE02q+ed5hNPIWeX2nx0XX6lLfLOtbwpK/qRSWxVgmtBfDUF
 rHdLZUxXeqYv2ecVyaMs3WVzaekwkaPc385sL4JLHTUsam8raUD53oF3jCiDjWK1
 hDRlJvSmOUDNyC+ApOgFn36kAODfgt4ZwXIHEhLGUUekGV+Cs4KUSl9KaDSbPWGk
 juAleLdbXDSqd/5mUVJwpxyr46+lwjynr0qcMCODXG4yj5Wl8LTJlJ+1id8oP7ZO
 7Xi4gA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2909daa65f2so25529135ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720963; x=1761325763;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63hqcsOArDpXHsB1zZ0JWMY/vZLAfDdRjASdl3K+gzE=;
 b=ku5K/n3bnls0XTSA/caLKW3OdH+sFbA40kuX5vlzBiLczZ//CXF2kQOWgz5HeesWZB
 WwAX/Dk8rNcEdEbPmswVzvmzx1skdEm1HkCFgoLCfKoku2Vx4xGOZyimb1JV1sBPkiP5
 WUKCvdA+5diG9z8Md6GZHXvH2y5LFE0+t0sigyJOFHKXymYFIi4ZN1oRH/8U3pQzhwsp
 zA2s0UuEGUTxFWzamQUj5LN7GV99gw6x74kz12Pl/7PS+qTPOc5hrOgZs3cuH5mhaa+2
 ZHtsZDvn9nE4M02T5ik/29Idxot0wIuPY9jyfWlR9y4caA0anP+hL+49w5HoKyo8IX8e
 XziQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL1FxDL6Slw7auzoMvRxOAcWsWgk6V7Y27rP9UBFMFxLO92yb2QRq4DjJRQX323CM2OOOTszeDNxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOt2cyXrhwZgfbUyI/VvFFVvmsZSX7sTETpPcCSYJP9QQs/NEa
 TUzt3/SGH8NAwNCgL42ytiStuYYY/E/7H5K39jGdtLT+dbHZ8I7UdOVxMzDh6mKcz7a/6DT/IX3
 Xiob0BVH0pnmtEQjz1Fzp6U7fQjVz214QqMsx6ODqvdcvigdl586esiBzZt8ru40l1XzHbio=
X-Gm-Gg: ASbGncvWClUVOPJTBplPg1tbKR205nWKmXVv+Wogj3ovVzoSCjKUU9Ot7DhfvbWeOCB
 12A8iLTmn2hk65xvR7416RF2e5M86+YRy4lN3lkTutzgEZwOcAJ/4kdJHOrvXSoQv3NMxAHLKEj
 DtkCTdr/6KPIzDPyhfClvZFS73Mhainm5fHKuKLWxWk2NXfYuXmNu/RqpH7ny3uE8H2YT6J6Am+
 lM9bhuq5KKNzfk1FGqdmOLmxzwt3DVqlgYMhZ4yhmh69dDnmdLgZd9k0/JwfOC7RQeCeGoLKtco
 KrnpwSFUjigK58T8sI5dF6QE6qRureBWY5fO6SVKUv2GrQbIfFSR1JNZPJ3fmbHntR7QfSlC7sw
 TmP0iSCiRaR6Uj1BTnAORZPs=
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id
 d9443c01a7336-290c73ffa25mr53353375ad.22.1760720962512; 
 Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB96UCLwEK3jUShTQzV0gUnk3hW5K3A/BrffKQ/0gKgmFt7/wcKFMWQ893/dLgxL2buboOqw==
X-Received: by 2002:a17:903:18a:b0:271:fa2d:534c with SMTP id
 d9443c01a7336-290c73ffa25mr53352965ad.22.1760720962044; 
 Fri, 17 Oct 2025 10:09:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:32 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
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
 Qingqing Zhou <quic_qqzhou@quicinc.com>, Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=1765;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5mbhq+gWS8F7DvY1Msh9SObG+ekXua8QpbuDfASaubg=;
 b=yY3kyUZ+SDP38eprTVxszruPd/GBMnCdvG3qN4R2sdzMWA96T4wUw4IkFr/sYy0WJkwQXVthq
 NP4NVlnlLygBIS75BYf5huDjqCUnykEwnPihfxWH0sC9BJg17NyTa70
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: efNsx08S5pzkOK_11dMUW710EmHYgiwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX0pLxynN6yOsq
 PRwdvA7KqikTgrvWUh3Rg9yBL+211amATk0xdLTP/wY3JeLHKXqM38q642nLgO7GmzsqI6H+n2r
 MCRRPzsW0P7Ntc6G+SgcNYAeXxWAxRMunA3b5buCAoLWlfXRirX2AxOvDzAyc1bYzKXOPvWYYkv
 9lD7I6n+bit8AWk1rX6NoTVBuDS7ToRUYFfCmiR5ktsk4/kj2Enis0wrlR8Le6EQY3j7glTzNOC
 d7K7Ir4s4BsSm7cZl5Mf2FycepWNAosxey0a0GcjjdNkjOblpUT12q4AgJpII2JIoYURipkxTgh
 j7KlvS9RZvC9k2DRNXh5K0yUtAOCZGi9p3kvmH0UimiiIryiiXfF7Phc3P149Lwqw5LRfSyG7Kj
 tJCRDB80YpVOQUCz0O8McSdsNEZ41w==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f27843 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: efNsx08S5pzkOK_11dMUW710EmHYgiwm
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

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0

