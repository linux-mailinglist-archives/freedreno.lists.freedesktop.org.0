Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C854DCE9AC8
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 13:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C1110E8E1;
	Tue, 30 Dec 2025 12:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpEsUYm0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0pJNWPc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD410E8E1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU5RR8T898837
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=; b=dpEsUYm0oR1J1bmf
 zXsXUpkVO9/8ZB8FHrGcZK3S5HDAaHGlYFuNx3DJkI2v4fbAjVJO2L2eSxl0dfKP
 RfVHiRBqP/Y7wUoACzLB0XvB+9V2v61zkGayQ2yPeff+Yr4EdhanrWxySGVyyzq9
 2O98wOM1UNTYbBRkwDFahZH9xpybeWOVih8yBQ0Kzexgj22R43KGZCdtriZYpBg3
 BDaPiBuEnxmCttR1wu04dTsIHS45Ere7Zz/frmNLZW48PFmWIgRRgROOGpj8jyAe
 gJnejGK7YRAdYET69ohDCjzjX8o7K5WADU8PdC5uh/4dEbV5oT1vYDNpaKNV+4qe
 C2/CpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky0x5s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a377e15716so76669215ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098069; x=1767702869;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
 b=j0pJNWPcmeNqXM8SFn64DyJ13CuLLDXyweMlKFmfNTEZlC7L86mS/rR6Drq8EIGjhu
 FNEBXrdCf1z/XHTcRDYgJFgrnAU+naVW9UZcOJzW/YiORFIgmxIJmLEfSWXFZ/NzBe4D
 cModJZi0uEFWJCaqQGo3CGh4EV83QOTTuAwsFPGawPTJR1eGvGS6KD2mP076LfLUTuzL
 X+V8jC8oH01mIuou6+SoQ2AMG4gNFGioPs3HPBEXISf2/BBemkIUN5WbUpTZ9Ib07fWz
 fLpuDw5MlhfVJlr2WzyAB+z8tMTUx2HL23Io7u7V4n/7ul2jQ0xGck+ekx875MAMZgv8
 ME/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098069; x=1767702869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
 b=CSTGe4Ea4yf2Qw4lvDDOd9L5bBJH1KSBO0jopbkpAdWxnzGPsoNtwHmFhNGJJzFxuU
 TtFxH///47w5EdasAjfNqR1YfvK8+eFWQodTNrlInf2X2CLl2B3ScAlh7e7k1dYrz6c1
 E/77Dh451+16vZOCsfqW7NsYP1w1+dpjt4k3xzxyvXTBJNGSPxJWn+LSF4OmNz/E2rBy
 EPODSewZ9ZMw3H3QnIvF2Q6fF1UVdziFepnFJss1+pgGsIl91aHDGOBuaP04Y8JUf4sc
 lFsZMOdyAlZQSUkSK9J6STXbOtSmlh/Td7i6Nve1DVJ/z4nIWnmH6V3X05IFAhIWaftE
 6zEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVs7t73gYFrFSU6AjYLINWn5ppNhs1Xq6MeBsgIAkLI1BWHG7g23ABN/R9w5wLT8+sMV7E3SLzKFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4gAawlUVVylkWP3c0KatUakLmjvxfq2rD1Pm/oXUuDOQvlINp
 NKuh44AjvPRuCZQrvh5zxhXEzgAu8DH2p55SJmczm5mEUt8ZdgezT3zj/9vY7FQEB1JIVCjmlGn
 sg1Ig6LZ8xC71LRST0oQVMelEiGGwTEjOZZCelMygEDHTBJ5xRKvzNDBsYssyzaffZWCRKZs=
X-Gm-Gg: AY/fxX7E3nROA0QBQn/dzatSlRZmKCUJqF5XBMcJgyRNnZiYpLeFoqQsKV8EAX7yRur
 HDYvLIrI7vkAHPRNGSU6R46/U08oCfxprEbmUVpdlXoscThRRZ9ufQqEJoF14Hkxuf3QxVD8o+o
 qndD7coYu2q5u50EnPhsi5t0QWhBAMLBGCM/yiASsCY9xscD0CeZCbwEJUVJB6JCS5NI5/XR64x
 WXB21kpgFKRDo4g+76+5QOriaPP5UUYOjkG1fAEgaOtDa52/k7g4SEgyGt2rD2wi/w5Plruopsw
 yAHxvGAx8t2O1/pvGU70zPNzQHOptHKpv3ADUBCgJXDdTdA7QYrmT4xz1XWRths7s3B+0alMCKY
 IyexL4RbgotUYEJnPVR39EF6mbPnhEPT/KA==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id
 d9443c01a7336-2a2f222b5d3mr347420405ad.19.1767098069477; 
 Tue, 30 Dec 2025 04:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOj+Jt7FWW/tx6wdupg4tsy4BPTQK2YMy5OILP4nJWqDLIJNYeaaBFj8U9AoZfQNJ1CYnfzg==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id
 d9443c01a7336-2a2f222b5d3mr347420015ad.19.1767098068884; 
 Tue, 30 Dec 2025 04:34:28 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:28 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:28 +0530
Subject: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=823;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JtBAApNY0JeyhPIQIegtD9qcHVqaABy0l3e+bF7RSVU=;
 b=coZRt5MPySgLfD644OsvQcRrvI/RAD6aN9OJ8pn7yvtm2GmqPTvY734oMDaaw1BsYl3rteTjF
 HiMwmWv/QRqBmtC/Qnn3PLJ9dU5st1Al6NxXmXvVM9yGHzbD49H0JBq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX7gGVplh62pVS
 N+4hzS1HzYSezpZgYcEv+LM2qWbTQuxMdKCbRA3qQv55iCVTRuBcBjQyyXLAx1MPIT+KaaqVtWL
 gVXraaKmu7PFK/FOH1/yiaNZmkyQEmZHUZwdt0wJuNxkAXUkWr6HETP+r2Gro8eYsUylMCx0mrI
 gqcFMDv6ULULrgm0OInEJzPboCDIpbYEiYoDap+yTsQpoqT87mqqj6bSvcct57CxXZJPIs8i+8x
 MhKFBJdOYJHEyIunrzR6AugrVT2eTLJKJcqJUpGpRlhVJ43SoMDHJQItiThrK1lbHaBMLYcnBRJ
 caiRDfgNeLNAURC60vusalsQhjePNPRTBqjUp97U1OrQlcw8qep79ile9NDKR6Cg1exapY1JxYs
 HWJ6KcFyCve93EisrkQg9w+Rw9tQrKeYHMiV/dKDU6ISOQVtCqrhSP79qKq3wTNr1V4t0AfGD2U
 hK69WuXJbXoQodP2FRA==
X-Proofpoint-ORIG-GUID: e37qap1PslqyaFY_s3RNaHeSDTPRgjxX
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953c6d6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: e37qap1PslqyaFY_s3RNaHeSDTPRgjxX
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

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce2..8fb7d1fc6d56 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0

