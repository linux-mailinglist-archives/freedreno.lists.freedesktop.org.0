Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7ABEAFF7
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 19:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DAE10EC9E;
	Fri, 17 Oct 2025 17:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJD1oggI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BFF10ECAD
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HG0sUn006612
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UwTH7o+4XBoJuJ+aQB1pooKD/6ls1YBf76KMTkN2sOs=; b=oJD1oggIDfiJdUlw
 ZUGUmGGn0/6uhJcBvn6tQqGPgLU3+WG9F4WabqSjp707++CaZ2bRZ6SV28uro0Kn
 +GgSYfUSmPzUI1AQ/BkS9vNuhSqgnF8+VO3THPtAbnM6YR5MFFmTEjxzphbxgvia
 rEn0BPPHpXfFD7/P+tgZB4E5g1EjT170Ff56riYG/IvLKe29oa7BqJQ+0F71youe
 UXQ21AuGbr1k2M5R8h64fhuCNhTgz5KwRS/YvXsVWeq1/6SulQA6FgCLQIx4cHXo
 GE2k0YRrB3ZhdNpYDXk5AY7sg5G173LR1RETrWH/NYXcPG5Nqls4rygaK1mbvGJZ
 2oFdNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff152fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2697410e7f9so53755725ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720951; x=1761325751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwTH7o+4XBoJuJ+aQB1pooKD/6ls1YBf76KMTkN2sOs=;
 b=PlZJhmm6csYUMBT7CI0tAN+DmuC5ajbkZ2kHnEzZkSW2WHX9pMxuR9MdWrs0q5uSQM
 lUhp2XVeV67zluZ7Mzud01qhyhHpguphacOHXrRs+FfZjMxgD5mc1mviZLlh30zn6SqD
 fm59HS+asq0nltxReumlV8AyUO/qcPET9yA6Z14sNMxUn/W0l1ynXqKPARhTXCWzhvQy
 +kQpzhvMEYGmb+hDhYTvgbLXb5p/mGTnF+hS1VxIVnIr4QOMbCIr8l/omgTeOQf/7Tr/
 1SA/LZpZb/lpO/4ZYycJd/SAid0i9ZTKdLtPpsSDlC9ECParKsyiZOI0rTNgR8el0gVq
 dL6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPXARnOv3n/FVNEzbRVN8XiBOHu8BnBY1/tsN5QoKNjrTS20fj8hpYV/1D4XL2ykrebirsIhtigAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTh+kOk19jaK4pPyfA16Mob0kVgSc0DR5//cyTvsx/YOik2nQA
 2zpNi2ELVl97MYkENPCRGzM1NvSNSJSZqiapFAMwqRp/QY/iIDCaRpcqej+Gd1y7Plm4+ruPnSi
 F/GFnG6q19vmkjmzKkgMIB/TGa3TnInOHipAJXq/WMKmDcdRs3f3VoGsIt7zj5fjm9oFnNS3uqO
 kCl94=
X-Gm-Gg: ASbGncvFSkEnBaeKpik3+uudQxynA8J3xAJpneDVIkh+DcVhvOL2ARVjun+frQs6blU
 ctesn/GZ4uKa+C0g9Xw1UDWaj3Tq5NeVK4kefKHve75bmKshIgeRp6SOwiuMm5kQY5GIvBP1xqO
 44iAMLFkV5DKSLJD2/52UvxD7ozgfwuZ9xtR9rOgdesRcLHnpPL5nN5T2FAzDJRTzzd4Lkv1oxp
 U9bfQbuFRiywNIBymXOaWJhBHwzEEPWOZJMIFxdkXKBfdJAsN6xDUxkSssuhH1HPJvf5IxEI4oY
 y7jl6j5MUOqRL4iLbsA+cEGdppOINF4VIc1Pr0RHuZgoAcyKzAR5q9v5g2SaDZ+gs3tGLgldkxb
 QeEsy8u6Laz9kzSAx2NVhPn8=
X-Received: by 2002:a17:902:f681:b0:290:d0fb:55c0 with SMTP id
 d9443c01a7336-290d0fb5971mr49334975ad.43.1760720950674; 
 Fri, 17 Oct 2025 10:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUb9LP/n6zFrwXHJ8I2abuL4JVKUjA/SfniRPodA4FW/70lC1MQrLHyQxLVOJP9P+uu32WNA==
X-Received: by 2002:a17:902:f681:b0:290:d0fb:55c0 with SMTP id
 d9443c01a7336-290d0fb5971mr49334455ad.43.1760720950092; 
 Fri, 17 Oct 2025 10:09:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:30 +0530
Subject: [PATCH 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-2-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=1760;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=fmPSoBFxIBBtZG+qNKbc/Y8PFtIvsIl44u/5OiNM0QY=;
 b=CidJC+6YIpgBHlxxquE8ugzG/PB+2dG02+F9rIWT64xQPn2fehu/vq/ntaaWTpRbuC8YK5AY4
 skKJ5CEpX/tDAlo3rsnQMXCvQj8m3Cqg//pKnlIS2RWohnlapiyEozV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyY+D2wsM2mWi
 oN0GqdLu8GpZHuEXS3vhreEbRCq52bl2/qJ7KyZ4wL669iE+55Vk8o4pwz9X3fQqybETtovdQuL
 Tb84phUxjpmhwPiQpqzFJGrxHYFA/jFlcwYeYH4W3QFbUbVfRc+zp8lf24lm6aq8IhYVjppgDT5
 iLCWifiYAm0iABC1mAixPstyiNSwVrZdMpRUZ8uU73P5Io24he7Bxh8qL+r24fgEyphQh8Xm/mw
 nPwfWiOcLh0SR8J35ihGGxoVCSOxIQcM8SQMpcc/ZP27YCLsVU77HnjKDZdsWqu5WNpjczmzf/x
 jiwtOYzEwJJmTdwaKzY8u5LziDNB6/gzNIviUkA1w==
X-Proofpoint-GUID: t_q_Zgn0qYL-kfHoe2QZDpLBCrbhKVxN
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f27837 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: t_q_Zgn0qYL-kfHoe2QZDpLBCrbhKVxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3696b083e353031a496a1f299d8f373270ca562d..efc529e82bc198e7c3c89a5eecb6f929960a8de9 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -388,6 +388,33 @@ allOf:
       required:
         - clocks
         - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+
+        clock-names:
+          items:
+            - const: core
+              description: GPU Core clock
+
+        reg-names:
+          minItems: 1
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
     else:
       if:
         properties:

-- 
2.51.0

