Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09546C5A9A2
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CA210E97E;
	Thu, 13 Nov 2025 23:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThXyaQTD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZL41TXo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB71010E97C
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMahqe1699400
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=ThXyaQTDJPqOcpAb
 1tEkPU6On/laF1l3L7aoaFM6DzJ0yGYot74k9fRZpKoFQ9jOpKf+ce9rvXeL8nXC
 Jl3z7rn14ut8dTx0fKahmsGm6xSazPsfYpmZCsw/J8CqgPizB6jlxTNGOVbwtv3o
 GpgA6+7Id2RZ10O6s9GbGLpPE0IYh/f5F/T79qhql/yUkYl92xyAd9nVpvw/FT/W
 kq9Kw/rN6m0YqrkxiYBGdnddkNctuWrY0WmfZwbamQYVuhOHo867Iil/qJOhs6hG
 fHGf7RKjzmdeHDHtO5h9yooAHvlEGBi/rXyRpnYtuQlKvtbVtmVhBITOsp9ImlN1
 Ww9ijQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e04a2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:32:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297e1cf9aedso36185385ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076736; x=1763681536;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=TZL41TXom5/ymdkD03+6YM+eChUrRdNdX8NfWZ3MyEY3b60VzwQLZd9dtvgzDA9qtY
 AFGmPdfa/+Zu6ckW25nrW0Ts4ptG92h5tUtFsMA3BCML2jg5poEJGD0j5kqc14diDq16
 2sjCQXU0vYk0e5s+mOhwZusDaSFuw6cvG7zgtioT4OtDvhDPfPAXMN/0WieYY8K/dKJg
 TGh/69QLm0OfjyCJYwZMoOrWUxpm2Y8954M++qboC/FKVrbo0L7O5GvFVYV848EEL6bm
 cGsMtZnnY7wrZXu2ZRZzakXB1eTJ5F3qa2NSyV57P4J5CSAwkcyfOBWs1mk6TpiMfU78
 Ctpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076736; x=1763681536;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=ArU+BepDIdHt29BPH76/DRUuwYcQwaGgS3d9Ykrc51l3YyIxqNVDlXfPqE63+24HEJ
 snPSoXrpVsrn0necIQL2IGZUzSgRr+9DCW6uDleWSochdpIWXjWg5HP04jGaVsjGtRgK
 3uGntpBF014LFbhqZMPCopLiVpaCI/qXkUZhI0baLqTJEehQrKLrI3Ynyp3MHCZFjT2c
 IU3vVuBkGwqCVRr+CCIEZ0eZqNdlxL6r99ryZQiQEh6dztkY1GxHeL5HmWK4jg380c32
 s2T7TVtyyuj1co7nv3Fb47OzvuR0IxxWq4OHryNYVL2LyuIkMo9C6v1ReSnLPN1ZcQsn
 YKJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR768f6RU7r72cZg0AHeMJTTCmunMog9dw1iNReNwBFC8B/rCb5ukE62aShD4x9ObQtPqfoDtv14A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZlWsEb8PvTVvh2AZ5BRGtv1ah42piXx/1aGYE7CDUj0inYInG
 e5TCnx6eGxQBduyW7z/Ak4jUY4h+d7rcx/M5Ri+nHjyVwfcaE/nFwycOt+K594/PQ4d+T0e0bdQ
 x9p4+EnSMVE3BvHtFBBMQgvJukOA2fz62ZEwoRj8JDvl6W/OfCB7Rl3K9+/NSGU6DEOvKA4o=
X-Gm-Gg: ASbGncuF7pVBe/rYyPJazjIBDCcLPiF6bQWg1cMSv9k5R9OOysYVJFIaJTpsAFvHrLA
 zQEbRx5gBmNXnWiRmTP/Mx/DS1n8/c4eTnpvjr6asCIJfvsoiN/s23xnAhmoPFs+kKYuBO4/dU3
 44oqPPFXGYP5rveJJ1t7AUeai2B7h0NG2oZV3AzKvU01jcNhlUmclQ96By6lFGwpifGQq12gYwD
 sbLHigY2DC3VJdRSZPZ8338iTcJO0WKRqyncvnKAPWP8FtiPL3xi2nPFEnOnCHGeD9HW36Hs/cn
 TA9CF95MzTP6qNvd1t6yH/QfOY5leqNV911Gs9whgm0UmlQbTaH2du8zb6JbbT3nTcf+jJ7ukX7
 0Sb59bRDmsW0yJ7myFjIUD5I=
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id
 d9443c01a7336-2986a7435ecmr7356005ad.47.1763076735692; 
 Thu, 13 Nov 2025 15:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEodQqYgRJkYLIy60kg92PboSbyAXwzBxQKHsvJ7k9auT4mdj7T3WB7cWTBc3Q78iQHPbKACg==
X-Received: by 2002:a17:903:90d:b0:297:d951:b4bb with SMTP id
 d9443c01a7336-2986a7435ecmr7355695ad.47.1763076735212; 
 Thu, 13 Nov 2025 15:32:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:32:14 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:17 +0530
Subject: [PATCH v3 20/20] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-20-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=VcSmbJTK+AwALI8XC93AXkctqWpbKLucIhitRFtg+TnNd7qWT/+mcPon0M8DxlJ+BMR8C3A3A
 P4jrORXACVYDIs9gVsH1RAPyI2NIJ+HFj6zCe6e8XrFttR2KeLzGgOY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 7CcmU52_3HnRLlf2sLYR2Yb6APrYlIv6
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=69166a80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7CcmU52_3HnRLlf2sLYR2Yb6APrYlIv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX0XG0RbDGHOtg
 VZQlFodoELqKAp8e7qutJ7kgetxvUq0mCigi7qw23nNI7CqgKu79f2bHrHXJMfsoDJKapKc7wY0
 oLADlAf7PT10ic8GVcwpLsGRq7H72N7gZAxg3XlDzvFwSlfQB342O7sC/N7rFzwoMbjWzeyqVxi
 lB1XhGQ7lgsfqRoKKoWYFL9u8Uxb4ZCM6sk36Srtja1e4NQePALU3fOPUty3HYt7YMpXLPneZt8
 Y2qiSXq4D44MRiW+tuXqV0acS3Xwqt1862XOa9gY/ZGOp7KeNfq1BhQVxoAa5OOtkEhVP8Htacm
 KKEE1FtR1SNtJtG+JOJUTbPUc9TmPXdBSlmc2xCNZJ7SzmyEdcVSd2x1v73YbusxE1sLBToQnB/
 i/5xkELnybsfzMgs9IEEQLWygNTPJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

Document Adreno X2-85 GMU found in Glymur chipsets in the
dt-binding specification. It is very similar to Adreno 840
GMU with the additional requirement of RSCC HUB clock.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 2ef8fd7e9f52..e32056ae0f5d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -327,6 +327,36 @@ allOf:
             - const: memnoc
             - const: hub
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-x285.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GMU RSCC HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+            - const: rscc
+
   - if:
       properties:
         compatible:

-- 
2.51.0

