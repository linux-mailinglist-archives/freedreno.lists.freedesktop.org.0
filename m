Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18ECA3C8C
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4010E978;
	Thu,  4 Dec 2025 13:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZI0wMG4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3lH99/f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F6F10E978
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:22:38 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4Av9Zd1119242
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=; b=RZI0wMG4AwNZj/7+
 D6o41fFUa8EZodi/EZa5IVDSYUjbfaP5J1+AkNFHtXKlcefV0cr4thaNSbCxw5sR
 vYJt47NmR5pN6C96QywUX1O/37gaOCJywANsQ3oYgImWcAqrft58Ja3oIG/WiNJt
 V0O8HBWp4lqqIrWRjHtEUs3NJn00yiojqdLakAUwn1iSJvKGcgmES66LIYVbVO5q
 QSckG2iNsYv5Ai3SmOlYBpmZ8m5Ey5WlB4zt6VZHW/J5lGlVGYLAn+R9zcsLCWfH
 h+8mXe002XyxDyVAmNqeudxp4iqFYcYV+IZUgmhpskZxyalkEr7HDBd17xE/s+a9
 lQvblQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au90frc68-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:22:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-340ad9349b3so1628197a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854557; x=1765459357;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
 b=e3lH99/fL3+r3APPFzrYzQQNs0tCTZHgLSTKBrWRvfopnCxIvnZK1HYn7UXvWorhXK
 90NLQ1BcMrTiA1WMWdxr42ez+TmWo+1xiRMEEwN7oPLn3jx9Viax5LKVkj/HiHMOMMrB
 /w9TSZ051+32LLsjTjLAcVdsLY/CbhRNKtHoMh2a5NIVS6ZyKaQpumv5hV7rQ7zz73p8
 TbHUUB+JIDbAiUqsZ281Pq6dOqLSpQMF7IHXO9UGRDaIjwX6a3WwxyI+rHQj/kBl/asc
 HTy67sNZpgoSQQRgylQ2SRCguqbffIExxPhLO2JkdqrHRgKLqoNi06xnH/NgeVx8JuXp
 WMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854557; x=1765459357;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xrwxcmbJg6cVbMantUgzlL+o9/ix/U7MTWE7Yt9Jblg=;
 b=tqI6XaTffXgF4YwqhtklKWbp0bBIGjRjk4xD7XtsvSsUWsXGlgZWHrF09CWbdP3WBc
 xCa8YoS6MBqNT0vsIEPwDTUUiXfggBGj2IAJyatVTI62zIP6C60ZcfxOlcgsXprdxGM2
 tej9mW27UXAQR0ydOBGSsvuwyXWcotP7cn2Dzl0JXX1JeQjGx8HhfnvdevdH9SMq4bQ2
 3qwnSbYYaoFdjOBZ2rhrOCgThUvIgIKYPEULJJKXx8Rs2ZLqa7r/DtaemGTEV7O5d25B
 NaWDL1irjRLlxFW8YwPPGMsC/Yj9obzm3tpdX+WkvFhmzIWLj9Wn/nymvD4O3HyT1dfl
 NxsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzepgTniI0sHy780TnKBx3XWRtvEl9aKEHjZOJDhHgPlVgVek41HcB+myLl8FrU5/lLSuOhp4Kt/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy00LSq02E/9/fWxvty1dmOZcxKOlREAWhNUtaQ6Y2ZdEiVV9M4
 x48eO3VoBmsrvUCK38HadCehKP2EYhGeaWm7zhKeXnVqvn6EmssdrkWMP1pSuMFllhR2MTLRgyD
 33lH8CopHOa4YdowFK8UeJb+ZKWtqyQh4ZR6L9gCJJmdYDrlh3FGbIhP25V5OyLZDFiCN0LY=
X-Gm-Gg: ASbGncvJMyD66HLhtkSKhs3QUTQJkpbozTVfChFyNkkp+PwWAOSXYKZA1mCjKWwdhPl
 pbgHVb1Ex9CKLunoVd7ulwWxlhxH+osgvGFj4k/r5Hmww7NwE1vYY8cOakdFwvOHjP2G5Bi64vp
 r2mrWfMW54HnC7unAjulgCka1g1tyvxe25cus+VK/eQZS7DWdVLh66dKFEsk8aHX5GkiqpfAsb/
 BTGmLucGgDUDea0oH2ySXnRk5xdN/saCuNQVlWg8GS9vIYKl59XWiWrV2dTUwudn8h3F5KvV2Xm
 YUOYvFRno3JzhsdSRpEWcXzWDdQu6p8v/YYnt38Imaeq+HgbZueix9m9vKQiF2VPLSH5gvErSr9
 fWwOZSbrLACHrNbF7HlCQILf6NglbArhtuA==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34912710eabmr7174304a91.35.1764854557306; 
 Thu, 04 Dec 2025 05:22:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpFOlNn8OCsRbojUuDdPv2uX0wdMKR06SYjf/NDO7mAHyORuIFXRA5cb9fpAz5sy67WHXGeg==
X-Received: by 2002:a17:90a:e7c3:b0:340:a1a8:eb87 with SMTP id
 98e67ed59e1d1-34912710eabmr7174267a91.35.1764854556850; 
 Thu, 04 Dec 2025 05:22:36 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:22:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:55 +0530
Subject: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=nllHIarzQ7x1w4cIQ+mzYrnC4ouTjUGWchGSLlkHcQ8=;
 b=J+2G4HYsxfq8jhSbC6KgkFHZE1eJA9Ko/oM+TQBKINIyBHJBvx2KT+jhZ11TLw09fjxQPYgrG
 7NCGdJBcVuGBQGSmsOIWJcOTpnbwXOxovcw/JAPq4ypcoENUdePtqDq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=69318b1e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: nvm8Y8bwKIvhgDM-3mepLZwnjfwQBNkk
X-Proofpoint-ORIG-GUID: nvm8Y8bwKIvhgDM-3mepLZwnjfwQBNkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX9y3jGcCiVt/C
 mELMrkw2NYM5FblWLM7ojUtrsjcEq5iEOmF+dG/Pyu/8YdlIYhmVNZRy1mvcHF2Ot91f3omQaeQ
 9lk746b+7ikTMl/jXYRae16UWjNixv1xlaRxoHB/umFF75gJ0E/4z2WTfXNl1IeIR3ldNqQlSZc
 pJ1f+WSbzcG8IvbaQLwp/E2171BZwsOryxqURhxQp0OLFoXurX5KOuAPppsTPZXgVPKZ+EN7PsK
 L0Ibg7faHWmz9Jr25RiYJ8HYwWp3m5RnnhStkCHpUx/bkItDdoUFNnW8uHJ8arX+q5aGs569H5d
 OHtXq/nowiDdElSRR3G5vMXRZfBBvVoUIfOoiOZkdHgiorutB1wySA8cAaKHdTQ+5msXSEeC/on
 gNGea1LUUsfz5F0kc8wNCeFz5UgECQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040108
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
 .../devicetree/bindings/display/msm/gpu.yaml       | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc..5d5ff4307ee7ce5464afc5233f03a8bd1daaab22 100644
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
@@ -388,6 +388,32 @@ allOf:
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
+        reg-names:
+          minItems: 1
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

