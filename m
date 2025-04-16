Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E4A90F3F
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 01:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBF610E9EB;
	Wed, 16 Apr 2025 23:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YM0AoGGg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6AE10E9E4
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN2L5Y026233
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=YM0AoGGgZmWEldlE
 XW1SpuqCx5Og25VefELc3ZGpd5xTgkzJXNqY2MEWKLU2RgEi9g8l/ETcSlmWLLtv
 3WKNThLnM5ZPsOHQdXzHYrjLKIRL/n3YYQY3eKLupdQ8CByDbKIj4Jn1BDZMytCk
 XQpTB/sRHKji7f0kDevG9RcUOldN7lTQbVWPINcsYjtX2gDfVQbqMseq7h1rjrr4
 Yynf95QKBOBW3J182fu1sLj3MfZIHJWJppN+hdKX+gP5SOF+hn7fAIsobL7zagkn
 78ZBevGbVP/SvAfOd+tlnIMvyBgDeP4E0Q5aEc2uhsjn/oRDLcORnQTuOjKn3LMh
 0L8j8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1cxpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f0e2d30ab4so4564416d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 16:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845398; x=1745450198;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=;
 b=knQYfz8EaJ5BHyc3lNo8paEWAq8CbX64Dei+Kivx+nxmg2hOpkohSzbpTdqvHxYdcC
 h6R2xu4k9hOXrAO6nNUVhz79oynF6wqbOQZXSvE3xQBUS44r51vqzywB/4ZYeeINZ2o0
 ijhYcpawUh5MRXuJh6NOxnWnyJTmwc5YviKFyai1wMQQaKTIUDHuCVS6t38S55ccjwMl
 k5siSWfCbMKLnGH8yVB2TYWrAfWz5laDO3rsSixr26VrcLvHJiipQ6e+mamHFkAFftIk
 hFqxJ0xfn0/2znKYgoCWobAmlnn4Xs1ua00q4cfprnFpVdFuMXZ1idYV13lkAkW1AgTE
 XO9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc3J+i3jkpH5nYhfBkYQSwmaxEuBY5lemw4gJaogeWiH87yzekHZb3dojZ2xQhMp4O5Mvq8AfO7OE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj0wo5C0jqttWCmQBMLMHaZvXa83J/fELM26sfTFCDPJCGRkX1
 cq0cSwURFAZaTSPLrAsBKlxiJkPZNzugCcm28hj8XUq5o9NanzK0pGwhAQgQlXIzT7MErCB66hW
 8lbJjNKSoFf9pokSOJyTZXRWJKgd5CwUJK4SE4wEsrwHxxvYiMCGvwnuMb7UjdOOhdhA=
X-Gm-Gg: ASbGncst+JG1Wyxg61J8lzzvmpFlZopQI8nMzYU5gOT4JpR+t0wrLxmTu3zPcQkQNfQ
 vyztXG7BNZdjwzPvM398XQRpFa7zmOtsUnVcsotHeg1crfq+3YSIy3+MPYmJO85DE7vUfFP47Cd
 eeQxrARS8omDfZCUoHFf0StvI2PbN07J2U7sJj26K4HcDJWShqG6Kro8glU3aONefVwQfCGT2sa
 NHI7Z3GY2ZKaW+lWld22N7uHAoP0DzNsMahxkSmtX8JmoQ8xzr0NMIVyKUA7g85BsLtzT+M10Pq
 GzcY6exExA0D/czcj6EUgBGQQUlapgHDHCPx0orRHVxuuiLoN7XnmXUA7yvJmg+ed62L9wKhleT
 ts12t3YiEMAU3A9M0PLHAlrlb
X-Received: by 2002:a05:6214:20a7:b0:6e6:6599:edf6 with SMTP id
 6a1803df08f44-6f2b3032dafmr64441386d6.34.1744845398158; 
 Wed, 16 Apr 2025 16:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV2eYbePEhU79oEJdMTheoNgDUDRrmkT+27zL7lVtFXNTYV95Uc0K6ZKPeVd+SmU+iRObdqg==
X-Received: by 2002:a05:6214:20a7:b0:6e6:6599:edf6 with SMTP id
 6a1803df08f44-6f2b3032dafmr64440776d6.34.1744845397805; 
 Wed, 16 Apr 2025 16:16:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:16:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:31 +0300
Subject: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwaDVYA266YfVUJZHTtzTB6l1azoOGPFGCb6/u5iHhV7G
 ZZKsdudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIZDT7P4Wii0FyBYrLeDbK
 BP9d+SHIqfysl2hye2X6o0C2pL+lG7rnGEu0e/pcSax5nBpsvHv3yWV+j2ZVRJ4Q3MQnUlQ3/eu
 Pu2cKZzW8SbvrWqYv6nHjzxvVi99tT/aq6/Av3qiZYMa06ppWrgpHkOf0xNlhh6bdE0oWVGYx1l
 9Y6vVBjsNXv2iVbcqfsqCFt20LFKV1BOZymrosiPddt/zEpvyZrYelJpb39l0XWlQYkLxx6szfu
 pdjP6bpuhr9y3P5n2zvtP3whlXfn6u+mFV+/UHq9nIdg7nmXr2Ft7k8zHo/FrwttN11LYE7+YKm
 iUnCroBDy6fqPle5Oulhlpq20T3XWPGeK9ri/n+zrssAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68003a56 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0FwPoVKEL7cN9eMOe3bWyXGBC8RwG5Ld
X-Proofpoint-ORIG-GUID: 0FwPoVKEL7cN9eMOe3bWyXGBC8RwG5Ld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=944 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5

