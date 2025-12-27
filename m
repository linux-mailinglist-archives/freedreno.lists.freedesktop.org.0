Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5902CE516E
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 15:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970611A1CF;
	Sun, 28 Dec 2025 14:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqLo8btF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGKd5LnA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2950210E617
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BR4C0Er3260975
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H
 1QPu4VJM=; b=QqLo8btFJES1VeobRb7iTMJ4TDKtiKcctcNAAG13OSOj28SJRn7
 gBcW0J1/V4mDE8iiD6CJamsZgQ463b/cfgFb1G4d/4Izju2FzojMMm+Q7HE5+zSh
 0gWJH44gHi4Kv0Bu6rpf4uc7vnuxtlmBVfQzwN/PRJgaFkAQOnA5n+E+zl7hmkhl
 4oilrkGoHTqUQi7TaHqjXwTroXN/P4x6jRjCstqZEnUG8TFyxSFwZxMw8upOePKc
 Z74H4raH+m6jOUPcGEq4Jm+iNqmpR7+9wj7SiObkf06e7Q0yHQxN6OVDw9Y5d93f
 PuHpXjEDsKliTHyYSQ/b4PzFEonQuU6sHpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87brdpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f183e4cc7bso146030771cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 03:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766833516; x=1767438316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
 b=QGKd5LnAgn/WVWx+MsEEPZsc38OqJS/wGJpmDh79RUTXJCs4j0OZIKzZ+M1jhZIwea
 QkYyLmlFvVqytlwxVwRvi/8pvh7YCrCng1PTcXtEZcLKPM6r6Uc1N6V/bTuMPEM+3owq
 AMfPqp2y0BhTwtJQFqyt7ov/l62sdPD+FEliZP2x1AzjoythVq0IDl7SuoCLoT6CUnU9
 qK5ALQVgnMgo1KgEIb6MpviQGL3Jkj1KWLP8otS7/qKrkRdQ/rVXGwKXiQEZlfCPm7Ff
 j1ygsQp9HorkYTMxzVtH4D1Wywuqr1C+AwoiR62BJrR+bzP3qvBftbjmAkgpT1+WKpcs
 yl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766833516; x=1767438316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
 b=dEm0Rd+ZxdRmOOBhxzUCAYlWEO5AzJs+m0Ec0TIkiDUFP4QNGiHTlobmHVcx6n1aTT
 du6nGBaX+16P3dnEKDLMy0Wyr1phDVvuAzx+rV8W+nXoFVxv+DfGEY67zf8ipmyhyDyx
 ZjpniIUVrPTt+Ll1eq7FVrO6D6O36IR0ymb6JBY0Ki3vdg2CQLk3xMhohaipoL9xj2yG
 tAVyE38A7Nujzy2Fd9NkmyFi2H+8Ax3Ciw9HWvAiBrFOAOCdiaY4+eEIAF74Q+8YeFii
 Jmgwz0HUWI5etxyvrbeBV98bIBINQWiIOqfDiqjG8y959JFw49TJonW+q5kdtXQAEDUT
 X8QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn6fnoxR3yhvATMPH8XHqNAXGP1enKv/k8mOu4L1fCio7bHwwxlG8rxGkD+jfq7cmRKOBHm2MqSjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw94IsSZ/NVAlvQd5Q5gDoHM+LtijisL2uQhrkcMY+4ZqjKi4ke
 TEdLOb+tU6LOBw//ML/Is3LGk6zF9LPyA4tztiBz3k0GkcEYyrIXJjY5Z8Ji2aEqnGW7KREFf4T
 xgG9H+fcVRCU8XkBaAYTR3Qm1PWRDrmRLgLb9T8PKyj/IJJPUBOg0Ei6C2qCYZzCnN6ZWHdo=
X-Gm-Gg: AY/fxX5gyskpho2atS6wetfWp31FvZn4UrJZY5fuWPaTqoqRxEd47VIe+5Ii6QzZwMw
 f8q6pGwiUqQ+VII3krutRC2+tTH0kabOpXADBe5R/LOI0rFoEnUz6YpsVdJuZxZQfqhqabu8pZM
 aeWifyGJ8lHasudP2dJ6enmLnl37Z+SIwr/tojg4eBX8zlizpwSXZ3WkN/+kZYCrgaSacbkpW8b
 lV9wzy4/+zilB7d5esE8scCxWoZrTEZAONIWKfc8K/+DuTkMhQlN11QpQvvwtrkZ1dG43Y+Op0q
 6B38oKA1hVrT9S8E99guPLFbJYklCfWEMwXtSCX72zg8RsD3UJPH1z85KtEP8bcL5HKow+GnW0h
 KXrjwjvl10Cxl1TLY7fYWX7Fx
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id
 d75a77b69052e-4f4abd75343mr340171331cf.45.1766833516308; 
 Sat, 27 Dec 2025 03:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0TYgsGvrtMGtuU6/RL/Z/IVORpXU+8dilniFAv/6fmEz4NBxqef+dKiYVk4jnwyH692w09w==
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id
 d75a77b69052e-4f4abd75343mr340170951cf.45.1766833515845; 
 Sat, 27 Dec 2025 03:05:15 -0800 (PST)
