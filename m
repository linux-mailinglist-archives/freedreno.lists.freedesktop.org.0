Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4640C68554
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8213310E46A;
	Tue, 18 Nov 2025 08:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nap4cjrQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJCRx+Rv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FF910E44E
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6fclN2272253
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=; b=nap4cjrQxREJ+aqK
 PMnvSbH2enVOsFMEJyhgwLWy24fFoEzavVDEgPpIkfjN8F9f/ZYSFxZgNbUB2EtM
 EUp2seF+tODO4xhwSfP3i/+/OFYSo7wc2lKhgoLEqnzXButwH+S78fcnjAI2JbYD
 Nv+il9pNolq6yf5W6DMSFVFSD3Xd+kLSAsx4SP3vQsMWqrX+EC0XDq7L37gJOmae
 gYcxjJnbNc9fha9vY1R4XLiTENeHb1ZUMZTXMf5VZg/6QI4XM13sbQCSdrEDsN9B
 obQcXXwVJB73dvRA9L7/boItF8/sbLgEBYlf/R6FJ363KSh5I0eQoOvSTzygwvQZ
 O0wyUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgceh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29846a9efa5so145087445ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456041; x=1764060841;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=EJCRx+Rv4JxugGaE8xBoA+S/UxhiHUAWtP4hnX9oHIBcXsWPtkMKp66Rifb4a0QNHR
 XT9xhPQrhWZNvhQlsOYZjXX8Nx66wGl5rWVq62Q0l/Y83wk5YyLxNR8tALpOU8Oo9N+g
 GivdgYIvHuB3jUidjxMpjkxGIniiYwMiuRdBl7UGNfhyLdxdFSSIo4WWa2ht7ziTApFP
 3JXlkUcCYKWzPPDHZLNn5jM7rRFj/oIKVKbdHgu4uNHsyM/IdxzHnVzikV2pgl3Q3C8E
 nPtwXGsxVs3ehbbkimxQHBaX0hh6Lsebk3ol6xHTAwiZoETfvpdTbro8j6ZrFrjfq8lX
 rq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456041; x=1764060841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jRYfEhQHO/l4hKm8jFGZ03SmUwr6xcPm0oWaVVNpW6s=;
 b=ZZdOi+beCfH4xa4/Y7mKvOlVrum8xMvPxC1ZjikQMZFrJfYcIuWlaK/bW46V/ayRyv
 5p/8bRzq53yOhG3N5b5hqxX051lQO5vhmHy13AwajQZMH+tPBL8LuPfRYIGHZJ9a6hwR
 kQfadWULrIdQan+S8UH/zc/c+eKpRkuuD7dADYWPnLxgrCAQrMBoTWoUNFcemL55AQbD
 q2Y8URaM1WQXGqR780QXIC4yP+pevJ5HGcHG7NrafjFqPKOPNLn8ZWThXnCk3dNO3Svs
 1QU4xe+D88B8wwf/5XwNgCSuwYaI3LGfve/SlqavL1v+VDn1/A6xYtr1QjLH74fCCe3A
 P3iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrsN1qDWZtIbcRk10AVkauapk6xAh9hFxr/Li2+Z6rOPTo8ujuJU6zxcc19GTfNP+5HMwjJ9Or+AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN01B3Z3hwa/MNDAy21l37cSpnGeVbSZKgOR/XlT9QGc6wwfm9
 IJN0jHcR0LH+7FfxUpn2Npv5d+MQFVeidO+Ntiv1SC3KQrMtDvnnLPPn0bJ9fzLL6hL2+dO5QGR
 jafgkmXETbsuKiuTTkdGx0hyhvpBMNsyT8ssXdlPsF9GsdFTciuMUpj+LhQRTgZz6tMXUov8=
X-Gm-Gg: ASbGncuTVwmbKfV8b4I2zFlUlNF7X+9wGpFz4PlSjNAbG2w1LT4VddK0l4Nqhur2uRp
 gVv2J8eRSaIm49cPK539YLkkp2LVRd6+285vUVH2a0O7TDQiI+zbDubpVuHj0lrKUmV1UIodUJX
 N8l0gYdlqxsItdqyGkDLUOAhJbDEFnYgqTW5CptVTXxiWBQ4DSuwzADp9l+EytrfNZ9f2kUoGWv
 pWu10nSJyXLdIkECepFps5K29u9i8aiidGTkPDWNCT3eIR1AWjZkDY4de2LvvvwN+N7WuTP2Ei9
 ZmATGsugkDEbKwekr/c4O8xuC7X/hzHLkHgv//atl8FfPhxNzMI6icp9HLWWYVMQkKqV8uyF0JC
 gG4cO5OKhNYpDG+lVtbxFCaY=
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id
 d9443c01a7336-2986a7435cfmr202036235ad.48.1763456040660; 
 Tue, 18 Nov 2025 00:54:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfC5w5rOHD0/xHuLdWAeU6V8QfxoC4sF9cyqENeOkg8O/0IIShO5Ep+df4JjWBBzLhi9J5rg==
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id
 d9443c01a7336-2986a7435cfmr202035865ad.48.1763456040119; 
 Tue, 18 Nov 2025 00:54:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:53:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:48 +0530
Subject: [PATCH v4 21/22] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-21-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1677;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DBrZfc4GPezP/e0loWuAe+68GknA5/X9CxqWpGUm6+w=;
 b=zvvisBZ9CDm655u/GMKAP2PN/vQQB431xxPZEb3DHkoURhax7xrlKi9CfUl8Bnj4wPgFckzyS
 rVSm5NWKKI0C2AxbhYwWPl9F7iIfqVGVFQNNrX2VVi4eTv0FFh7U6BD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX3VHh/Kl5f/tN
 mMTl4wRQ7sKIeRCauvNSEXnyjaDJJQnikoKfoNysshqeYF3EIgdlYzBkc8ZddUqIDDUbJrEPT0u
 AvpuJseaO82Jo+Xv+qqa5QUOFzXEIB5xaQfsZXuBL3Wq2JMVPEJDDMFYtoy9ljaObbirsG3yr8k
 ZYQLwYWqxa8KBnabZLZiUn98FQM0HndHOPrNF09rbyvDgQp7yRikDGfOxeDskVCgu14MR5oK9co
 O9/OSuMCPQmsG+cWYGBmYGTfLJb/7PB2GCji8lCzLt3RGmEeFdjgDAoenABOTk7+iz0w2vjf2Gz
 TUTkCAAsywjqcsWvXHReg3mtsmOl8c2XLOgThf94JiTBpDXZdgOU1Nc88OWmhpj9uaCS1qugULe
 H3ClSBmYNFuQpUlCf60H3a2KD5yXDg==
X-Proofpoint-ORIG-GUID: E8lsK1zCh8lg_uu3WpB0wtOPc1ngDX_0
X-Proofpoint-GUID: E8lsK1zCh8lg_uu3WpB0wtOPc1ngDX_0
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c3429 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_Uo5JhhLEGw40-SN2AoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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

