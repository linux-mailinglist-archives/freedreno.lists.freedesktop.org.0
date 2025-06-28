Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57BAEC44E
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 05:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14F410E12C;
	Sat, 28 Jun 2025 03:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YIz48+P3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0510EA32
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DA70010142
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=; b=YIz48+P3xsJXg6wd
 1+L1uf4/U9lp4P+97DCeZK9z60HcfCWiCuAPDmFhVJWhd+rPk9W3cxtGm2jBrDKZ
 9A6UlpxGZ7WXAW2i676ZQ61jT4m4dO5Vx7Ic99WwpvbjDnYWxnhtikius2Mw7Yq7
 rw49iMfS9AK/0r0qaWsK4cFALEl/GuXRMfIDROukP9275u7QownKubnKesR+Z3Qs
 tU1sCb9FsA7pG+VWGCvaekZ/p6b3YNJqyvIYhZuJBpMaSeF39bQgoF93v9tw5KP5
 WtNA+NdSQcQaZw2U0kXIvhbFk3o6ewx8rHK7sAF7ULi15Ti/2WDi4UxfJNLXre1i
 X133ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg77r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c955be751aso424128985a.2
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079767; x=1751684567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5aR8fGjAivIsW8Z1WVaLdu7x69SPiAPyD3BZFTe1eAA=;
 b=H/TpPoa5vj0obJhvOI7pc5dpfyRga0XvBNblUd3McvXTxYRV1FzE7VE+ffxm4fpoKM
 KFyoSBUeI38MCmiwWHvMCfXF/tGfUMF4qIb/BYEG92VKHMaqrGknWlb/GU0JghhwNzSy
 UqNk25qRBzpmQIwFDrL76ErNm4uPdFuP2pkEBNiciMmnpPz2+dFPv1EfakqAh1/EtLj4
 1SoNLBcQg+PrENXa8AdxbWxG19wmHfbTQ3RLgAulAJJQ7ootxnh0+pHu5Io0fSYls0om
 yUXxbRKDr0PFmyckxSOkn8OCmE+bVgB7UT46A7XoifM3iKZT8T3n9owM6FscMXgMmvRw
 bpoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLqM/CXsgz5qpIbl0oOg+c65ZPJv+RXHzekEDIKxGxiv1T40YoAAB4KBlVlleYKR6IQ4QlY1rSVvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYhS5PXzRd8tvPeej36AU/RsWDKRDt7u/K0rOAn93YdhbgMY85
 +9qrQeNRqK9vc+9Va0kAYbEQaIDXxpMpMsprZCJIvWwIsZmDr8WW9RjXRSt2rqmsJdzGd95zx3H
 SQmTdp/CXl9a0C4JrRIyLHtmAPqTBPuyMETMwWou2VVnChKXdu8qsuaRCYCc8PaIXPUhKN7A=
X-Gm-Gg: ASbGnctzJ+/f0rTn+/TPnMB09g16npxDVBh5jQpV+5sFKq1IgEnoPo90CfIxcchE5gb
 VRvBSPApyd01WnDjsKqGlQxxtjJhsv3WGdkk1c+fDJS5ophIuEpUT2DCC2G4BBx5kRVhJFsl+Kq
 uZJ9LlsaGOTI+3L6ubeeXBqeys8o4qYT3Z9fetToaAUlFN4+xS5bVOtz0c5xnet9EffCL0jXOQN
 fcfazRI8RyPlOJhm1k4rDtIt7wUDat3f7wlFU8qNmBT+ikfmpRySn6hqKg+MLTcqp2gs96yaXfz
 U0mM9QISsZ7f30qUvi6kXSmrznc38jLkzVe1mypZ75BnUHqwIbzDj9YuK1uRdv0TW4xxHnsAW9Z
 OwJUZba8uT+tCdKgBpoxHUaA05+wf9dwAPcY=
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id
 af79cd13be357-7d44399cea1mr913295585a.52.1751079766769; 
 Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeIaPbr6Eb6DCFi+U0O1m19Bb2BROvDh0XhxtlAu0XGoBDUeVMqWy1lJZwa8PIlZmHgxATKw==
X-Received: by 2002:a05:620a:1727:b0:7d3:9e75:6953 with SMTP id
 af79cd13be357-7d44399cea1mr913293185a.52.1751079766356; 
 Fri, 27 Jun 2025 20:02:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:37 +0300
