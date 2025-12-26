Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF6CDEE36
	for <lists+freedreno@lfdr.de>; Fri, 26 Dec 2025 19:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44CC10E138;
	Fri, 26 Dec 2025 18:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDcsmNnT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUpic+Bq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A0610E138
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8blcK2454546
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=; b=oDcsmNnTZ0m2nizw
 KmcMrHGjZRbMLBqSg0rlIwMt+oOKdJdC6koztAYRviJptMmBLDjIGERh/K3jRHFY
 hs/LXoqzkYXxk3qP4E7H8LR5YUKZ5RJa7u17tVhtV/gs6ZvzRbwZZdxPkLP6W7kA
 TzZSi1SqxG2UTAt553Syp370aNwdXezHwIKm/D6XIq34Eoq+1ftxDhbiGEADovdC
 kzOBHsmRjnAR6eOuDXns51i2slrJaXiFmZJpL7iVvwC4wcYdqSh3XLcypRNuj/yb
 aJftMUANfcFDFZV7a8GTGrgQFTeYJnPASGX/2CtbOEvTVIVMIbBrH4nMkyl/llFv
 H/SFmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe4u90-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c213419f5so7169506a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773818; x=1767378618;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=;
 b=PUpic+Bq0+8uTJKQ+o9RlO0yQ3sB+yh4N7xENGaO88JnQwzy0O5cIK4qhV4ycyfVv4
 HTIz4AybbxfWEkhNn9Amg5LVaGCStQZpq6CUzkv0iJ/MdVCnOjmUHj4epdfMQXeDXM3F
 fE4rtE099jyZLtE2ReC1ac9629Pgc7OyoYH7kKlX4j5Ov43RI5A0PXvacWA4Aypy/nZd
 OplZRuwgJraU8/H0O/Lo4TTtc56D2VibaQOjaqj8GyJMfTe3Tq7Qr0cLAb6Bd/RWtRqA
 q5d1tIn9rTLv3fwGc/bDBlpsq1bEIrFIoYYZ9XgePyDUu2s7t7MheZJDMTozy0B0EaSw
 dU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773818; x=1767378618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6Ie5hriCo7ts+dnv5WrjYrSDf8fix2GswPegCB7Q6Gs=;
 b=JRSJa/Zg+kF+FDx5Pen1vQJk7tf0uZh6etDwoFf9ZtXV6QAcfLJuq6JWiMfKV4oDnf
 BGEmdnG8TVvQhfIhWSquKaWHxG+ER+9kjLvrBjgi6aFQV6X1yGZ9u4NFy6yQVJRKl+tX
 eO7byRuLGUOuZ2Ad5udP3TSCC9B/bUljlOlPh9SwVsqRGLmqxcQuNzJEpGe61BxfWAby
 1e4PqZYoq+QfufxxFibC53h4Gr5y6huxLqid2MSOddmyGkF45KAp4aHqAxNtOSre7YF+
 U0VobM+BC1+TBVq3tCmszObK3a/YSPSQRWkB5IDyTUXpPsxilLKpEc2C6c0nj1TA+CyZ
 HyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrk/27dxPExKbQFMdcnyIANj26Fw6HhqC4Ipt/83WdNZdmUGn2VUgYLgq34C0x0KLy4orkugeCA9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEezvDU3ZL2k2+zYmdOR88vp+R8SL0X+VGfaI4t0XSaMeLiR6W
 rx3sPilq7Q0CjffaZCavJl3LKEO+CFzId9bGha37PiNBqK8RnLRCJpQn6GNnZkPmXF0DS2JyRO9
 I/gVWGfrgujDETJApUyQ0GEp6GTSuVrUQLc5+htcy+jVGBZnFrb1VgdwvWno8QarH0TIld5s=
X-Gm-Gg: AY/fxX5FTG6YDy0ZkHMQNeVe40cUk5FUFp0KgeRVv2sCiv66YritDNlmfFHjeBPKUAs
 6HAwoM52epZ0+1qE4JnkiXOl31V5v7hisFqnsga4ZA3ZK2xb6nbZegq5FrHJi+Uu+BB/9Gr9IBd
 AFhC6C5/TOUJ6NZkXTVPV56WAobdr/NxEiGHgRrIS5AGLrSAE+ImXddIvDgtT7IcgBqMvS+f0pr
 1Ip2SUPtkoPieli1K7Y/5Ly7ObXgb1ZZJw7xd9DjvDzJmz1YvwCOP5if4m/Yl3EiX3s6jZsMpeZ
 uAPyBFSmP5X+biQsX2tbRdRRPHA31xFe/8XDjkmK4JjjIV2ItHSofcVBSV3yy8zhr84pQoi6iDH
 BznKbhJZV4Ihw5ZQQ/lE+l85srKc9pOqpBA==
