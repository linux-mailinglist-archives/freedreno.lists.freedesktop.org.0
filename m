Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DEB0AEF6
	for <lists+freedreno@lfdr.de>; Sat, 19 Jul 2025 11:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1378E10E13B;
	Sat, 19 Jul 2025 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajGrBT/U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5E710E0A5
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J8Njbq021973
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5wZDc5GWMWk
 tbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=; b=ajGrBT/UWPZPh3lDzNJCKksjJ58
 ScqhDdABcfpZ1w+Pw/FlHyanswabIFUYVjxiW2c0uAWzDWRwhDruiy58CXBe0OHV
 tYpBE68t5FVXquVTi88ZGucL9ul5eejn66A2LNvUqvRRgMg06QXf59zjKFaLuEBT
 zR+jQbGo1syi62E+OhIjEf5iTcn20thjkNH1cVBk4+XztCEfN7mSH9aMtbRzVkpb
 riEdOQqJSPb1nrNToDEWSsDUyFU9eeosMMGBXXfa/H6gvhX3ar95EbIygdcA6e5l
 icOxtA7C1CHRR/J/cQFL3S0tWECv3zJR3n5MqA/1tL76U9qbiHl1LZydpVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048t8cpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 09:14:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e269587d8eso493847985a.3
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752916488; x=1753521288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wZDc5GWMWktbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=;
 b=wKx+l1MykobfJtY5gHfJmtOKdCR1bIF28OzJJH2I/6ll2tW7ebMej25G0PUA+werXB
 IaM2vHcySDaWj3Aq55U5ZVYmkVLjRogeMTUmeKpwIMtN0bMu1e5/gPzenr0x07V5Pxiv
 CA8YarwHz5XtvtV03RNXf77oKI5sUSS8cmQu4iiX8bWIRb1VVkARdQ/bBdGoQvdfVzgd
 /TBNEN3bHyHIbfH0eNvAo+8OS+rj37MJshlOMaAlgeIkkx0kiOGzKXJ0v/naVnpv7t9j
 D7E6pDw2UKvR4WEfZ79OLrjdRGT6bT2n/kge0Bjm28mnPccU1Y+RQ6CJA/TXtCRa8M/J
 1rqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkcbevJv+BhfJA3sTzLzOLLZZ3dHH4LrdHCZaiMcKdt8JpYMiy8+wT5KuPdAyVtafFOGO99wk8UU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu/TUuq76vuC3QL6K/SVw4Gntl9C1qXc6FvWp+gTtKeAEt6r0U
 HLnasCSmnZTZ/MsgdkXedjdJimT4zAxWLhqmZI6vx8Wr1/Ncug0q1WFCd1cM+6eLk20p1HTyAjg
 FvG0+dSTthPnT1XilVDBX25kAZTxt+NugOCk4Zpw1sa977fqaQyG4KvkxuMYDhZMqXQ4Uwu0=
X-Gm-Gg: ASbGncsWURb1946TOay7R32X4mWvDkRwXk236B8geZrCXyIds4SRo3dwjKeE1kqBLED
 T6kL9KOZ9wy9oOAopCw3gkFWBJLgMWqbi0P2qtEW6IUC6IzHrT3Lj2LbuUa1e9L7JbLur7Ip36/
 qe5zmagErv+08CR4VHa/Wve/19horC9XoLXqAahl3Wbc6QQZt9k0jjlccMLN60I7rwrb7y2fN7O
 gf92QEtZYBXxsSqjNJFYWn+qU2ukTEgGE7Na4gTEVwqZ0I3OwJ4jImAhAA2uUi+pOK8U99an+Qv
 Rr9gWAce/fNFNGKLAdFRM8oWH3E1G8S8QeJVszTMwoSCdcrnbW8NEFOzAeGVPrQBm2TfBxvlRom
 cDDTH0SNH1xuTFLnNAAvZAhxDbSfYh4Q+RtszVO/Lepeymfr8jZpZ
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id
 af79cd13be357-7e34d9f79e2mr1305488585a.60.1752916488072; 
 Sat, 19 Jul 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDAN35XkTBQM2UPvbexmAbV/sfM9zAiC11TqR3XTg/5fyKgjdicRbMY+x2+0LlwRcobf3JYQ==
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id
 af79cd13be357-7e34d9f79e2mr1305486185a.60.1752916487632; 
 Sat, 19 Jul 2025 02:14:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a90d4ffasm5480891fa.6.2025.07.19.02.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 02:14:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for X1E8
 and SA8775P
Date: Sat, 19 Jul 2025 12:14:45 +0300
Message-Id: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MSBTYWx0ZWRfXyxH11OoyXlGe
 LaD7zy5vLiXu/o9KLHPcMfuGAxJuRkbZ802J1hgAMSuP1eTJtg1HCdyjOM3yQIwPGZXeRN+48rZ
 Zv5+VzyEJIrVkEanq6FO0JrW7Kik4yLmcvGqWci5+MMPl7oDT/+TzLPrtkWV/KjSOOFSuPO2ujy
 yGxFD+zjqDhPX61Cz2hRHF4nYks1o+otVFRZ+dzrfXdFXtReyyZxO8B9VKbsOa4T3Vvn5JADd66
 Zwo5iNmitC4o4KW8w0B72ilm0BFuHZqRCmhzPDXxRsAkmbucyu5kPRLJBiEuCa2TOk2Q39iZG0P
 b1hJs240xu69N2NSoasZd7K9Kx5zTW8a2Wcdjreeevm5NTmhFChvgsukF8NBfOafylgH9Ue0bV8
 VuIbCxQsbdCwBTZyVl9c+umi5gsGzJZeaLogUaRT3rxf6ngwwi5Nalnl6QMbmF3BJmwJFCFl
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687b6209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=jb3qBSlP78txkkNFhucA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wOPpMrtstpiUq2Z2ySw8g8Vh_1rFlipQ
X-Proofpoint-ORIG-GUID: wOPpMrtstpiUq2Z2ySw8g8Vh_1rFlipQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190091
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


On Qualcomm SA8775P and X1E80100 the DP controller might be driving
either a DisplayPort or a eDP sink (depending on the PHY that is tied to
the controller). Reflect that in the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Jessica, your X1E8 patch also triggers warnings for several X1E8-based
laptops. Please include this patch into the series (either separately
or, better, by squashing into your first patch).

---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..55e37ec74591 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -176,12 +176,26 @@ allOf:
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
+                - qcom,x1e80100-dp
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

