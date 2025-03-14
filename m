Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE9A61158
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278BD10E9E5;
	Fri, 14 Mar 2025 12:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1kMUQdc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0238410E95D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKD7jB027558
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=g1kMUQdcqMAybrFS
 15GvE6JaxHBE5W65B5Fv8RhwbVVBdkNQmpiUAKlEuLQ24c37qZKaxW6tsMf9JEbn
 bGaD9RfgzU3SKXA0YwEVk6AwXWPcN9v4LFTKelQ0b5GGwBx7JP5mt1PUAopkGbr+
 DkyKUTLcOvO/2WzcUwuJY9PbgWHIQeuD+ZI1F8RZhwF+Jd76frO0vWlfw9iJvmB4
 ktRIPr3faHxl9/9Ih+q8BdtwBFDcv0PmL11jsp7+Pf0rZiYIZuWXSRxO123R9/is
 YE1xciPaY2Se+6Pu5BdSEarjTsjHg2vwAeQci8tIxOvvUkCFJ6ANvApyRf/ryzBN
 mCHTQg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67314qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e6bb677312so27387666d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932567; x=1742537367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
 b=uTexjrvekoi23ijlhL8BNH6eSv+kFUEuViAIWAb7K+mL+yJcKh2cFUM+Z2wwTIC+Kp
 7VY4SrRxb5mNJUjHWEniqRp4jRE4a30m78T6VYf5yB6zAQQCFKgCFhdeC43ivrXCBdmI
 Z4ViD44RaAa8KXVgQkAWP2v2wnSbGn7Q+2+F1jR0VXU8sbJntnWLF2JW3+ugT24lHEt+
 pDtsGaeAR5xY2qo+h/e8upeZQ7zbsAMxt7V5fTdnUlSPBBp8tZKZ5ihXbIvH42Cxhcgg
 HupufC0WR2fcXm8j5jv5j2+SkWh1S4JW6J0oMNW0zUFby97Qd4Q6qYKRfI4tn0IHgOAm
 lHMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTnfl39z7I2kmtGQ2fSZTMhMsMiory2xVM7wyP3hkCV1BiX5RoneYFzoAuhPzye2AvgftN/f+eatw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA3+aCxtGta6PPZkgm0dJGRcav87uxOFmW7y7TAIB9KLZxoHe5
 RPbsavu3huxMbGQVUxB014hObXXP748qDHfBXcn7dNsuMXNja5sDXGFi6UXoU8dVd7V1TGL3hP4
 64yYKNB9feJ/FR2sGPebPhJ4IUPUhc3axDCSkx6arTTpdJ+x8gBBfI7nVcx5J3HC3C3s=
X-Gm-Gg: ASbGncuxKDhzc6Y4KTQhs4sCOUE1a93z/VoSNuF2SW7WxWG0ZJ2hRb+DMN93Eh4BOzL
 BwlAZ857AMoyS/1tuq3oRDWxVpXktUXTKJJ+YecVdPUJvdqjElb4sEigZqzRePHB1cQv5PgHr/G
 mFEaTZ/ngAIBpJFUCsINz188h7L0Y5wREXSpSci3/MXQ1qPl8/FCkESjz6/I27wxGXZYb1242nx
 Uomu9lqcsRMMargImL06EU+VOOZCQT43vkLBATV1Q28ykuj0jLJfFE2Lthti+FtJV1QQ4Z7z+sb
 RgAAlR7n5/Y9ZDW+0VSGpo4u1FpwLNaake83hGjeef+q1InZFctd479rtXnW3AtmaCM36rSEURn
 43QL5PIQZRrgR3JzYtAH1bKy60y6H
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id
 6a1803df08f44-6eaea9ee3femr18760596d6.4.1741932567074; 
 Thu, 13 Mar 2025 23:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcEa9Bc266rkd2ufdSrH8URTSt0lvVJ8rYD1A4CatJi7rKwY9bNrmzWb340X/FvEigsaAADQ==
X-Received: by 2002:a05:6214:1d04:b0:6e8:fb94:b9bf with SMTP id
 6a1803df08f44-6eaea9ee3femr18760376d6.4.1741932566765; 
 Thu, 13 Mar 2025 23:09:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:07 +0200
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-3-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rlE2xpFfY7J55afOHaOk75u4wJM7Vmfn2Tzptv+fXHQ
 e5PC/cs6mQ0ZmFg5GKQFVNk8SlomRqzKTnsw46p9TCDWJlApjBwcQrARISl2f/HFLg9zFjh9/3j
 l6lpXunJ9YFcvwUSXKYlFYuXsrTG+vlEyUm6Ho8P/6xrJd5etletKXnebQ/2hWuCDO9N3GLf/fm
 p9Qvuuev1TX0mnuh/MCdlPnu8Kv+WzVcyHpdm6Iny/77XzzejZf20Xln29ccdPS402nXsEPseeU
 ioYH5945MF3DyXp8nL28k9n7SrdqJMv7NU+dLbFe8mWQfKVfwsUzox0X7R2RzmpZJvDi6x+8+co
 Onq8kCA8Yvr75cl/9iMSjoc2Dev3+HHdELR4DZzuOJkrpBb4Z/ZWerY13SqXyv/YpPxoo6V0aGA
 zeecwgLeSNV/xR/1PKw4VsbXSp/n7jef3sIgVrhPp/YpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c818 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KC8wC84eHuae1pkfbedL4tdZ1O4qfLdm
X-Proofpoint-ORIG-GUID: KC8wC84eHuae1pkfbedL4tdZ1O4qfLdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=940
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5

