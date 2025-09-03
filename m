Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D356B41DE2
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F43510E7B7;
	Wed,  3 Sep 2025 11:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQLw1s6V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7336610E7AD
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEv9o001981
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=EQLw1s6Vwpk5KUvn
 5mZpuQBSCeTg5U8GFQ+9ZgzJWEGiCA20lsbVlPYYRjkrX+FI7mE8sJxxpVb2D25e
 Il7Z34ZyKv9EjK6ql9sU0nUj6hc0v24sbSduEET7DAlgsGBNTe4j7Xsr9UFTKs77
 xfNZJkFuf9rFvD6alQn5blSKbhUtClMf4QcXhIzYMglXYLuL3N0SjT334Dpb5IFx
 aG4tD1KoUouTCmzYteSayI4R5U+NLTKyQJgXixUlscJNEReZyhVKXt3mpGv3Kaht
 H20pT9yd3VjSA5sC5UEUVoSILHg1eHFgAd8Ub51Lmlory96VHhRbT8A8LzpT8Ae3
 GjQG6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03k0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70faf8b375cso79539366d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900703; x=1757505503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=qzjmMPxanm2gURRPnxR/bK1dn8v6LnkZH/kEKfwDcqP2MFQmlbSVKb4lL+my3khMNB
 zxdkd1Zu1mRE9t9MVhhaamqqQvY38BE1F4GLZFDoXUCm8OAiQHGdwPoBe+3+YXWeOkqP
 sN/SdNm9rlUSfsw1HU52w9AS2wYiTT8xcK7t1XhvQGk1VmgccqGPkPwax9r7rLO3sTLV
 rnKPMmhixSJdYlS1z1RG8hsxMDi9yLRhSnN/v99u12qqd8bv28cMP/3Hzb4iCwtbx5RG
 ECkI9CAEgb9jPRFKbrmFxCZPnoJo7mD8Q1ucgOtDSKFYeA1ahhyDWvM6tBefV2tSAGiL
 juUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxZFo2K1s19WN5/N/Cr39sa6bKDo0bC9nT28Czp1TNl4o2SysYgqyH8ty7ogHDeHOTH12OOlcDEuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcT48mFj7jiW8TfQM+JsRAzH5TAcCCvnpPDXaYl165BEDx3Rch
 tMcDN+VaDUpjMbHJMUYx8HnGewbeEAiPyL+3HrZYJPtsEKhPLQ0YH1WY0Lswes2nBhMyRodD/x3
 bjrkJumpkMBZJtnA3dOdgrSRLEf16LPzlDm05VF2Iy6N5AyVfw29EeLh5ryb9Rj4ArBaQlbo=
X-Gm-Gg: ASbGncuMQof/dUg7ByNO0x0VWkHX6Qm4e7r2ZR/7cFTS6D3IYFT2OJSH1zhHVkeAb7a
 dUjL0K0e4GMni5AakwVLCiQDF+qE+9UsHcE33mDwiVz+TG6vNe47p3Wk7ryXxDY5HcH08OxC4b0
 xQLVOq+bhBhDa87Gw4Jmcq01Fm6quHTtA6M+At0my2rNV52OY3Tw/xl5X79RTwywIOppIDB76YR
 pF8FGrBd+DJsdlImUN3+z0VyFtBk/aXtVAnnUYJXqATndl4vURAnejaGTy8zlZxg9UYLnukFIgZ
 S7I5RJx9/t3THqBePCFGiLtSz0cdQxVpS5O61HrXEBzvphvMIG9v+1iqeuTwXZ8e29wjzyFhhAb
 qR5YcoGUTlc5zBa14wNcEQuIltC8w5GAG5tFbhWI9mD3xhnDHnsIC
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70fac883ce1mr176720576d6.41.1756900702746; 
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj9hZcrJ+8S42PCt+RrOt1ShsvO+BYl52eMjU0T3wyJA35RFJjzM/AJCRPGUZH3504p2FyKQ==
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70fac883ce1mr176720126d6.41.1756900702249; 
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:12 +0300
Subject: [PATCH v8 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-1-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1W1p9ibzzCWoQUIQX0KfzGSz/kKXFwqoffX
 NJj3hOGz9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVgAKCRCLPIo+Aiko
 1XT3CACu1B8wHPkuKcAXGFd3QruC31bXNY0THTielGdmOfrW1fAonzUr3Uu2fYxVH5s7ghwg9k8
 68pHE89tztuW4b4bNgWVshbnNrINXf70tUF0y70xHDMIJ6b+EHPogOndk3qAcJUholeTSK9swx7
 PS0bFEobZk+VbXsh0QiVlHl5RZRmoSflDwsGA88Vs580Cch8RFs+b1d52zmEYfEbrB9siCkWGu6
 wRWaOfCtn/+iTtNQIvEdvLazeBoi5MsCrAu1KAgKEmvSuV3ObzYNpprUKesg1vr1uW49Fhj2U2L
 YLQv8p0o35kFJsMsvDISYVh8N1pcKQuVXLc6KYInBJ9Km+g7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RiZy0t59NfBldajTWGWLcav5dXKNSdAx
X-Proofpoint-ORIG-GUID: RiZy0t59NfBldajTWGWLcav5dXKNSdAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX9KrbQq1aAmHi
 iF44O6ZnrPener7NyjPRpqOCpOKTAzRwVKOmCtC3Ov0KACJILXHtaIJ+jixLfst5jJ0G47ajyZW
 cWGO6JdpSxKCMvSPoJghixw/CU8qoDaV+1z4DkUSaRTmQTHcZ05nKqW8UkaoHyRa4IQUPRHITZF
 IW4mEF8p+7b5HDuCkN8UoRsNcQzS9349qKVEy5m+u8cr2m1PW49p+ifl1meM8/G02ZVWah1Ul42
 tmhWxOczeAGg4ufDuzCmMrmkXGkF3PiF44GwxX5k/XrLoZ+YlnN84DiLZ+G8aDloZey7onY8OBq
 bDsnkRALC9NSWLGYVLIs3JA1i08UzfUph9RSSmi4xBwwtJUpm5FEn6zeMOnmwxSvdnus1DtDK9Q
 hiO1UrnU
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b82d5f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.47.2

