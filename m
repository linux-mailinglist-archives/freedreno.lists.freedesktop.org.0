Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF5B49A2E
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2E10E5C9;
	Mon,  8 Sep 2025 19:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgqyV29G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C61210E5C5
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588G5HUq012802
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=lgqyV29GjHtaOz98
 j31pX7LQOhqqQdK99hk8E+D3dUQ17/bU4U7DBBkykSmXIw0G717diPeebyFLTNUJ
 2Ees1UDXmGjwxpOJtGAWiznZmo0tel3Q7IJtSm8sGVi8eIfVet+rCH4o0bIgMlTo
 QqJaRYlL9vXSAdpRRCUIC1a/HE2e6QOze40i+lLfuxpMf3haMnRxKf2iPLf+fo5A
 kCy+DaMGf1HG+U+ZbGm3XAgcqxsflSH3XzRX5+yrpgw8gQjBvwgvdAInzq88wsp+
 4D17U+CPc6f4K0FGktx3sdGIveuEvn+KrRFSz5cD4RInW1udeKZdWbmyKRbeDaip
 uQbwXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5wc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b521995d498so2395976a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360440; x=1757965240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
 b=B3WhN+puZyaeeuhidqo1qeynlVEXARwk+vzXZ+ilgWk/SMJdheK3EAgPgyOTz/1ER8
 Jo421DUupZzyUlNBIdzuFUbhm2bp+TcKJUP/8+bk/gpofVc9wJZohGKnKAbnMp4cLOta
 dwJLi84hlj+w5ABJj5VlqOU5hy+kUe5gB1g4L/6iwNxt7Vqq1l42ANMhJD0XWqPIetaE
 E1yJRX9bHsx8O2oaAelXfELv2e8VmJWZD2Wox+5tpuDrgSkmMKzdtE1UQFhoZ2TjrC23
 1gHw+ASe31rdENdFOdYIKVY9Ir6YEpsNpj1ou2lxSZZlDytD+2cyCqi5xbhkPXg1BP8M
 i1aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxZH4etDIMy77c0ilzFnax1z+LiFRQdkw8jDeShn48CirvPNt7MCySIoRhwZXvAbv27hRJXbHv2AA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsvIq79mNjICLZCesHdVHHEZdIvg5SRm3RAzAZOsR3myWZiacb
 Rx7JYcpvMo3vdKZ5pU1dIPdLVtheFJ1qa7ZUB52eqPenuCMMTDAuGiLlZj+ioDgW3ahWgRBawoU
 91yNZpR82/Z86QemgKW4DqDDSWVrkdRqE42yW+FYa8kCUa/w3Vc+8b/X2PyK6/K6tEFzZwYs=
X-Gm-Gg: ASbGncscPhcePPqLxnfM0A9Hx/+vYdZKkvayxSQyeFH/YOGbmobKgWAOJOCMAf8IOFZ
 jdONtZGL95U5bQQsuPR+nulL3eyTaaKNGoHV08pYAtppUqmaMeM2pTgcwNqoNzpXUw+yWzij6Is
 ld9pi6oC8uTbUwg/AZPwbmfUnsFkYCGsCznxy5hE16TtXE5WXuwV1mNGq6HhWSRxBJGGmdJJHup
 Rl+6VooAKCpCDQFf9p9Ji+gLg2DfzoEJtdCsRuxk3wooQYRuOB9fBVCTnopTMnGzh+mdQKsU5aV
 hSwQGPPRsttqy5ZJpZQbclNrYdLIKvlpIP3jRahHMCuGj3Ng1g0k6ggBZS9CiGtb
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id
 d9443c01a7336-2516c895cc2mr111481575ad.2.1757360439751; 
 Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7MS/PGj46/9DijhTLrv8zPpQ7yn0ZAGwHCLanL16Jyq5ouQQYBZXugxHzfIk1x6pg9d969w==
X-Received: by 2002:a17:903:2ac5:b0:24e:3cf2:2450 with SMTP id
 d9443c01a7336-2516c895cc2mr111481185ad.2.1757360439166; 
 Mon, 08 Sep 2025 12:40:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:40 +0530
Subject: [PATCH v5 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-5-761fa0a876bf@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=z27gs7lVGN1/JHmpToK7GI94Hpg3Rn7lWyfFRiOlLXXusxcWd+QIBI1E1Jw96DmemJ6yUs8id
 ewGQDr/ctEYBnUuG7WfVeLnHEXtf5X+Ajb+uW1zDO4nwuX68ThPjkkS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: hSChFrff8nHfWg_M1CelMtkXJBRvkX5o
X-Proofpoint-GUID: hSChFrff8nHfWg_M1CelMtkXJBRvkX5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0uHU/Foz9Zkx
 Ju5307S9A0GhTIrOLSDc4Vi4x96MsYiB/SezWbqWd/8yJ4VwzVzrbb4NMNkhchBF73VMwijHH4d
 r6XZixNk0XnVhXApqy/6Y8chqMq3jVFBY4aGLGxF9HxtR8apdl4DwexIPX0tj/EKWqv3OBxStBO
 2+X5UbRz4XNehBZ4BQCAh4l5MZo4pzxwFqRECu+D8is6VjrHuVcGwKykNrof+1IdOHNuyWt2QiP
 XchYfoFhxLM/YBLRk7q5eS0Fa+WIF7khv1lBnnxtCMO5QZrvrsWhMKjaWFzio23uaTsTPSr/z+h
 +/pn6sizqmLFOcLnD2ai0kcXhBkY6UtF3m+2onywnJL401Fm3qBVz5kK6emFLKcxbvyVkRjxbBL
 Lr7mXr2n
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf3138 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
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
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1

