Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E904A90F3E
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 01:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E0610E9E4;
	Wed, 16 Apr 2025 23:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZO1Ah/c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE910E9EB
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLksMM003450
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=RZO1Ah/ceclr+4Jz
 o62CH+mByuTgwys/1QUnFkihF9CjkZ0e6doBZ8JHfEj/A3MlN3w/mV3/w/YDe82f
 TVRr7SpsAnvfBI7VLzv0kg4DeKo/0IzdKSMB3nRnQ5hFMxBFRE4Krmqpdy4DYwx9
 fofmqdT/9JlgbCsSKFHDFbKUDC5fmBjpC7LZywygKUMv1S1ae8HmxeesfYJ1l57I
 AWuph3Uaw2gej2+fWtQkydhOqvlE4lcQYURU3J1GJfh9ao1Eih0mRbOKEyUfFjwD
 IpBAihqfzKGKPmb4laWv+SKaVSG08MC0hlx3M72Mz1Pux76Wc2K4bXkuHhNcILz+
 pfg6tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva9my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ffb630ffso3466956d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 16:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845400; x=1745450200;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=;
 b=ZHPaiMGb2hH9hm5L+Z8k7K14OyK6Q+qxWO+iKyUWO8evuxUt3jLpcmiOzVN//p7yQ/
 NKT8XPxMZ1X1Yh89dQgOL8lKQDETtgWZVGlPZHrxYi9F8GoxeNwytXF+WNuLOMMObojb
 ct/QZB62vwVRnUbKrYCQWYGh+9U12I+PZh/Ea3UlJ5IyQsnyYQhTSEhq5Hj3Tsv8t2dS
 UGsevhGq5q5J1De1ew/IpuovD7d5YMOk6xQ0dXXbazK0kU8nfXOKzvCwOh5xCnJ7W/Rl
 geN+nwZpSEDjVuO/gSjYns0LOd+NdiKoahEgLJ76SGP74bqgBEakWGYjFYmRL3FfnHyS
 WmJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0pPdwuPxz/yer615KLXRyqSUGbcKCQcGbi7vsirAGUv2cdnZhfHXTY8yCWzdC18ILDnHqfSQHNnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1n2aGlIcm8DWBZTA65Vd/Xr8mSQeiVF6EZppCrZn5qyHkgiwJ
 LRJ4HXvO3U04/qNkPdRyzGATnznkXh0xOHD1iTy4INE4gn/DAdvh1A2AZQD7DdIlk87efe6SzEU
 D9w+zU+7HgHZJ2/KLIXPYeeNkHUaV0R3t3/UPKLi2VWqRCtIPKSUV3MKpyVfGq5hzxSg=
X-Gm-Gg: ASbGnctqTy9FokGnBH6ei/2tiO98zk1q2NcKyzY8lYsBvMmhS8kFyw8XPA8kixwRcQE
 pC69IWZoJEULS8WBlTKwUqlYJkwn2mFgUuWwgwvoWb9NVEIVPJiQ9ZFanqYZKg0HFVNgmvuhO5m
 C3dnTmB1XvoPR/EMg85MxO0RDysa5l0peOFX9kgUIO4U/lGNWmiqD2bc7dmiLPGpev3TUaGHLhV
 MJkqCOpYpTledKjcGzBpEqG69wUH10ciHVHEqols9KhcHfGECTLKjIfaj6cxjh8WJMcNZKcQ2vk
 BAEHoNlORzbYg1n7yd9t7QE4EOu8C2JamDu9lf6SyYQoIfODnw0NeH0ftcarYAkbiY9ghxvxKAT
 OHoOZ3gmhtdGn8PFpqyZUX5h+
X-Received: by 2002:a05:6214:408:b0:6ed:cea:f636 with SMTP id
 6a1803df08f44-6f2b2feffb5mr54521386d6.26.1744845399693; 
 Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPl0iNL1yZrGzwcc1wmgq2I9+Il7LL8tKM3efE7HvmvGzTveUlWvBBNCOuR6INthBXgAbk7w==
X-Received: by 2002:a05:6214:408:b0:6ed:cea:f636 with SMTP id
 6a1803df08f44-6f2b2feffb5mr54521006d6.26.1744845399287; 
 Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:16:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:32 +0300
Subject: [PATCH v4 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-2-b91dd8a21b1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpReZo3CdA2iSf6xGsT8icNwhKZs/duIWtjg
 l6iKLErEImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1aM8B/sEZ8X8fCws7n4EK9j4dvr6ycshr9W52/GqqvdUiI+rEPJqEXgG+HqP5Jp83DiILIvjARq
 UAbhdF61UozetCzt2w6riZWWkt/dpZrefumM0jEZaFjENwz3HhW0Mw43vKVkjwJANh/ohHV56aG
 LrH7n7Xn2O+MoLcwEm1v5fffgTXXO8iGLtQ9HxhODSg/UNuVSi2s8O+8C1nSglfggjvxJgHJ0L2
 O6SIi/sGeaIhnP33QAfpyVZmAOxE3D1NmL6UL/Pdw38bS6EVwx2px/geD9NcQKqAbVy1WMCtFHu
 Jriw0VHG9qtM3QMJq8KVtC89Yvw6Y510dLe9pHn4kDzgwK9M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FKqSVjwN3JPtiZLFlE2GulBeJYVV29M9
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68003a59 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FKqSVjwN3JPtiZLFlE2GulBeJYVV29M9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=882
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5

