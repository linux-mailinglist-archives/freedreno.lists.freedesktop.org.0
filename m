Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25710B2EC15
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 05:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4092D10E868;
	Thu, 21 Aug 2025 03:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNhEtQwz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6310E86A
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:21 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L3WxAL021633
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=WNhEtQwzj9cmkG9C
 gKNtR9kKQRmkFRkYW3g5clgGxOYtVJ6MlNpwsM4lCNOtY+s9HUZvCNiC8YXe+LQw
 hulL1XttHEsXP/TEU3oZYBKyXnMNo0eUpikA3Bw47iHS1f0TByHPVjQihfKOXUyy
 7fv+ELIt+zI7eTW870Pfhp5G1ah5l7s7i9G5ekOwahBD7hcGZf4nsKsxHgNMkh4g
 kAs63c7LAD8tT4EvcWvesZc3GXEQzZfJzvIxGHF6j+XoReS9Ix06y/GTVk/knFrn
 hzM0F2XYN8E8YohUPDI3QaB2q/oLYq2FY883gPq9s9Oyb5qzncu1DrTiu/Y+792h
 Hu8R0w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhq2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471757dec5so1012153a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747440; x=1756352240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=MluBxpe5NmmEjXnnhzEw/2jGA1IF8X9NRmxGCiyq7IwBWzOaGk6yY1z92SILVCoPan
 7shi7+yU9tRiqh/sHEokeRGTWAwrnMAQGrwgvoi4E5aBDf0dfSQq0ByK8ywMKXmQcmXS
 LbTu7xeI9vZWyeZadGCyGPh1sMqysBpXDYwzpPnPvMkMCAtD5Yyn+i2bOnvP/6UoAkxD
 qdQny00DJ4btGMrHYKdXK/5Rx2GrXTTZGJtk4+3t9rGicYDqIdF/cjfQaipPhASCbSrv
 7NlKMZmsd06FkWairGoGPUGZQQIwhZ3X/kOal/imcLbv+o1zlY08zXyduD/I5npGDpcY
 LGOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2+KbypmAcp/UJdegGU8yaNgS1D+NNEj07sKkc594AGsX9m+inLEqDAdX6mmfV+oPfK+tAxOTbOq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYCHmne0PI4m31t1PlB0SPOtc5xbkBEO+5Ngig0tM1xx4whIsw
 V2MTTCfCWkesFQa3iFM63SIlMfUBmqs98GN2gGfmS+w9AitehJ9sTiu1vXi/QOnglu3gly1726G
 HCSAzD+sKmnK0ygBm/F6EQxbA1w34pOFBNmoWi9uZF4kVq2wrc99KAhd+gdqc/iM1B/MGNR8=
X-Gm-Gg: ASbGncvQu3EANy83ZCtK3mmjYfnuMao/zDTVF29SvjRt9MbF5a0o1sarVStl/kyjrus
 BtYeJMhH3lbzLbjZVw5rN5QDeF9WxgNV6HLmUpf2AZsAUgIBxpdYkkvoutg5RnegviQTbA5ftCS
 vxbQRWbd8qxSkHJCAjstEdmGp5NG/hmlnPbKJzzj2PP5hIV3rmN8gFfJLGAC1j4zpTIyRQRpFr2
 6wxRBslvQL8Eg38tUwxZOWPdNXnClhGFqy36YfsfKcXyrC8x/ujQDPgyV2yGoTT2fBTqA4furlk
 eVbvuGkyyQeFpcTt5S3LXZtFrKxaTbx0Fs4J5yTDJ2fxdxaQy0KNKN62/t4pYvkEfKHJiDw=
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id
 adf61e73a8af0-2433084ab09mr1143124637.7.1755747439740; 
 Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tAEO6RQ7A4Yif9M5PGwG6tBqJ9xmZEWW8ipYZf3ykfyR3Cl22ZimZ2XbB0j+wgWpjjPh8g==
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id
 adf61e73a8af0-2433084ab09mr1143101637.7.1755747439294; 
 Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:18 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:59 +0800
Subject: [PATCH v8 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-4-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747402; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=PAchjJlEg6YULryzF2qUBVRmkx6B5muCm7v1gdEvjkVwjtgrvuc9yDJpeJiZirjS7AjHchmY/
 XBkDPxjkAr+CIuWlqlw0wdqfS7TFHq6xnd2Ix6GRqyFNzToACWb0cCX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a69470 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: PbOZB6jiI3j3HEHBMh5FlA8q2b-E4m5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX89ceCv9/OpCC
 k+ELvFp6z8LB7beBYWfVKv/Zbex9UHuGgQltxs0VYg7jaOqqCgw0T+veC9z9IgN5S7fhkDV6zTz
 mwSdlp2f9CNcvNCWB3j25jFjyLnwuzdMm6Ov6/JyYV2mAdnPb/zBPl472VSlOKk6BdUnzOI+hY2
 pGccCH5bD3+aGdSOtMwS1HkQIs0tmjqaJFhIj8HFNnZbbKHnhiOko2KXMtPFbsq/DHGHx0K0y4u
 p09n6xbkPUi+TSHf1VuAx3sLOB9voYl/5t7TYOF9j5EdwEL4qu/+oa6mb8jbPGqjeAVzV3w8w4R
 gZKvXsh5w1D6OTTFqrLiZmmzPm6FjFOeRLcSLsdi+IyhXbzwj6ho9H6vwfjJ9D+pAjuqPUWRdXW
 pVxeBU8R2diNhupk6EPPQRW8Y2ggiw==
X-Proofpoint-ORIG-GUID: PbOZB6jiI3j3HEHBMh5FlA8q2b-E4m5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
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
2.34.1

