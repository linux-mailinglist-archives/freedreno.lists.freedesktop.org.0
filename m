Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DEBB1F347
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 10:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0D810E13C;
	Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMbhVHQh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4954410E13C
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 08:34:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Z3dc012611
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 08:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=nMbhVHQhq8jI5CRp
 7yUt+mqcmsSLef65JrnmWBNO7DIIe/iXwpsU2bd7plPrO051N3wO1Fy4g1Y9i237
 V16xl/4kmgtbX4XZu/dhXavIt6WvbQirQ4/tMXuIjlMb5IHGUUZg8uSnOI+M3fec
 OT/9rjC1sfDbC93NmggK2905T0GnLhcfHK0ESMCSTfWHafIcLdCIx8gJiLFjOb4Q
 ogfOms8YUwjJCVs+fp4TJ0x5JNrQiFAdSSyP/pKj96CIufCxkDWvlKI1g2PIiVWX
 RCz41py0D8qwXDDocQO3oog/7OoDDpjNWMbZ8ejnksDNlqIT6PNh8GQoUsLwQhap
 5KUVPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40b3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 08:34:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b081d742d9so102061731cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 01:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728440; x=1755333240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
 b=BO92NhZmlUmcsjeQxu4bxhIEX5XIMhYhLz2DVtjxr1I7fOF0S+CSweTcG23nKZwE5R
 XnbiygZ1GMMeftoOP75Va+ug7Yf4ZfgpwDpdK5VJPiQwdcfzu5geQhnWyx8FlEwd9U2c
 7+Hr/qG27RAp6feGV+FKZZkG8O4dHaAtpqC+seIFALhhVpNG9/0Mc+VyWs+QQgAediHy
 3MUy1suZRsQtfXysJK7G2PMOn1gCeHa7Y9uR+i0OvjvhOKeOhtzBP5JXXV4QXkXEH2w6
 CXUzdqrW0Qaf+TMsf0Wqspczq/s3PXecyzqVQTKMfvhL8gzYLI/5S+sl3pIOoA80z/9r
 8PcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuHrbxckmPISnymazGTbZbQZqr27QrJ3q865Bq+dLfj97IVQ8U6Fv+eUyXdScyPj+hrcE72r9wJwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMo6Np5mB9UTjcBM/0t7oPkGQpFDAUOHnKK0HHL5hhDBAIa/ln
 h3JLf71anGhykUCUpyipIkjkrzIIF26QmYC+3UlSwBSAifvjtJPG2O1p0TV2Og7ofBEzIG7uMUV
 ZZYWBdkfYtiKMAyF2nrcOzFsTToH2yDNQgwP5McxKQ/YBO3L36YYJ9Ln+5QMfNrGVLIHMMMo=
X-Gm-Gg: ASbGncsd1WxRW8Ps68Pfq3xopL4yqTpsdvScNo4ErDYP8AXpV1RSUZU33rvErWNQKPb
 lvFzgyMEGsk9oXo6ZE6pBbEScPisGYVBHQdTwAJh2dWVNqen5jSKWVxIYe7/xT9ts5DvEHcQqAr
 Xwhm1QLIyx7ZcyLCieT1INcnQdPSGlfWwfWifkESsp5jHzogn1PLcyJxV5IIwrmBZvO2ZkTlpy/
 4dEgrQeADh6l2Rz3g0ZZgTArIdxI2Ng0LcAFOR8IToJuUf0K7PTNCqcFHhde07WvBAoP5flZE+u
 dYdWFb7ZzE1aS8eOj820pxGMjueJGrlancICpqaujK9GX0zwmAHwe970YzZAG+Or+thYb4F4pwT
 ZN/a3ixBfEsUHO/LqUKSnHwhVhTRCH0wm9hnmEJwRBx118dLEJz+0
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b0aee54906mr100495911cf.56.1754728440504; 
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn/NnXSPgAnPNiZQ/pbt34Ubwax9v+///1C+g1FSm/0KIGAfDfUO5MlDxi/4Fchku48X0j1A==
X-Received: by 2002:ac8:574c:0:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b0aee54906mr100495691cf.56.1754728440012; 
 Sat, 09 Aug 2025 01:34:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm3268166e87.102.2025.08.09.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:33:52 +0300
Subject: [PATCH v4 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v4-1-bb316e638284@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com>
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
 bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolwfzl5BuaDrbT6HWXVPwy0irjYqtk03FHP9tH
 ozEaGP1IfSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcH8wAKCRCLPIo+Aiko
 1YtGB/wO+YGdbSiT/sAaWpH4F7MPaKpOP6u5ombiMKD1jY1fO0NYnKDviwkkqiOPLWRRVrFEmRE
 +Piqxk9P0ZAslUYqub7LSouPvPX/tZFgd6fScO2IF3Qcco4tmLdBxCgmKpWqtqmy4ALY2aYg63G
 nytaNqcw0Cdz2zBz0VNm8bwKZofITv0fyMcJrfQghHBzITnRW74DTBJgWg89tHY69TMRzRzsRMT
 B29nt87RjXF9BbuWLzKdKogbhVGl2xrE2xk/jhUcPYtH/heblHz74nSPSAnC70RJ8Vi5BInpJzy
 ScdtcH3nxrSSZEXrJ48+NCv0THnInCInWC8xqVYPfO3t+0kP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX7iHPI2I8PYbb
 8pG//QzghnerBvPnlj++oWOFNxG6Z/gavSCE62hNVW3mDsuGtanWXXuPbGie0U9JuSGI8HrLEa+
 Ot93dmMnFoiEAtG7SU/9HoLXMc+BX2n+Tlf8flS1QJicDe6tqWV9dx8/7s4fmGwhiFydFb6t2IC
 I9pUdFeIU7Xwd7MDRVk9hiqwxJoZ9pI5N4KASEtQE7jm0TPV757Ghr4QxA2jWq6rDSRsO2gVEMB
 oGnnYcUtYClV0PaXJZDouAFn3S20sSIloKV3Y5eloUc4P4H+x8dMZJueOfWtciaZKflw7qkRwr+
 R0qzawPCvEZyu4oLjllDqGnyhgQR8JVcPIYYo0QrrwxuEUSGFFIgdIUoeXXpIAzjcMlwLIE30Ir
 X6SSODtC
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689707f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2AyblLDvhnny8Bxd3Eenz7HVPn92vKxX
X-Proofpoint-GUID: 2AyblLDvhnny8Bxd3Eenz7HVPn92vKxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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
2.39.5

