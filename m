Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0ECCEB94A
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60F710E995;
	Wed, 31 Dec 2025 08:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF+YKv56";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/bT/7bs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6B910E99E
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV78Y7J2733361
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=; b=pF+YKv56ovktUjvj
 PlUNGOK64hhPbgzgKXiF5urL0QklA8wFFLw9Y5pRN75aa+nRIafbKlYoObaDjWaI
 57tpbOZCuLL7nrYY5PYj0m/wANvLrxFX21s9kEGEsYAqz2WvlCVw5PgRR3RRksGx
 TIs9biLwcCKlwln5PM1mHatDuNq27QHSrBG2H6IdGKfUiODyegqcPHvUlypeHEln
 whYfvZlFKU7yzn5hpRDSv8DhmUqcdcRLmiTAdC8X2flHeXFOgJSzzBnCwMDW6jsI
 QmbWrvchACityEqTAAyG/9+uVDbJ4C/0YVpAIrYmJxDsX4116waHUd3LekiNn20W
 AHqc6w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6ag5wb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7dd05696910so15889233b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170780; x=1767775580;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
 b=Z/bT/7bs1nvouXmTvyEgvq2+PgaG0+PlMWpFsxgd3O2Jhxjg9KslI8SRfpBzlUbNEJ
 KUaFHJncjfZPW/bI4wZTGq+N7xqSm3nJu/9CN1u06gze1RwVPIzIA0xcW1uof5+dYF55
 a6z8SqSgQyDhhin6GMVkA1kNlETsYTarpmOWud3r+/AGo7FjDRTMINcQhAynio5stun0
 cHGltE8swQVhAMXkZbn8HMZ4SzWJ59AloUVFW9BhAoo7XFLpETueLF3ZbVHvdgnIOKGV
 XnATa0117WHNNlsXacrEERF+Y0p7uIswsO0JkOJ+PF/49jq5+t2zXJ6dCrswxf/Gyhdv
 0pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170780; x=1767775580;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
 b=pOX4wTM6wrIYrAd4NDbByFFqd2GT1b5gMiHyOfPC9PhjnEsWpNIdBcq/pEccE4Jv25
 6gH9hxt8NjofXwDvx6P2Q+wnaJ/lRQY7rDwaaFhvdkyJXjFnhq6oodSn4cP7kt3BHBDy
 qTkAs8G/pgKBbp3gd8Azvu4B2857IiZz5ni5Lr6iQJvjQMNlQqpGrxBJO8dQZFB6ncbs
 teT4+/WopKg+9SXAdmn2ClhAg8vFi9WGbHIAi6Gk2rkVwq3XUGs2aj38NqoZfjlNDYPP
 PDTA+ZD2dPXaWKfh0aIaZZHLyl0BahM57PeU+VyJpa7ii6TdacpCGgKG/5IPBewaXsts
 U+Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzB7n0r/RAl33pC4S2xJxWkc7Txh1K3gpG7XAfWpljS0lkffPXU4UHKhykpc46EhDZF/Hgafx/ZD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqN07nuJdhiqbyoad5yYBTZyEtGogZ0/DBhCWM+GHHjACiwxEh
 fdtqMzD+sLaa4on11TzTuOFHbihHYRMCq7I+xv+W38tMGTqO1T0ITWRgCvXxPKfbXTATTI6G58Z
 5hRNYlU6i+TngwO3vS9DAH/tPRngvx9YMZlAfXumnijAj6wt3Vx8spK0fVkXpSOzU5wrioX8=
X-Gm-Gg: AY/fxX7zyBDVzWJqzyJqfNclPFMbikLZWQHVqu93RZPzAX5aeg0hz+CSNRHxa3M5CxK
 ACX8Ir+wkmrxf+FSytdgOHu4TiyBnbU4WxThwtwCpG4DHQhBEXEPM+m5Xa6sLr8lE3UbyoBxutd
 LIuqrtvjLi4JPqP+ZOBgMi65v0zUe/E+ZZ+NWQZBwi1AirQkj8Hm1mgsFc5SzSZSJyB0v4VJS59
 +6bSdeMFUGkeDwrq7rsyaY8u0ABd6HRvIw2dH6KsF88Y5s+3Per41IEGHE6q/xGb2u7+Hg3ZM/C
 tcHRW1Fr59nqnNePuvA7JFBL4tFnwhvsRe00NVxR8DHHCDsmGGpCrsBLT9/CxMsUVyUxnVthEwZ
 KbKyOfsCY8oyGMLn1NLhSHlG02+ss3M2N5A==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-376a7eed348mr34371657637.11.1767170779921; 
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4+U2IkeBbX1/HcdXdKHMw6H4Izq1KXCINrxp8/XdIyrK9NSakGnoGoG6MHo680vuefgtD9A==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-376a7eed348mr34371636637.11.1767170779449; 
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:19 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:26 +0530
Subject: [PATCH v6 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-5-da87debf6883@oss.qualcomm.com>
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
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1827;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yR8XbebGeiFEFUR19ke6y8GDTrPRoDL3ArbsouLBA+c=;
 b=gVetoMqRIqng8C/NpS/bZq3/41+ll+ihCsglRNgtftrruiHgsQEU8Ud2tMG8XCMpraLa4gaQp
 j/6cnOmAKzLCZ0aEKk/XzX6/CpW0DEzrPav/DrV8M3Lif69rf1ryTy/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: v9BsWKoNKJr-SVDqSN1eqjgePkUtujS3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX6Wrnktovfykw
 ahYnWSkhnuNbFhj4axePFQTtPxgaFIUsSHg5N7nRceGfbJhjVwF7Fo+UFKJX35jN9Xmby9dLimg
 OvSJ2TlWGt5/iDfWzfTxsn+WsqbE/XKcc9OD443hTTQNpTVbnfZtWd7SOWpapWxLZHAxK0ypCrh
 Ja/yrTbJkozbBXzCJr2cGDo/PabSgeitMNYWN53iDU1kTMipnkpbwge6eeTLWCvXqmCUxH785/K
 A9INQvLHOBqKf9CLT93IEeCCIv9De05tpcWKKu+rLs/ZmKdxvoUaG/atRmg+dQl83pQbU7a6YPt
 faiUR7W26AAJ8Ocrh2W/YkfnjqT+3I5v2H4excqctYU2n46nJ0YpZitozGHkun4uuoR5KI1mqyZ
 C4wSw4keIigO6ZHdpfVRfBRGZ9FjQqG2TqfOn2CBnwimzwfMtnexjaTYjjQhCWlqWtszPfu5d9W
 wyiwW4vhTxSjnJKIdZA==
X-Proofpoint-GUID: v9BsWKoNKJr-SVDqSN1eqjgePkUtujS3
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954e2dd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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

Add the Adreno GPU SMMU node for Talos chipset.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c..743c840e496d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1839,6 +1839,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x050a0000 0x0 0x40000>;
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