X-Received: by 2002:a17:90b:49:b0:340:ec8f:82d8 with SMTP id
 98e67ed59e1d1-34e9212a245mr21750057a91.12.1766773817958; 
 Fri, 26 Dec 2025 10:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6arPAm4eu93VUri7WcDBR3B52qY+86NrPjGiLN2KtKlUGWoZTL/KM2q/WV1QkkVto1WWe0g==
X-Received: by 2002:a17:90b:49:b0:340:ec8f:82d8 with SMTP id
 98e67ed59e1d1-34e9212a245mr21750023a91.12.1766773817446; 
 Fri, 26 Dec 2025 10:30:17 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:17 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:35 +0530
Subject: [PATCH v5 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-2-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=2645;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PEO1TV4xiVpe7ckRjCFNmBaI66ohIGEJLpxfUH0hRuk=;
 b=a4b+MVsPOTuT9p8SgjIh3eaPEksCj793CCqs7OEr6C386a9kvuOUo6lYSlq/neDZ0y1FtE8EB
 pgO9vsTVUd7AnFekrTegfDpBdE+La6CfNGplP32mPSOnzqjUJcTwWk8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfXykLl7GRk3xLc
 l0F/kaB9GAzXsGWGTL1rANAt3mb9P6m0PC0PwTg2Q6f5ES+ydbqyM/TVzsfSHu7hLEHU1mlHcFO
 r8K98layfDkHwhYHtGDQWDyJaZVfoo9KOkjsSb5IjyEqFDGjh/s3BtMXpbYWC4I/c35LdfSrohN
 lN6QYaU4O0DvHZk2N3YgYzrCkMTvg33n9nEQXM+E7A29pLzp8p/pEbLnR75efieq+AvaGYx8Fns
 KSwMaBevgzriJcwF5J/8e+qBxfiQp6NqWm8kBkl6bvDK9tipCZDP8tjVQCXU3XTayIsPJGboPIO
 RQYu3EKgqfS0H0jmBGZpN7ZvBLHbnEEqEgw0gdsgdmYrcQ+XmiyChEtZPZu3tu2N8kQV4BZ8vOz
 WfoQQZjXOh7o/zoLzElVucPtSLK+pI6IhiP7B3/5mOLQ9UAWQJG2j8PpcVuUGhGjTsQrYyA+k9P
 +djnOCa8ZWU8zZl3Flg==
X-Proofpoint-GUID: a2AS704C42vYHcVG4fr_b6lln5mSW6ee
X-Proofpoint-ORIG-GUID: a2AS704C42vYHcVG4fr_b6lln5mSW6ee
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694ed43a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173
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

JSON Schema conditionals can become complex and error-prone when combined
with regex patterns. To improve readability and maintainability, replace
nested if-else blocks with a flattened structure using explicit enums.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 56 ++++++++++++++--------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20be4bbd7eba619f7fe172b6e9a5897..5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -387,26 +387,42 @@ allOf:
       required:
         - clocks
         - clock-names
-    else:
-      if:
-        properties:
-          compatible:
-            contains:
-              oneOf:
-                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
-                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
-
-      then: # Starting with A6xx, the clocks are usually defined in the GMU node
-        properties:
-          clocks: false
-          clock-names: false
-
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-615.0
+              - qcom,adreno-618.0
+              - qcom,adreno-619.0
+              - qcom,adreno-621.0
+              - qcom,adreno-623.0
+              - qcom,adreno-630.2
+              - qcom,adreno-635.0
+              - qcom,adreno-640.1
+              - qcom,adreno-650.2
+              - qcom,adreno-660.1
+              - qcom,adreno-663.0
+              - qcom,adreno-680.1
+              - qcom,adreno-690.0
+              - qcom,adreno-730.1
+              - qcom,adreno-43030c00
+              - qcom,adreno-43050a01
+              - qcom,adreno-43050c01
+              - qcom,adreno-43051401
+
+    then: # Starting with A6xx, the clocks are usually defined in the GMU node
+      properties:
+        clocks: false
+        clock-names: false
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
 
 examples:
   - |

-- 
2.51.0

