Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F065CC3D685
	for <lists+freedreno@lfdr.de>; Thu, 06 Nov 2025 21:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6B10E9CC;
	Thu,  6 Nov 2025 20:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5afhiqQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yy3lsni3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEF610E9D4
 for <freedreno@lists.freedesktop.org>; Thu,  6 Nov 2025 20:50:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6BlCmc4131391
 for <freedreno@lists.freedesktop.org>; Thu, 6 Nov 2025 20:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=; b=a5afhiqQiCsQ8dfr
 Mp8Y0fH7NKI8RRysFaLS8x1IMAJ/DnP1PJsuxRxk8Z8vFcpHyO66aMkD8zpv1I+g
 cywA51ht9ioWKBeetftcVui+txV9onEwFoNmLIqJzaRv5JyFoOo9OqNK1EYd90Gd
 xo39Mlp2XObBhp1aaBOAHexJ6mt8acpMnHnAG3kQClRZsrag45v9lX9YRC23MPFd
 15RCEUgMbSpoQoNhMB+/bwREyH7b4RrkuXbFOvJ3qYhFeV0CD0LgrYeNVs/QWIgm
 TdU65WFV+H51ibt31fCPjGw8IrTxxpXToHa9OBq2ALClv4iDE4Vt69CIgdHC5gTn
 Cqxnbw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x1mnh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 20:50:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2956a694b47so624675ad.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 12:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462253; x=1763067053;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=;
 b=Yy3lsni3EOXV8+jjGRw88OP/Fi2cpDQz24Za2YoeXX+ggtLkg/SqxBqroD/0RrY1Hi
 vz7x502c3Y4bkKTKAtUBxeMV82cJP1uU+5yS7eO/6g+hlio7UIzvcJlOykafL92kyI40
 /+mWxMOwV/rojjT5kKng9srCgKwF8sbYrJUWFefZ1J9FnsOYO5wG6sBtkHggwmoRCLc5
 FQh+/7MEz3W8W+xTuTZQWlP3sJ7UA856cVrH+uRWDrk92QprHGcEYlsjbnyfU9/VMoqA
 lGcp/1gzVlkDJwycuxo0OgPkSbE7ejfhWTX0C00jxbfyJFbiWKTziVZJFtYsjW8H0HN5
 jb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462253; x=1763067053;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JklyLBd5/oUcZvJnNYponAzGu3rNKVXLQXM2TLGaevg=;
 b=CbbhF+owXkbKFV2zy5rDjxXuX8Hx9EnbFhLrbgTj1o9KIsKHMDY4lw24HAv7DTOoxW
 oLr3+5k6mSnv9dtF6mQp3KG/8WcOItv/sdnHOM8MYV2aOwfkYo+xMEG0oxCK+0xHqMbr
 E05334MxhOp7X5R8V7Nn6vAsF3xkXdFVSINaj9mX4h2e7zBZqs0K78NHBUV0QrV7iYJK
 N9j6aZhDT5vjF3JKuWg+dLqnwi+TTF6MwMZzwaCVATlX949Tj5yZU/qt/mvlvGC1h6Vb
 8/P+O2rTp2/k367io/D/18dA0T+UMsX6RDuP7Bwa8tIWX1mD+L29+ynb7aPZ48B6O6um
 nC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJJbQ7no9JMbUgKw7pOrBsYmLdIhgtZCUtphnW80eQb51eZg7FuZr6EYBUxLwHX0+K/Lop9vCXU6k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybOsuLSkW09gBqSFsiyLalILhepdpE0WZ6JsU5iG9Awb5Q8Dad
 jZAMNQXhdBMEna1n7714ktUrs7Qg3yiEtAMsX+VN6gu4eXrB4wYe7vpq8KqGijIp9QZbwSbqADc
 b8DZyZ0VLpSFvtzkoM+aIutIy7phddJwADKM1/nyKIAWetPu8FhUaeDjK3HQSN9+eWbMohOA=
X-Gm-Gg: ASbGncvkbm6bIVVTM5OTT6UbHyjbcQl6IwQLlGCpC27eV+e/jT2648cAOKQbcx/hvdY
 4nnAnxOFZqjr+AdH/EKgL6S6I4xnCQCT2xH7btSCKX+k/TyT4FiQiubnRF7oVhK2vf9Hu+ZxY04
 lM93C2y/OKeM6EHEaxEnxdeYAc6htdjg63U05+xQQ96dnnV9zmXblgZMj76+r8ImMmGPo6y1Jgs
 OyhgVmVib3hOD5q98j7HOL88PLQ+FZsQrAeU/osyO4GFzllBLli5qSdWs/bo/C7iWi4BdTeooCz
 gTuxOPOBMSWQ+djtx4yPRdJ3Zznke1honHybbSTpc7Qtu0QLYifjK9wTNi45JDHnM3SrTbh0NxE
 DFipzteIHoQLwHk+00AWvYTc=
X-Received: by 2002:a17:902:e786:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-297c0403118mr9270835ad.22.1762462252563; 
 Thu, 06 Nov 2025 12:50:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/5GGH8BRhaWtLEiTr4/i8IAaR0hxcNwnqgPpCZlj8O61OUi6laH3I2DVn0q8vR+8Qikezhw==
X-Received: by 2002:a17:902:e786:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-297c0403118mr9270625ad.22.1762462252069; 
 Thu, 06 Nov 2025 12:50:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:50:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:09 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-4-a2d7c4fbf6e6@oss.qualcomm.com>
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
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=1700;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=jCpex1VaC1U4tzmGxxXkz708+oeE3vay/zj95FdtjfY=;
 b=zZhrunbbfOSaWlJXSQ/bRKMJIZYhHCqaCsTuyaWawpGpxSEo06tbWbI22J7d+o5CvfmfGlLZM
 MgBazqbn/JrA5e/9cbSm2KfOwLUJI57ISZbbPw+jn+9T6JZ1PGou7bf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX5ANllMBfWKLQ
 jpK91J2E0xhZ8i/DUOMTHrE9alk4e71NdITlbTvICbA52Ageo+kGj0gym56Nncq8AJh822MbI4t
 ua4tngGVB4gdXfDx11f/DfetUG2uMpDP5giA1WFbljUM+/7wcNK0ys4yeEcco8EKE0R8rPqE5NQ
 nLftwslk30brILhNPeZSGIz4yYM5lVRjQeLVmuDugH6GE2Wk7yPQJVyDJlsmC1YxAVEZPUDdECJ
 nCieKrRoglpgjH/Sdt/jQX9xUnG3sMVEWH5oNMVeiUOy9YqnzRXc9FrA6dcY2CgFNKwJOAjtLGF
 frpTo6NVEjUURhPYcK+gbR2gsVVqt9vrd2B1xfBKmEuugcFDHt/ykV3G6G8Mjbvnw1AqkSLzVYS
 ewd0LkEgAgFnQUhbBxFGQWXCeP86iQ==
X-Proofpoint-ORIG-GUID: nrJK2JZ7EfhOGRPj6YgKBNHyHd0mhLhN
X-Proofpoint-GUID: nrJK2JZ7EfhOGRPj6YgKBNHyHd0mhLhN
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690d0a2d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
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

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c..efb753ba1747 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1839,6 +1839,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+			power-domains = <&gpucc CX_GDSC>;
+			dma-coherent;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0