Subject: [PATCH 3/3] dt-bindings: display/msm/gpu: describe clocks for each
 Adreno GPU type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-3-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8307;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=on2BHgBcWkoYT/ewSpxz+0Nn83q7soVlm475P3sXIOM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMJ5CQdX181Qavk2jRBSkDutKIttOYQLspI
 dO14GTIeq+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1Xt3B/4s/QVV4Tn7GK5YrC9I1uckXq9WeLcot75I7GKrsJVje+7LzUciGGirOrkTpC4SFrZbNRp
 WQ1F9qSOUpWQxcoqdEiOPuDnMIR6/T5IRfkXgGEck+VR0rk5D6HK7ek68vU6XKZIgACVCsDzZ1x
 XdF/vHHOV+FviOcFLmqQMmzxQA27jMobKgqDAnnGX7Rvaa7XEXbNmVAmlU7bozTiutDP7ZBuRAB
 WnV9AIMFgLYLyRcMLNT31R7X4OTo/1YuV/BvJIH0zf/SAwkzujl7S8guuhCJPkgeIatQhoDYsyM
 ZlNo3fNNCDcslxx4+/tFv3Blco1ZYqbK6BkpzLxg7rFf36nF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfX1l0IrkU8K+5W
 IyUhjEBTrgjbh29Z8Nmjqpm8q5LuosHWcqt2Ft/9OKlChRA0++UUANaC9gjSzJoe4DMIuKl/Hz/
 C7W3HzDOz5cW82YsKyRd3PL0Hake/+S5ABl7t15QkooRTASgK2isuMYD1uTPgxgSyQ1vwTqgZ30
 AEiJe0t8HXTm1FiRVFUviLO1ss4MsmTfEUIjEJQzq/OMVMB9E0SIiSNLef/aaF2hOp/lQIFe93N
 AGJ7r99dENGQo3BT1EKEj5qhlfugs7E9aSQdq0nFpmx2/BtZbU6cxMbr01CMK0OwMCtBVNCc8JP
 +74NXUuV4T+LVjFX8khywaO99WgOyJmkl5428BqiCBfoKT8IHxQUuN50eJvB7FTuMFOE99NN37h
 ha6eAxF+prwxb2Ux+YS9YbYwHyONtY+CYb+6dnnUFuiDynHamb7JbnM/1blfLrFjK9p76uU8
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f5b58 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iX1fKmmLQLlQjSsTkigA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: IMaZxLQHdyu7_uwnCtoVBxDpXzvTCiYx
X-Proofpoint-ORIG-GUID: IMaZxLQHdyu7_uwnCtoVBxDpXzvTCiYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=811 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023
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

Rather than having a single list with all possible clocks for A3xx-A5xx
define individual Adreno GPU types and corresponding clock lists.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 220 ++++++++++++++++++---
 1 file changed, 194 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index af43527188cefda0c127c4674d4667203972f583..7ef80f9fac8b2927b2a69100a7f6c729d9d188ab 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -146,41 +146,209 @@ allOf:
       properties:
         compatible:
           contains:
-            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]+$'
+            oneOf:
+              - pattern: '^qcom,adreno-305\.[0-9]+$'
+              - pattern: '^qcom,adreno-330\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-306\.[0-9]+$'
     then:
       properties:
         clocks:
-          minItems: 2
-          maxItems: 7
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
+            - items:
+                - const: core
+                  description: GPU Core clock
+                - const: iface
+                  description: GPU Interface clock
+                - const: mem
+                  description: GPU Memory clock
+                - const: mem_iface
+                  description: GPU Memory Interface clock
+                - const: alt_mem_iface
+                  description: GPU Alternative Memory Interface clock
+                - const: gfx3d
+                  description: GPU 3D engine clock
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-320\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
         clock-names:
           items:
-            anyOf:
-              - const: core
-                description: GPU Core clock
-              - const: iface
-                description: GPU Interface clock
-              - const: mem
-                description: GPU Memory clock
-              - const: mem_iface
-                description: GPU Memory Interface clock
-              - const: alt_mem_iface
-                description: GPU Alternative Memory Interface clock
-              - const: gfx3d
-                description: GPU 3D engine clock
-              - const: rbbmtimer
-                description: GPU RBBM Timer for Adreno 5xx series
-              - const: rbcpr
-                description: GPU RB Core Power Reduction clock
-              - const: alwayson
-                description: GPU AON clock
-          minItems: 2
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-405\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 7
           maxItems: 7
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: gfx3d
+              description: GPU 3D engine clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
 
-      required:
-        - clocks
-        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-506\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: alt_mem_iface
+              description: GPU Alternative Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - pattern: '^qcom,adreno-508\.[0-9]+$'
+              - pattern: '^qcom,adreno-509\.[0-9]+$'
+              - pattern: '^qcom,adreno-512\.[0-9]+$'
+              - pattern: '^qcom,adreno-540\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbcpr
+              description: GPU RB Core Power Reduction clock
+            - const: core
+              description: GPU Core clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-510\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: alwayson
+              description: GPU AON clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-530\.[0-9]+$'
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+            - const: iface
+              description: GPU Interface clock
+            - const: rbbmtimer
+              description: GPU RBBM Timer for Adreno 5xx series
+            - const: mem
+              description: GPU Memory clock
+            - const: mem_iface
+              description: GPU Memory Interface clock
 
   - if:
       properties:

-- 
2.39.5

