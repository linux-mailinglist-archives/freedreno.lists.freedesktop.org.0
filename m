Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41701B5158D
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 13:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A36610E8ED;
	Wed, 10 Sep 2025 11:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WF5z1w/i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0631410E8ED
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFLBi032162
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=WF5z1w/imCQRNDQV
 2zRa8DS5c2KZfi1kyN94/IxTDYN+cV4qP0SE8/EqgupTZv89TB35c7CCNwVPy/La
 2DU4vfWz8ijebHnw2wExRXvpsDDKhfUWJh8Hb9BTpweQf4h2BxBS44HVxDqJDWkx
 rxBOyFmPh8C/YoKIv8iR1qX0A8ZhMhtmXGeNFApHYPg+nVzESXwETtDCtOTWiOJx
 rUhFc0mfMOqHRc6U3DO2qxA0ccGRI3C2STLYSuh5Nn+yvxPypKrDUed6eEaDqFN7
 tUqrPLwB/MJdVIRcG6z2a3KI26sIcx0uPT+TWFw+NAPNdPX4FSuQGSyZxgjjWe94
 cFeJGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3h7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4f87c691a7so13097258a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503597; x=1758108397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
 b=jpT08qDA2M/JQk/hosJMRJD7dSTq6BhpjcKsCzd2Siewiix7fkLSC+Yy2tyTbJsHLr
 QTkhjsxNm+F0rK0EQMHWvSJ6i7oGE7iO02ZcX8unEFiFN3XBhE5Bt/kcqpLA+xWI4v8R
 At35sFoRhIB8rNKpJRczbHvFNhuionguTdO/DCJDcp//GXxN+uPX3KlyBvUz/aWheoGX
 2nvzT2fcZKjev6f6M28rMLyin1lliP3TCXPcPuKrhqoZm1Jv8hzAnRq1me8/97pm9JkH
 WD1UcukYdbgJSqA1Ia8Cg8qypkNLidBagyjYskaPEMrKJltt+/karIsGm7zKmXhKS5U+
 jr9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS4ssyXmtESShfYULlUPLTEtRE6d6YEbejhHQz7x/7OK15olNV+2rnG2REdUNsfnIfnaURlJs+iXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmNzVREs2lGELfl0hIlFcIHMnKbBPZCZ+KVyAd0HGSPgfMnNA0
 RD2BKCrhVcVSmbvWdnSBKIA9d4QNqR0st4PXiRX7GGntwfOq36PmeewyL0xIN3KVEgmWrS6Tz0q
 /moyklKoa0Md4DVu05X5GlQYZgokQ6NQsCwlOtVX2dT5EujNfIPFZMXiJlJDQ75zufgyHXeA=
X-Gm-Gg: ASbGncvBBYHfyz1meBr9zxID2vBvFsyCC7uoW6KWIZ3fpOJsdkD1uK+auRAkyguB15O
 4MWY1c6j1xX0y/g9g1Jgcz9qlxdgiQvSiCmTpr9T7OqhU4bkZ4bNeta3zu+1H5kpAXiPLD0sJtL
 VAEvncJKBuTp9mI+oXMgNgSPa3Ew70Y4mCYLazrzWEnnl4G3VAQmcAw961wQLP6PgsO9FPIrBVf
 FDM2uSgkK3kHGM6spjeIhbPxmIdwhUBnWdO0NzxS6I2uN+2Nzmb5BtAgTuoawMYEV1oK9WhggMO
 VMD3mddQ8/KPV0Clrf7sd1yf4kbKsZa44Zu8W+Wwh0dFpxbFyBzejA9Idqhjd0SI
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id
 adf61e73a8af0-2533e94d135mr23613225637.12.1757503596577; 
 Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu8n38cqjdfKt9/1s/M/MeQK58nlWTbkHvgUjuxlUJFIC4snQmD4oj/oPkqGgfcrDAzAET9g==
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id
 adf61e73a8af0-2533e94d135mr23613180637.12.1757503596105; 
 Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:25 +0530
Subject: [PATCH v6 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-5-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=JAVAIdqmrnue5/ks+VzoXSDwPNFYkasv5RLMnK3+t3s4vjQQ4iplYXmNDUzqGDU8F4giYFc6Z
 NdvaJx8nFTYCc26y9qynH/pfcd6GTfKURUIPJewQ3LieME0ZjgXcWcW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3v7K+TSykano
 Zq/rkKe810qtRg2z6ph+l4Q2Ppl4Ia5IPwqQKBKANP1/ocsMeZhel1Qtw3cfyHJcv2Gftl4Qmfy
 APoTrfYslOsL8J1RUx+7loTqaOuANyWItMY3v04y9n5FL3i9l8imhwJ7Kshu2D6Z20ppvhD7em6
 fILOJyPDwsQ+0cSRmAnW53SdUKcoemcHaqkYNHK0wmxkh0SE6Sk3uz9EKK4jtXsxJeUJ/SPEPiz
 loTR6M2FV5iFwz76s6niVAMNC65RDO2QQDBKNaVPreXJJBswJUWgx2PJiq6zFgZxkSRoJyQdxzh
 zg9QZ+nGIWyUJBflEhtwJYHn9oWhdELAFX4SK0zROU90lFGH2e0VcwxijzxngOQ1r5nnc2ehYB3
 eHVhYQB3
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c1606d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 8xth6OY6jxQZcefhA0YKHYCmYvBTLzTk
X-Proofpoint-ORIG-GUID: 8xth6OY6jxQZcefhA0YKHYCmYvBTLzTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

