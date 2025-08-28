Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6FB3ADAB
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0D510EAF2;
	Thu, 28 Aug 2025 22:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Y2KGyf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0322110EAEF
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWYbH024730
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=o0Y2KGyfjiibXHyi
 UHvBhhr9jxTNElF9xkvZ4X+sHdGNSPl0hXxnKjesSzv093yBTrlM/BIrCNUTmwl/
 2OzZWaosrENu6C8wGf4F03qbY86yymv7jRH9QLb0+m5NX+ch7HpYFAqy415vKehl
 cQS8Dr2sy1du+MjRZDAPiqaoNi+Osq1kKksLyJyVyCEfT8qlhVPkzPC0JRcKGNeT
 FxmB13pRZP9dzagUQ7uksPuWUyF92hoBw84aGGmho1zI/wjhJlXwjLzxwcQHzW7l
 996WyGS6cYfkqCTwaBCh4BtWwRx39En9qkkRdycahWALxUpORj2MIzJGGam4CcnG
 hkMlSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up1v20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so40501421cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421301; x=1757026101;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=X+4IJ49lvGyhSGPNjxP2LTKjRVNUBRNWh1CQjmUGUTmH/TwVRsgAdjH46LDvM1Mwm2
 ElAczZECwuuRRJc1b1ck6+fH3FvZeI6F8EroBkReRVqD8ZKFyN/WgYRrINnR5WUltASv
 BLVxs0Cj+e548B6hKip839YppginhL5nTf94KbTGMYs8bDR6qrnuWzKLuYdFzWrwOuWP
 JBQ40uHprIZBWSMTpM5Ikk4wEEnSFsyP6mt+eFuOdQz+L+Pht3Ves4S1KdMz7pMix5Wy
 AvS/owefUGW7lll1wdkDV/jbvwjwh/2vF4TsEgoM1StZI1oJddhGM/BAqehGORcwVWwf
 lRKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYOdhcBlCj2VuaZVfWnEGG0XneBR8Ro7Ijm2BLloFt7br935tk1j0u2Aa0JtC0DkHE6f0aarlUpYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGOOZPlhGdHEz8Qy24yaWbjhOFBfBjnsJ1ZwAeNGZZuiUVW0im
 o+MDB7XsqRqEEXdUm1hvMm9ONHp4tUNVfftp5bjyH5B/HreMUvVWRRNyGR6auMUJh8Ig0CmEO+3
 yg2h8uf/ploeCu6Q5eGt9T/UgTO0XFkAuxA88hNjEkn3JxvdXc0fsVzy/NyICEuhYQYBeWDk=
X-Gm-Gg: ASbGncsJXi5DOXQEIa1cH4Zk4weAqBDmyDgScHrZzWIs1AOATUI4xsa88XMsDXH/ruO
 9d7MxyHUmJbm7Gdix/RiK0XvXQJLM+AowIcCbSGbHoQPUXtyXYc71uUvFl0SsmYRaCW8B8Yxygc
 EZi5hn8qB6X6IJiOfbMAq9BH3r0UHLLKy9NoIphKwxnxYrTVs+MIIkAOvEfSl0w0N9aga0F/dmR
 pthlmoetjm+W3IxAXYlHg0SUGRqFfM29yY1umAY+/20rAs3tzXdx4tykuzJFH/IkGoNuk6h8hUh
 U7nEgPqJqsAF5H08e5z+NljHN6Ey48HiVL791I48rgsThcX8RNm+PAyinxnvNEohssXUe7G1+wm
 frcm0hag4ZklVRq22zqe3uhEjrtiPg5jwnXUmFKx1NsnZaf+JmBOz
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id
 d75a77b69052e-4b2d35a7edemr182346891cf.37.1756421301209; 
 Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdoOUw7ATcWGp0Ua6IH6jvR/mrsJOnfEZJvEPJmeKyRsASOxjwEQ/HWMxbA6oMEFqxqL5e/g==
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id
 d75a77b69052e-4b2d35a7edemr182346591cf.37.1756421300738; 
 Thu, 28 Aug 2025 15:48:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:14 +0300
Subject: [PATCH v7 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-1-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywCsqu73xOaKt7zEWE4x0GdbQNxrAI+KeSj
 JntiOFcogGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1cijB/9xZIf4Hhs5tcWo1x0n2SHDJulufkTbQaT32JWduvU4+NIjiogvLNlUCHiNRzYkmbnfiw9
 wdOKNlPthTIz7NqebuGtuOAUCOtSqjrChZvp6oVoM2lIczNKhyvqUmeJl4ZiMq7NXVbHGkVz0DZ
 z+iu3EW4P4hCn+/34/nU1sKcU8C+0jQCuuYZqjaFBnJ9KF1xF19aemPYflg1xWMUeZmePYtqA8O
 gAMb1VCsHmSsKvwA2jZ9fUj/+Zoda1bLuf05yCL3bre75RmncJWAmc2/sOiL+aBRCw4LekT7Dhv
 uCf8aVotEO6WN+Wd1hp2/+nKronI5uZElKvuVDGFCfcCPgP9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HTxzKd_l7m8pCeCWRgOxEngFSQ8OjcRt
X-Proofpoint-ORIG-GUID: HTxzKd_l7m8pCeCWRgOxEngFSQ8OjcRt
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0dcb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXxruLrdGHplTB
 1S3uq73msX49doMq6NnKopSTdQVaphYcqqTv8BawPl/v28sY66S0rMscIRLMG2rXMijARLxIry/
 SHvsTBMPaw+4CJMn7uv216mByzXHyIdgI+D3F2saz0xCbg+i41otxtwpsYlH3byeddLQm5jpncn
 AFK7PD8WHOg/auucbc4MmfdbVQaqvEgpPG9ZD8rorm6L/wVdRmoPHqfLHFbn1hjy3MNPY1l+Uks
 bT/kldrZU5kadyoY0GM9RgB34e6NmIm/QYAZ5VbrZEBrO5/+uqofNNVJ4VJzfesYeedSV5tgqOP
 aMupD/1MbtXLbjgc0PzybWK8fbt8NhD4ew0yWG1Xuq70aewh0WruqSlagvwMw8EQhdO22ZKIsCN
 Py2Di2DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
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

