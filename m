Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A3DB53033
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 13:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395510E0E8;
	Thu, 11 Sep 2025 11:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="etRA6v05";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74EB10E0E8
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IV0X016087
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=; b=etRA6v05WeY0gSV1
 AAGw3riumuoDZwva/V+yCG332jRGagJmA4AgeLpwLY563RooGGZ1XuNz8HUmeJeI
 0UoVxqnGG69PnFQgn7yXxrzpO44azNFFeMW3uMAED5FvVX0hi/mV5yy6o3cNkpcN
 w4pnvyC4eEYc4FQnw0QxHaCNVMOXIVnPlujc455XJL2o912sWcBBAHmJGOVvs42J
 nNa6J7t0cf6JYtYwyDURzqfuOz6xhKvrdCUeLh6qeb1kaJxGrDBZI6fBpVesv27Y
 PSHe0daUdZ8584T3TA+P1PEQVtpbPCtjmZk9k4OihnU7usNSXzUhVH69bJ/rLI7B
 IyZTgQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t383u9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b52435ee30cso512586a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589880; x=1758194680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=;
 b=Y4d3mexWiaK3YYotxsR2vUoS2MSSTXd2tKyiPs0Ujx0GWVI8h9MnxhwrX5b8+RZw4D
 cdSmn40Vjgj9h5cTMPOO+qrmrJeYkvRsXmh3w4VUGoVa3IhwV6RTv3SL8ol15tOrV6Eh
 2tP1WMXv/ZcCzTaa4ZEq+IHJhwwS7jLLFvD+tOTd5Vizhq6g5nwnJm1ELon3NVqLDRBU
 2ZT/iLFENoirG/xnGWO/8YOAA9Za6QQkh8ttFhXvuiSQGF6lP34pffE3w5aLRyNPvLIA
 V3K1qKeT65ElSiGLGEihdDWrZfY1zkViGYel8DrA3bAWCnF8XVNxS/kmu1DJ1f+d3LWB
 qjgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULIl6OhqyTND3rVzzabwSok0gNeGo6p6d0zpuASSW6RAy0EcFaabHflCoe5Z7h90vW7xTHO9Gcf5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw48z/9yAWhMJI8JajAH6ZNVrvFfOAZbXN6n/R+iiO+f+urtQKE
 AGNdfwDgmdSk+bYCqJCbZ5QFbBWA2XB0dMpO2wpb8WH6lfmllFyzKC/c8Wm+261pjjrhK0xPsd5
 tgZOeI5pqO/pXEp9Xm03BYiGePMpbd0ho7opjFFfCwLFYQlP4ARkIEaBL0A22nnf2n0cgbKU=
X-Gm-Gg: ASbGncu0sORmDH9XIz1DIWjSNvAcUx/3SdvNkgsip/+9C2FNZsE2Es2yE8GPxFhQu+d
 x1ufzuga5mP+6R6jKhBw+FEtLVN7IeKo9FEGFa3bQsaqjdlPj5MjFJ8lj66nTvBueRy1qW7gh6i
 nsrWuEllscXRuEvTOAfBgZBjbb3z/NGfrWWGXTxgEy8+smW0NSErH+eiL0anVahbVxMQm1xdVlq
 6I22TwyFzoe1/3JJsmx5mzZZTIUlXtVRDzGBT22GWflKS02peORj6XwsFaJYlfMDP/dZlghthkF
 CnTH2ljHrPzKLqu4S1t16PkIA6HMOMoIjo6KAg5o3zTK07qO1J+X9+Ej9VRaVHoslfwbB9kB0WS
 PLpXgeQNeGG2tugpniwE9E7R86bb3px6b
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-251737d3ae0mr251493735ad.49.1757589880212; 
 Thu, 11 Sep 2025 04:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVej9XvECHnfJ2giLr8gHJUx8kOwiI628UxF466o3mzUJFirfad/bnLhSvmHcgicqE/EARkQ==
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-251737d3ae0mr251493285ad.49.1757589879637; 
 Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:04 +0800
Subject: [PATCH v12 4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-4-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1133;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=FEUevD/Bir/UEqCMgp3K3Th3lwTSdx1DDp6SRzW1JOU=;
 b=lwy7m2h+u6LYki4ZBIiHe1vbQcfyvBfzCTgg7t+cwNsq18RqfOCaBQmsaMuuol5n/cguidvXZ
 XJ/cgV2mfRAAaS/OKzigEqVCv9kz/eEdFiKFaNFufM/k6rR1v1W/tSL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: OOrDDUd5ZkQQ7oYe3GtBsCQIiAg_vrM0
X-Proofpoint-GUID: OOrDDUd5ZkQQ7oYe3GtBsCQIiAg_vrM0
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2b179 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX382LAD8VbPrv
 KTwtxq8N+0Bh64pdWxluDXvTHUtebakCHJljfE5D4EwaTFAkMj5Gha1jOo5jyRpVca2NVHOiahP
 ngwwBd0LG8vzpu+zO/J0AfdBMrFb7x/MHZ0x2MyUdTH34fATda+atUhFMP0gpSnUE675kTCKbvm
 B3+w/cDPBSwbJuqb+zaaqm2SLVSQeLh/UZjn/EBwFkrH0V2nyNLZrB+Lb8LgzgsOJmzN2ZTMqij
 CMF+b7RgknvMGw0Al2rKnziaj1NOeM2Uzc2V1ZtKzeT7qx18BuYj74CzUcD/muPLCgDdK9Cn54r
 vphDqpSDbhPwEDB8WayqjICv8MtT3WktQb3djVFNW4HolkdrRohdBGdkY3X7yTzBoebJHqTn/JU
 aUKzANX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767..b70627d40dc4 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.43.0

