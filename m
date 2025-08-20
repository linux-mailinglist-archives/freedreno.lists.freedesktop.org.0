Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E450B2D857
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 11:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF6E10E6B2;
	Wed, 20 Aug 2025 09:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6ZzACJ9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82510E386
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pNYY029929
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=; b=c6ZzACJ9ntzGn7pd
 F4Yq/lTRlsaCdklIJw6c6npphgDFDfNqymLrq7dGBs2GWKk0poBKof8gjfnWh6TG
 ZsE0QPKZ0JcTsTkKPneiTRnaufKaOqgjMSDmrlNlSnGITiWNe4wIP7Fz/YhXPpC9
 /kGUBHVxBZieZZt4XPU3cAWhHTpGAbmurdmkt7ZKPeQKftuCRjxXhlYcKWZNHOmk
 1OcwLH+UL+0NgnPks1OiMbgRaQYpRTQVBXBrgUshD2uZUmfHnN+4IzbwUdI9xxO0
 fuEFaeuqD2+EadfBcv9f4JXOYIbGjnLB/3E4aqzgtW0sbsAnYNCOxWkwDkzrQ7Fw
 IP+yFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as6b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244581a191bso13203915ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 02:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682539; x=1756287339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=;
 b=cOY5coCgVq9VzYBW1tZtnmYiOV+57XubQRwmZIRSqZwj61atsIbpN0WKN1qmDYk6S/
 NnZ6dn6vBLD+VN7Efx+Kuk10mjqtCLb25YJxMR1LtcS7xsBeS8BRPsXd9AWRRLyfxLo0
 ymh8VMn4TcFiiWxEHiBTcMcKV1e+GX8C9ZvWB54+i/cYSuIsq3RMHDihpmnalz4eDAF2
 nQXamQobGfQjPghwAQY4Qbi1YSWuzwHbp4xkl4tQQ4i3rydo4RjFuFmVy8/YH5gowBpE
 cdUyQXGkE20Wf93g9zfyW1Nv4YfSaYVMm/yP5DMur52Ep18Zam3IvjAQTuZAB3gqFA60
 d1zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ1X1i/6d63Xf/dU7Xi/DPix76EZ/BQAlYXOGJ2ymheeKh19NN8nX490vcgRQU2Uh9NU73JGvqY6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGh45vkWiPW3/T27wzbQvzyuFMG4Fiqef4Ln4YUlw0QK2YYM96
 lX6jXktbhWtMgIlRwWYoaTgfVcH0iIwLKk4KE7vy6rEhHqSJSfaRUhBhY2IkAGpo92nU9a2Jlj2
 sD+Rm6BIaV3PryjVzNIa+IbW1ZcW70rGIpiuv7/BsgNJZV+f4yX7v/h+awAPNk0dNWfKNQfM=
X-Gm-Gg: ASbGncveoLp93lfq2TkN6dgpS31tOpe3dFD8zXeTxHGXUalZa+QuUpdjf+qTLer6O2s
 dy6OhpHl5NaoZ7q/uKRY7iVC/Hu7xSc9jsEz6dHio4jdBgQVtrktweWKPrsiSODEePPlqdEj8NR
 u++7w/ESxdY7pbGDs4wFSh+9DEaE/Am01ivmdWuejWXEMA63e3gPcWVpvROP4Hi3ud6xzTAXKHo
 wZmCMDKEAIdHzfn36Bh32P7QJSuGIYhZBYYbdSdZLVnv2/fyp6vf2j8o/ruuqasNuLsMAcyHxTw
 6PyE8PPSIbERB2H1kIHULvfQReUlRdVt4TNM8zY956f3OfuI9LEfYIVZUFitw/MT4OcUUACv9UL
 C6r73v4YUvyegNzuc/Nfst0McY8lUkI055Qob9yMVKPi250WjweAAVeQA
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id
 d9443c01a7336-245f85c8f03mr878725ad.3.1755682539160; 
 Wed, 20 Aug 2025 02:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGruFqyjDNjNZap3tlQ1QMYvoarVGmRE48uLqorBf5FfkGpP/sCgL8kWEJHeFetKvlW2BsAQw==
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id
 d9443c01a7336-245f85c8f03mr878395ad.3.1755682538659; 
 Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:43 +0800
Subject: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add sm6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682519; l=1064;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=TjE7e881JVJnbF2pC7aHvYEjeplK5Jqgj7gdtmDIJTo=;
 b=YwFU8m0AxT0KFGHqI+UMpcgWIIE1IgQqEACZ3mvVMDlXo2yCND45p9Q1LVkk1fS+g3Vf0Oj8h
 owjuMU/XXy9C5rqcHiom1RQmoTnCAwpm4ldZajHq6LLdCFeZzebhABE
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1RXqRR2WnZ4T
 0Js4Hi8qEnxbfVlMXMaLydkpYXv9BvXDslGHhGegllBm1DXGg15sQicpM596FKXXWxRiKTzPdBv
 3uEn7pwsTmrlxgKSLo6YKCNogeE833jYCaZOHj770/oBr4scLxkhI01lD7Me8J8RTFWhNx9qRLd
 8gp8+9AamyWhSexAq7WiHi2EC5fjlyzirU1yduS04PUQH8MUERcnaPt+DkhgDN9Y6CuBGGc+3BW
 UVG5X9S3D0/uIIYKNX84aTF6GAY7I1pQwrWk0yiJKWY/OIW4B/yshfS21plA1Ta4p7v1z/kY1qZ
 knH5WUQrp8IwRdDKbkART9xT4UjyT6ySdAVlvX+P1RQnyPFG0i6qd+wBctRzLNOUEve7NO5+JFv
 g460tphrzntutJn7ELrTQ3M0C3LnNA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a596ec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hz27nZlvLZz7BoqxLNkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: -3IaJ-Vq1SzVRnxGq_LqdY4mfOeaI1WC
X-Proofpoint-GUID: -3IaJ-Vq1SzVRnxGq_LqdY4mfOeaI1WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Add DisplayPort controller for Qualcomm SM6150 SoC.
While SM6150 currently shares the same configuration as SC7180,
its hardware capabilities differ. Explicitly listing it ensures clarity
and avoids potential issues if SC7180 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:

-- 
2.34.1

