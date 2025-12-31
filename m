Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078DECEB92B
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BE010E4A7;
	Wed, 31 Dec 2025 08:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZDTMjA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyIhlqjj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7FD10E4A7
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:02 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BULeX5t2551807
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=; b=b8ZDTMjAV+UprkMk
 lGf2q4930KFS1mLQcwunPyXT+0dDHB1M/eNURrx0Or5TOZCTbZnYDMmP+OCrShW2
 OVWJmMuTFV5s8/iurnXfUPO5DOSy7NSl1pVswd+FCkQV7byEQriSWGr3PxNe1SZH
 F8KMZ3iu/J7fuf7m974j2Pue6LBj2N847jsUB39CLogD3uEZsgwQ1E/O9ZfBfMuh
 v1qZEo6bp2DH0M04cHn/CKkuNdMdEAEXAV6JeyREeXi9L+tbn3gB69J0HQsTkPfQ
 ylMYKXoros8Cub0kUa16HT3r/0dkemqFE4Bfw62d3lyT8giB1fiTu7wdandgNENR
 N6Q7rA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skky4u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c5d203988so22500522a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170760; x=1767775560;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
 b=hyIhlqjj4z7a9WraBxix6yH1VZzUbfwID9rx3PvtHe3RGqks4esJ3fxNBzyNV9X3uZ
 fb4lxo/JVLNVZTlyxYMWMn4SsQ6fsuCvSw3Sp8PCs2g/VjRCo4xSuZX3TSZZa01Jnh1F
 jqbPizLj0yUAeeyt4ecOVXmH8Gm7lQJoQ2jwO4xM5POddhCsHlLGwBj/HjTeoSRU6L0C
 U8lhXJCOsd28gkmVSX6W02Y9651hgbdPQ3D7+qpnqXNXdkGsvgvH4rd3YBtf4EEUdbwd
 eXa6tH7EQPLIE0D4/PALO/tEPhTbftnhFdp3SgcePb2KnRWMtrB8TEBEpdoAEMrkw5h1
 Djdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170760; x=1767775560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CPWRcnVAsBr/GyDsy1wxzlUy7eBR0cR6vueWTgWJCOc=;
 b=TR7OhkKzhYMCO1yjJ/3x4WxCJtsH16Nl5xYaQT/XTbM0PpFQO9MTKYW4QM5XZXTuD9
 WZs+hHajwuDor9r2S52BmiIgfRAJz0vgEeVcWkPetH2MAQUUGb6lUw8giIII9oifD/ul
 EyXRIEhMJBRq4nLNb/pxqjV68QEGu78zl8TRJ+BPUGwlLwZB7NIqhqY1QMG7LyHJqvmL
 efvoTPRWwoYL2Ha4PH0ABkFTKY6sjaO380GU1QOhyTHHzgmNmWbEP6P02ogQ+Zyklj1M
 yLchZYkC1Lalw/i4Wub2bKeBxayoOjL2V10d/QPBrf3hfaOEoO5FSg8f6oiTrzo66yTz
 qfkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULCsnqjZRZj/HdSupyA9gU9ANYUmKCDPRCzPKTtcu+zZVooMk8pPZ9cXXzPaiHQb0Q3JDS/6OFCW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzqqdR82OpB67kDFH2uD4iuPHRGBBZlmMYPA01itb6fceD/S2V
 9vNQR5FKgd7Tni+5sfpoifhFCCNDeDgi85EmG4ROx52/VoWddZadPF4rOHNlSIK6bQ5ls9qd1NN
 eIdcrJIsrb1u8NskrXZyYFgTH7imuE+msW4EWHm7Fl4tb7y2FDWTdux43/gwpckJYLxcx0z4=
X-Gm-Gg: AY/fxX7zISb41q0FTEbrYFDlHgUN1NSwphEIB7fAu7u/AZt/1nYA+040peeZDD13uxh
 RaJxwZldbrqjiSIKkSmZKFpP0k7Ie+pGHpf1hqMobr9z8iTihPfmULPYY9Gw5KY0G6J3QAEaGuH
 DV9Efe3E/9+QKCrU+w2YMrImofr7X9FGUhsk/gV5Sf98P2Mr0B+l4Jp/5p6N7MBK3eUGSZpk7N4
 CO0zOaEJdru8YyJtAmgX4IZkOKKOhxP5cGGR25QyQWUanATnVbYn5VesQNqKCvO/5EfCTba4NVm
 uWmeMq+qYQQ3RADSCc/umdhgqLl0LO1ilOsP85vKDGf0Q0Y7qcPANQ8v2YqHM1dOgKvxxCyEM1+
 eyhzevnuZRfgLWQ7OdcqoH1MirEvh0Xjpyw==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id
 adf61e73a8af0-376a7bf0c5bmr33126322637.30.1767170760462; 
 Wed, 31 Dec 2025 00:46:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPOg4abWQAItTWlyZTTd7dHPOf9V13Fb5IfDDm9V71xWCcXMRJSLtxI+U14N0Ld/snSkxmwA==
X-Received: by 2002:a05:6a21:e097:b0:371:53a7:a4ba with SMTP id
 adf61e73a8af0-376a7bf0c5bmr33126286637.30.1767170760005; 
 Wed, 31 Dec 2025 00:46:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:45:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:23 +0530
Subject: [PATCH v6 2/8] dt-bindings: display/msm: gpu: Simplify conditional
 schema logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-2-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=2589;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=b59YgubgwvsRqSeGZjcLSpPFFQKVSgA7ctQ5ydCIlmI=;
 b=kmZq4Zs08vLy/inDxy3PCYbL391nZJKFzBZh8G/C7WZIwdj0BYntTnVC4yAervS5lHaC9a5YZ
 KW4S5S8Kt1jBaqXpgIf2jXNdr5iXIjHhRLd1AEQ0F3HuTB7RCv37vlU
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfXw0hRc6+O0Uco
 q6PA2IZD+ww7CHUMoRN1vK/z0bu7VfyroQLgW/ERD3TK7jKLPSfLH9RyGTd8FmVWuggTtpK3U+j
 lTVYzQSN4El4XsAp0XXEV7hc9GIz5v19I0BffNcIcs1TGDvKjrUQtoLkF/i8PFMPB8AXbpl6YvS
 pGe/V+OZeA4BgD1Ntae8MxDDZbISdzTOB5qjGDKkun0J7iaA37a+TMW5oRJzlBFtUWKXvumIDJP
 QFnB1ylwGZBsW/Dz+L4EJV9hKT7ct2VpU0EPgBGTiuU/RZqKc9MmaQvwrfmD3RzMEgi9771lObM
 JD1byw5RrlfvNKA5tqxBlPvduPIci5o1WsYjXikvvB4ReqcvZFRnFlY5eXrWlcyTEEIzMIReLlI
 POduCxGd1yECBnhdgg8gWaIT3GL9PVO2AWgI5xiQZeLebwRnqEBJh0tCFcSNAxh70/BFTEvCFW+
 98kCpI9qa+C4Nq+1raw==
X-Proofpoint-ORIG-GUID: TaDFrKuoKPA_G4TJgWVNaZm3F2_NeFI3
X-Proofpoint-GUID: TaDFrKuoKPA_G4TJgWVNaZm3F2_NeFI3
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954e2c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SNFa__NYaeNfRMWcEAMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074
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
index 826aafdcc20b..5c12b5aacf8f 100644
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

