Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E637CEB931
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E326F10E99B;
	Wed, 31 Dec 2025 08:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBFIIBQZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOzmgxpa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E273C10E67D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV4AWCY714846
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=; b=fBFIIBQZm4j3IfW3
 unEXOe0yc8SHr95y8bLxvyWdpxPQPk96ExGq8OEv38mNd/1L0fEJxsF/21vWUSKf
 BcC6J562dLv0MlXo7pG7AbEHYpHrvH9+3buDcRoT74GI56gCQvhWnr2mrauKaGIn
 r6hCjCdtG6dXFrdMqh7te/CnFRqwg/cOVLk15E/OAYp5DeIqpf9iDdtHdUvtReKb
 kiEjmldCAP+spTYwnzjRgsxhwObjwpeykPftxboUwRozbttFD9Jqh8LE1Tn3VUU3
 dUqSXgmrMKS8pwhIsZ9be+oD8STpV5Ju8Qp2ETEFCEkiR1uQL2mDYQ9AePmRM7FG
 5l5d9Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yt2r1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b9208e1976so19548970b3a.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170767; x=1767775567;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
 b=cOzmgxpaZpMpS5AlcU2qFYsUScq8YTfFcLT5+RB/MVyjP4+VpmbW04o7hyaG+soWj0
 /WQeiFAoVRVae5dUoz49qIgHIW7uw9pwFNEmmnwj3gLJZWyKeKEv+jntqa2tNiwKwN66
 X9Lo/9xh9u747U0ClssvlyLhFefU/Zx3vKiXYnaZ+VU7V7CqRggiZyVaxsB8fMhpBmy+
 wsBelSzIeYjg23aPT6EquS9UgL4/+hAKHlyUEKENtGORrMO3/a2ZoSAXc5VzZwLBzwQY
 ToRomLBgPFcfSo2Y561uobsyd5d3QEYTtj4YpQVL291UMazAjCanABUYKU7DdAuhZgR2
 sSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170767; x=1767775567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LHdgIK7rIVdHeDRXxeUpAdW6FlQ9DymFt0TcCA0atqE=;
 b=EWoHMhi3wPbFmYA7Zhpz8IBrV4ZtjgrhW1UG6b/9RsPq/G/4+OvKYPmtdQHMLUAZmJ
 Osy9TlP4fxrftx9sVavaOkCCxZpMdivfOMnv4FM7XcbflZzhtag+MSG/ofbSe9P0lLyE
 iq0K5bBLRL/oz29ZA/wR7/BKoizCttvem4/IWWdjdvEyRUBof+vTuh4oO+inthoUA+ql
 Yko6ErxIfT64cEAajb6V0zT9QQTtqIe+g3V3LtACHN5dNsk9DLtWoILrR0sw+KBLz1EC
 izoE9Z9eJnFnDY2DaIGqSJ0eIZ+T6ggalOTOSocZ6JqJytekjtvYDrWtMcK+vq8CWBIi
 ryhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZLUj3r4/Eu9H2imUeeCdHBWv6qobQJ4y/0NPpfKB6+ova76JnZDa3JeWOiTjTee5ti+XPEayCJ2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWyWx8k4XFtSNSSF0tzx4JHdTz2wW6mWxtDo7zSIJiHqpBabSg
 ZLj2fXKfMJcVdqT7jzcVTuCSzrfzrBpmNqkYuFHuhzgdakhkxD/TpyNiPUz6nviPybVhBVGrTkf
 sjaSX857tu3gZ7bDeRb05Ca+YxqFkZ1M/9mxEh2IS2prifTHL3t/XgR81tzluTYi9+t8Kv80=
X-Gm-Gg: AY/fxX5rH0zT7NFlC6B81hNeybR4rKb+0L+5f17rvuhRxrU1OUSSYVCH6vh5LSF4KlR
 jRPP7ejao6+PrMS0AnYkTRr1M+9DGIWFxJqQ4h84YJpy7yDTSySSrPqzjx0Xjhz3hYT6tuWUB9/
 kEVl44UVKvBmpUE+sa+8+ojq/jHcRSa0PnUmPRqZCwu30JxIBuCP3+P4ADQEosHOtsh7Qfm7SVl
 D+KFBpPjjf8+efhocwjstlcDBv0B2qGdV13rgJG3BuW8UU5zhMd06iGaQaIXRrA0bTfj5TTv9kp
 9Q+SoOJYwzePUkmWWaU2HMfEpUSHorVPsqfF4rbVjv1ht6Zn/WX5l5PEBkoz3Kc46DD0tifTUjF
 h8PkAZPpY8B9KUlPp45swDigDXyvmcEysHA==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id
 adf61e73a8af0-376aa8f3946mr36073252637.58.1767170766838; 
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaGppZIEcNFj7h+K5+adlAthXR0ANkOoGwkAkNm/WxOfY7fMuAjR6d2+dVPJ5qc03dhZ4wOA==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id
 adf61e73a8af0-376aa8f3946mr36073221637.58.1767170766327; 
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:24 +0530
Subject: [PATCH v6 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-3-da87debf6883@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=T0aJD33DIX3eTHbNDuhSmkpxxHoTSUhKHFqgSnJxirY=;
 b=RchQq5wGsT96YNkpPSE1H7vENdCVRpxN4zehwiDWyIAOB1DybAjhppVLFYlLjna0sCObQVg0j
 291CczjEsrlB8J1o/dgJ/NLiq0pVuTFAyvrbJ6Ubhq08VTPPmegw02G
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX5Kgn0m+88qH9
 bt1mENnUMgk4PBa4B54Ss56MlSQwuo5K8RKNYlqI3H+AiP2RxvPldywWEkJl3HeAkUqKGT+A6Os
 7Qy6Bfa0GACySm+vPQIPGCSKVtjD46qB271kibM2gmgY33X2TB3wrA5vCTQwkzAnDTFy89urhoi
 M9JRUxFWkOyoQN4px322FV9fKcbkOMPCxG0h+IxgZnVlBE5KP+QVRo+yudKbeedsMe4TvEbGfMp
 X8MXbUMKcUT/MPTVekpmEL8i6j2YkO4hX5ZPiHz+EjrkEw5vPJm8x7YnqnSdDJ0HiojL/62mVbS
 QfhNkxTyVIa+bL03Bxs/DTnSwXBvUpok4oH5LmbtAvKqymsQGTvDp3IU+44aQkti9CUSSAFuA0H
 Cdtvfohy9JjJBAuB0pD0UPcP/QS0Y3vjIRtNEO1RuEXCeRr+gOx7/TIYjPk7Q0m5GjAoRuVKz2d
 jQs4o0AyDQqP8Q2EKRA==
X-Proofpoint-ORIG-GUID: 7aWDygXv5q7zIfS73GRdb3RErN4kENZd
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6954e2cf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 7aWDygXv5q7zIfS73GRdb3RErN4kENZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
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

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f..27ce88766dc5 100644
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
@@ -388,6 +388,35 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.51.0

