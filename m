Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FCC480A7
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDC10E48C;
	Mon, 10 Nov 2025 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqDjD+Ax";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aP9NnRhz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2995D10E49A
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AABZWnv3271032
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=; b=LqDjD+AxC0ozDLV3
 DZesPF2KWyNxNUxlnx6q8UyFS2ZMJU28gRU0nLSP0MoiEEFfbh2eao9SZtrUl0sd
 e8DgOZAVM3ynTyOaFIwBkTrjN+Soh6oYgFKKnunmsBUnnhv0/e1ytARgQU7DRV5d
 XhgK1sZJ9eME5jmY0pDBXVk8ovbQnPmosf//dauSBmhReO5lV/BQwBpRzAdvK4sl
 E+G6+JJ3/DKp2R7kefUfAshI04MU9P5vViXA+Xm8TgUopVg8HURmMPcprBMEYbnf
 Mbbzlv4t4Y+4YzwquiDoGYYFTMfRk12JjwwHetWzIdsPxs2H1WP+gbNHRjezsgXm
 AlhY1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafrvuw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:40:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340bb1bf12aso7923472a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792851; x=1763397651;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
 b=aP9NnRhzJNlr1pg8F32tAxRJNZYM1bxSSAcYtHD/Ct0kxUp0Y83/G4X2A2MB+PK+CR
 OuJruNVeA4jP+6YtFL3ez0i7tZqiNW2xA3mUXUKBWsTAnMIGszIWjBIkuitoOQFblWvg
 LURhlSvlZrQTGzZg5hYMh3N5tYykLXrPdNknExSNH1CNILIW3eE/fdN8WNZM5JsAGWAg
 qUozf9jMaozFlfP9HrWqsvyJPpncj0bXrwJY4pIS/nW8UDOF1Q8v7BwYSPk6aWeSJIrE
 sF48u6JmTSJMJkepBMleMetgmcd+NHtKeroBiXb2xqOHBCJqob3AxmApUjbe4dOSzURp
 /VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792851; x=1763397651;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YW7kalD2buUlilIlPcd/kOSgkuR2289vzcuRgzPf1Wo=;
 b=gc7Rw0trWS/ze3ZnluFc9G5xoFhOv8/7f6pS3DR9VlA4JevQBXPz5fjgEv5jJ+pbYr
 zRryW1dGar6/ctwsRWuD7MXpVNAUOImxWabfaF5LPu2Yzy6e/HOpaGwR9GZWmeAJlDVr
 4k47CKHWZLUpP4lH90ql+nMO8pkoY7Kvh7T66UMpEedOPdHDGeF9H5edDTIU0oDNL8v8
 mEdIFStfPgkuyq/UDPemhCeF3YATxBsbF14T+QAhkT3dvH+zjiFgPs9q3N+yYgrL+AJq
 aIaJfLiUnbVpLA+BxwDjIlunlQw2N4fesyTVJDQSOf2rZaxKm99saMWh9hRLKGiaeeci
 qwvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpXAbk/KAlF8DyEbIc1NdqnGuMw06FvMp+A6Rt7yboNj5neshqSEPxyR07KuMm/a1S31jKHef4dGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq+txyqC/3BAm1qffjR4U7RT19J90dheGVCpNkMRdOO5dWHNt9
 feyE33DZUbENnmn4ZtnPGMOQEoTrN9dVHPOaDTJ8bOepPUp1z4XfmXwXkqx5kJptuXvWcAWpUA7
 oYG+exKrRhnro5vKLLcLWsvdP8fc8rbgY3xCSWuGKCLuRWxybf+ECWlOaZnR0m9VSAttzivE=
X-Gm-Gg: ASbGncsuQMDnhan7eh1lceBalmjFx2yEKtRpdiOI+s487gW15uov4J2UYj1lDvpviDO
 7ILTQ/jADhzQh4l8EuOhHzb9P9X5P1l9TBsug9saSngFEYIB1jShSl42A7ZFpmzI/QnUEYLckvw
 4EgKXLqZQlX0Q5hAymsGKzUD1kQU2U26sL1D6WX2JCrxHpPJKjn5YTL4ciZbau5jL67YUbFenye
 YkgQC6j3iziJZa3SHtd3bkXQuN9atCTXbpzmhNrCa2R+wq1dksGgdgXDTddHm5RbBFw2gdJOLPI
 fenteQnnvK0cT/KoJ0GEHjScgwArb3uLyHggb/BHh2yaH+Brnj1Rxi3bqbEZqEXqGFuUw4yc64k
 71XhjhZVpI2+hfWpcxRhtvZ8=
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id
 98e67ed59e1d1-3436cb118f4mr9615754a91.8.1762792850878; 
 Mon, 10 Nov 2025 08:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9pMY9BOOQfsUqFBoMftON8+gbyhMo9vgaZeaC/P2wd397OdPBRxrPP6VrHlsLz8Ax5SqN6w==
X-Received: by 2002:a17:90b:3145:b0:340:e529:5572 with SMTP id
 98e67ed59e1d1-3436cb118f4mr9615700a91.8.1762792850322; 
 Mon, 10 Nov 2025 08:40:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:40:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:26 +0530
Subject: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1613;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=i/XuvOyeT2JCaHOlG1NFL84HKMryUVDsLqPOa9zMe8U=;
 b=Rl0fX8fht+QUdLlWazjj2MS5zkr170ArJ5QP1nziu2DVWhQTh/19rZUXUtypkQfxsojWb1Q2h
 Ei7iatRwVopCf/T2t6JmwEaKOde31BcZ5fbInGGq30cfsAbYCW1oUR+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Ou1T9sC3ynYji0R7ZCZ_xBjgeU-nB5W5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX8TJwJPZOpyiV
 bTqoJpSgUsuAcyH72U/j+1lKSnWiSochIk3Q2R9N+suAGlftvyl53iTrcEM/lxl9xRP4CXdGav0
 +mNeIQz7VO76Ja9Ml8KOY/QN3RtYB5UkXHz4u7s1HMc9o96FpJeT6Epz5ykZ6b4JEoKJbSm3iyw
 oZh2H/rHgMdM/dHsYmGd1R1L34kosPtCq1RS4x/Q46VynFg14FlsDlT1S+F807fHq4yZARlIV0e
 O2FQUDFpV+DjvKvjSXO0GsUoaYteiHJvUQqsm1NKnVWRTNQHq36J014+nSYUg5KhZTIEg1VjVYN
 uCO8FsVC/wH812vO6IQgo2KwPY7joDhFkpZR2CUZm31+OQqqtD1drMePgvDPsBZf3T2eabbuX4a
 M+FUht0ebIzGe9IeBL2yh1XySjwigQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=69121593 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_Uo5JhhLEGw40-SN2AoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Ou1T9sC3ynYji0R7ZCZ_xBjgeU-nB5W5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100140
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

