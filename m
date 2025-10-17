Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE39BEB018
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 19:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6045D10EC9E;
	Fri, 17 Oct 2025 17:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1t8nGVS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D102010EC9E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HH9Otg009599
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=; b=d1t8nGVSWhSBFPCj
 hhBDCnzqB9XG/t0Tt8rd66ySW+9QrkvAkwOWrqxy97X9OVzoBgwZ+EAvHPuVC897
 W34o4aLhzzdJ1hfa7OTndabL+cWSS05hwH8A+QyWPpniKILFcx8bb+iOTPXhAEtq
 sSJpKX8ygIeDtBAXO7IefKZMUJnjEZaYC9q2WA4VpoA2beM1jO8VRhDK3mvLJBQ4
 wXMBUQjoyBQjvt/SwZZ5jVy4qmgM1FbnFLtj0xtgSAFtqNftj3O5e+ay5NQPtCY4
 7/8jAaQtLh8/6vRMo+nfFQuayMIwvUqllnEEJGCoa9w+g655ETtI092E3ziHqZw4
 mBIVAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0ccx9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-28973df6a90so22086755ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720974; x=1761325774;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=;
 b=wO5r24jYqkY2zaFPKwvtau6QfYaa+qbxU4apdS2mQuQsAdvUvfV3A8/00ftC0LjY8E
 6tg7RXmqoNZ3QfelMktmRQ0vlrbNo9twwDWxNhfaJQjDiO3zwY+6MWHU0a/OjKC6B+bx
 YzHwQ7vEhe8N7ArlH96bFpv3byTcwsHzealMtACbmQHUItD0mJXjj3Pd8YgJXpHHxcpp
 fgFvSej5EVlFoIj+vAIe6mQZ7xnE/EKoWMQdEv0MBIKAYA62ZsYIBuurY1jX8PUvI1J4
 W5EftQBvCmRnwJbuFPEkW1VwF540iOTOcjteSEjJoiavQt6WhV7UqYaEwqVgd+AzEbkW
 ZDtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBWDKpPAf8L0pI99J8Qp5AVmrAfZOOlMgMEmGNYW2Ue7SQvBUjcrzvXlS5y6hqLL1pRzD6Pv+fhsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg9AQgc1l03/tr/a0rY4QzT/BHhFBc9oHORLiN9kbg+VVGA0/+
 14ONe4v3kn3gzaDX6qWpDWjiGSi6d36M2oDm7DvnGFCh8xLl/A7isdr7AY6rKhMpCpyYiDScvK1
 4N97JjIwvENxynLKh84KarK3MFLf+bu1lCeH+42/yDCeJN7YBXpK3LFOgddx/NPUVqcvjszk=
X-Gm-Gg: ASbGncu5prZJ5CRsqAonWyQWbZ2dquI05BWBRCjndK/LQaI++f+1E10E7gpkkBDPTOB
 y51IdJ3Rj30lUsICpkFVPv6WHCAHE3NpS2nU56w26U9vXGtDKJb+I1FSM2lkE/Xkwpr5F3KEBk6
 A3Nmn3qPGBdtg2NGbwN39whkQoqxgalPcI01M0t+ZChs5gDf88R6bx49psXTHnOXWK+CkNrGi3N
 UJn7G8Rgk+rdsKaT8kQFVXOUjweMKLPGSuom+RfkqlVAtoABogphidvYGZmVpBSo34H+xo+F2rz
 qdl7IKF5WozafbCwBstgNYz/HQGI9DbLSiol8hUWeRgPs7qBJ+II/QWTWhKwJEigPpTBeRfaS52
 K6hNGBKdNhf9Gw9oEAKVdUww=
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id
 d9443c01a7336-290cc2f852amr62490825ad.41.1760720974568; 
 Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiqLdkEXK76xjF+lHG7GlL+/MevbHd6v5Dd9DkIsG+DvsK4LIGFKBDF7/iLNW/xGjrgYInhw==
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id
 d9443c01a7336-290cc2f852amr62490335ad.41.1760720974024; 
 Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:34 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
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
 Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=854;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=73CWnG48TkIMX2pCaTLVUDJXxssv+J43riXS1iBwvYI=;
 b=nYbp04cbP4hftA9E7CUSWYP36Iz5Pp9rqyCdQ7L53BtrrLH/j7EeRFlrwfHDDfCq0XnfsB/mH
 vYFmYZ7iBlUABbf1sXw0lQKLtcr/Fd4l/WlSK6g+9Gu/MBh9PdRNytm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 8N0uh-jPQV46nm0mSggsPeH6UUvjzEhc
X-Proofpoint-ORIG-GUID: 8N0uh-jPQV46nm0mSggsPeH6UUvjzEhc
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f2784f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Zg9b9eOPwfKYWhW-Nc0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/bbTIzrH9NIi
 cBhkxou1S6k9EyvnZKD2CpzzA+DZXc0zUE3iCo6Q/BP037qSkrcDeQ8LEJ2baTwsraz2CRnhx0g
 o7jD+8Xvu06+/IRWNaxiwWYsJhLUIWsPZtyCsvHZ+mNbumvz5ianYwtrxwcqcXFF2GCkyUD76fC
 oIqqKNUs151Kh8s6vBg9W+FYsxtUBRQi+jXv/TogClCOjSlXUeunNttXaGz0WRFoHJPfTkDml52
 pTzlCwi9zGBcIQ6p4BbbOCLEcMOhPWbbO5dXF4HEkDXcy7RPuM6vMjN0RxriBBrw0307AVoWiXl
 1oWLfCieC4zS2Sl8jnkPeGgfTSbomEl65hgQf01UtmyzfPRQSio9SmYg+Yq/TVLYkX+P9XobHjQ
 TxGNYWQLUKvM9KT/aMRdZlenuRvnkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..a1c87b925bf0052c6876db96a2d6e3c3ab8037c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.51.0

