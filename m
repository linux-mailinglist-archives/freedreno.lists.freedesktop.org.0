Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C8BAB8EE
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BCA10E501;
	Tue, 30 Sep 2025 05:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKszC5nL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322B410E4FF
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:58 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Hrr9017702
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Hx2GBX9F7NQ8LRgJrlO3MtzBoxHk2zM9UYRVlbcmb0=; b=lKszC5nLb09MCfFy
 9qAXJATNc91t9z5O/MuQrzYAQKzVp+/ETh9Ycr9nQyCqvTraXNxjiKDJtHN5DVA4
 +8VURNjrpCnDtu6r5iwojX/EfAVmZOBXFO/pg6BjrOnYwTWlrs/1AfvpW2Y5fLQc
 dMiEUiUQ9cVUV5GsDmeVRfNTrvEXpOwzmwUXMfZddzEyzMvhiOmPs6Zgjth7PIRi
 Q8UsR/+X1Zwo7107X7hB+QKZ8YzwctDk5yyVUurjtGjBFSLTAja7EaD4tpiAAqtL
 dT3dgCF87O8G6pmKRvmoA22ke0i/JK7jkXyam2ScMjLbo5H0Z6HfmU1Hgs0Jmi5u
 XBgc7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hfj45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:51:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33428befd39so10660917a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211517; x=1759816317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Hx2GBX9F7NQ8LRgJrlO3MtzBoxHk2zM9UYRVlbcmb0=;
 b=B1LJeHDDRLfDYjCb8uoAP8+p6W9rj32X3F5OpnYwUFC2e4RhZ7lR8yKJR15+xB/QV+
 ncubpHVYtRkz3M2Rk9XTdM0kd8MGCC8k7K1ZxWBFXlIYCFRfeEQ9l+LAVO3DgbAyhwP1
 euP7z0e1bkL3T70GR2ZSBtmm5jr+qWvFq0rYB3sfb4RokPBHVhm3jMFAQ+Z5HPE7Mf37
 CZoUJZREZGSALMHwEdWZFI7UV32rAtqVR2uYUx8SwyRLx62HBapCba1X8nbpVt0GzsWW
 JITO0QIEAvnpMZrPvZ5WOjveMx7V44tfYWZjjHSk5gxnJ1ax+5/nqOoC2swVaikA47YZ
 DlLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhBYM4cpfXj8THODxsnwNHXPipLdDSULcfn1FtyvqfxAXtkqnRzJuSk3/4TRFKyuS0FDFrRky8Wts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLVxBcd2G3lxwOo3v9lU2c47Bduth6vEjizbgrPrf4cyZvyclO
 /rmmCBS+VZd5NXVR37ikWpVniVqCEFJecC5mXNl5/ts6B2Z4q8SXyGXYFwD522I16pVllP5Ys85
 kLc+0Vpyr2FgU2br5J0y9DZPp1VYVRc3QDWz9au0qT8qhCLHeUmAf5zi81b/NEQuzLejoHpA=
X-Gm-Gg: ASbGnctjDUWOz7vpbNQfh2OO51IGEUXz7fszNJlHENmibxe7tTarBopYN0F7pdXaJr3
 qiDRFP6Hd3e0/QRczNAx/Ot9jrxyk62gva4vWW+IBEsZ92N/TMC0gfMSRIuRDLD9d0SR6raWrSh
 whS0s89dT+2mKeccP3ObTVExj95y4yynGwZzkMoT254BDsrCKMckmYabQeJo5LAPjJRK6vONpj9
 zocLLXFoaaWO5+Q46ulJRIEaSKoI2SbsXPzHjb82YZ318PmxmRhBmfBjzcf0Q/tkoR8pbawToSl
 dbR1bqSEAXj6PjxGqv75f5QjVHHbX2sLfuOCV2Jc3Zavanax8bchPgo6Zx2B6mPYjo0/pw==
X-Received: by 2002:a17:90b:4acc:b0:32b:c9c0:2a11 with SMTP id
 98e67ed59e1d1-3342a257424mr20752783a91.4.1759211516710; 
 Mon, 29 Sep 2025 22:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtRSNc4DK7E+v2shAPlx5lz31OGXX7JSkA3qfyFJ7DSBwKjBFDVh4Ipo5Nf9B3OBI5+WubwA==
X-Received: by 2002:a17:90b:4acc:b0:32b:c9c0:2a11 with SMTP id
 98e67ed59e1d1-3342a257424mr20752741a91.4.1759211516271; 
 Mon, 29 Sep 2025 22:51:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:51:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:22 +0530
Subject: [PATCH 17/17] dt-bindings: display/msm/gmu: Add Adreno 840 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-17-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=1801;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=pH7QzqfVd66CUSD6i7hLasiAtJ31uRcCjsRKu6nI+uU=;
 b=PGjrYLobY/yshGg2rKdYdHx3hBf1rR+pcl0fXzC/zlsE0Q4LT53RJdWXkdzvjlbXr1Lox1Rsg
 V1eBxYAHSsbA85oYuhGvB/V8bDV+FCIysw3mOWm7AUUVLL+RIKg+LcJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX70slS+MaqrCE
 FUmGPOMgSHY8cWZ+iI8/GNF1g9zZvD38K7KfUrJrfNv0h0VCMlxK/mQGmXFdz+TqWTtO5AJZIKV
 HeRxrEW5U3cT7t8BYR9QHqBKyPBlm/Arxpo4OJoffzjQiv1F1rRYzKw6mZwoj7OV7hQN4cmnsGg
 lPGVpwUgzTsDixcjr10Fzgh+L/wOgVUv6gem8Zfux3KFOI39edhTwOb1feBM7+GpGHWLEOYQaR2
 eN0xZuHXDiBV8xc+Sunbs050ts0Q8hbB5V87kPwLrpHx6ed79j87mEuX8Rj9wbkOXQxipRG5SiM
 hZSBUtCK0FF+sz2gMZmo5AZ7cijyilD0xPumJeYk1eZjlTUYYO29+qnAVzFLBvezJilTGclm74t
 Jl7q/ypiHlyPdTrafmlzsXDdSL6KQw==
X-Proofpoint-GUID: KzZdxiUnvP5nB1Nq0vMpJzyE4H2Lt54a
X-Proofpoint-ORIG-GUID: KzZdxiUnvP5nB1Nq0vMpJzyE4H2Lt54a
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db6ffd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qH2KftFUxmXysmBszocA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

Document Adreno 840 GMU in the dt-binding specification.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc1879357440c137cadeb2d9a74ae8459570a25..2ef8fd7e9f529967e28131e1d71a6a6f455c4390 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[6-8][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
@@ -299,6 +299,34 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-840.1
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
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: memnoc
+            - const: hub
+
   - if:
       properties:
         compatible:

-- 
2.51.0