Received: from quoll ([178.197.218.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 03:05:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and reg-names
 for Adreno 610.0 and alike
Date: Sat, 27 Dec 2025 12:05:05 +0100
Message-ID: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=D+Za4rALfTUqTsiNInx0TahyFmiPEc3D4DRCUn9Cbis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71hjLcG0oDux9ARg4VrdAiDoAASVRNvFJ7xO
 KRTKDG4zVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9YQAKCRDBN2bmhouD
 1+tQD/97pNqpk80f0BR+P+9aIcU0dXbS2l7pXSy1m5iLY36I9799J7z7O2+Dkc+ANvhNhvDHcrj
 9+taufqhVH616rKPRV8y+wKhoYqLEYNMy6UA7jcVpyPaSqHE7ge87zpGlqro7DjynV7BFOkfxKX
 kBrhz5M/Wb/gL01PgK4e9reY0Y8ag65gSDBdGSrDnsSVSrIPvnZYo60DiKWITN2fCq5J0rwXocE
 ZBQpU6+XdfC++IhaBOdBFgyRQHTDsI05mMOh/JJ1VwMxEgNKuqe2Ed618wTb7dDI5o62UbJ0nrK
 8Os4ZhH80z0OVPMEidaOFdQxfLOfpZgrMXRwJ6TrqLZh7ubbMmXeFfmdxmJIv8Y6+dSIcMuMw8x
 ktgtNLoVes5a6yWHwNK/uPgcl4j5DICQWxiHN4biqpKTE5ApjpZTXUihu+kkYVUD26XCeM9W7Mj
 G/uUw7ZgfDfBUt3SeBzHVHaDONICHrN2Jx7tjoKxdvASi7u7P470OvFyW9F9zzWWyz9v23928Qa
 5WVk64QQhwobL906S+iAgZXsMWk7xYEumnGjmAFqsWtSp1ehcUrJ+GqG06oQpVJdx0W4zxWsqsP
 37CQVs2eXzhuiAuOdROasUwpQymMLE+OOG2IbyPzdoWgqoQm+jNaj1qXblUKrwfk8tbiRNSlGCi
 2gaaCOofZXFUwng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hEQM3HYvAx-W9sxzdT9lFG77_d_oWWH-
X-Proofpoint-GUID: hEQM3HYvAx-W9sxzdT9lFG77_d_oWWH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMiBTYWx0ZWRfX6TcuyrHiB7G8
 eVLJDIh4YhbG9sIsrL9KP7PFJdVhPLxHF1vnfs9BnGITxp7gPlogWZOzjOPTNzAZKf3F/FjL4k7
 7nK2plV+gwN6B0iQi2D9BOd6uA/KV4fCkh00bKGUrGgk8MhAnJnOTwivXN3sXlmDcJFMGxJlzK4
 48F9r8+aK+2Z4i2oSS+iE1mdShBt0r4L3n+fqpBxJ6dfwNcHO3Vu/95kq0+t8ueI4tPdtrKUrHc
 gxZ4IqOnK+aFyDKQC5pHX5Cp4S4K9CaceOAL1XrtOfPCj9g1Zb5Zs5zLtOK3K4hkyn6/mi1vIuS
 6+LehY7C4Om0PoYGUZdW1kUhZAqJdht4ypXfb9XENsE6RZck+rwzLQDOEn23Iw0FFfdtlFe7mRS
 bMi74JNEDVNzBZS3x2SnhDjZ9nq/AP55c446j1PHHlJSUTw5wHV1sBd8scUKhlVKpxlkpYSfdOG
 piOwsdMBm/WgemUrHEg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=694fbd6d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HA3oLdluH4EBEQOtP_YA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270102
X-Mailman-Approved-At: Sun, 28 Dec 2025 14:45:41 +0000
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

DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
"reg" entry, not two, and the binding defines the second entry in
"reg-names" differently than top-level part, so just simplify it and
narrow to only one entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..1ae5faf2c867 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -378,11 +378,12 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
+        reg:
+          maxItems: 1
+
         reg-names:
-          minItems: 1
           items:
             - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
 
       required:
         - clocks
-- 
2.51.0

