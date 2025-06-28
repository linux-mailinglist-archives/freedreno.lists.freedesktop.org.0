Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6CAEC452
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 05:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266B010E12D;
	Sat, 28 Jun 2025 03:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnuOdl8P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AE010E11B
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DB1U010204
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=; b=hnuOdl8PyC/YIDJp
 X68NVOQ312PUDICEvpyATg3ejvJz60foBVljFVZmBQYrZzUh5sjeqFLnlefVmvFq
 jkApPpDz2nCHT1NJ+WQRhg3rtzoBAVvml4Gh1QyBYECAQ0uyMh4ebVW9cpimTXm7
 xjsjKU65ZBBAF1QzjWg6RzvpG2ggcCuweSnaOw+PfEcShLBJoLhRgSXEQuqc5e5K
 jC+OtcV9gk/DqLlrr36y/5SIuGpahVYRNrTOyLQ5zeUcn32NI9e8fuKoebH/Ic8o
 8HYiT2cwTGi1ek8VtoOVjafFHeRQxrupJo1fqyGqH+pAaqGgczkknmLXE5IfEsxk
 6LiSdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j58tg77f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d3d3f6471cso57195985a.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079760; x=1751684560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pn8lRprkqEuCtVcvMr9gW99dcctgojrtSe4TTaHQ1lI=;
 b=qba5UIcjqU+lSVS51rasZ/coUVphTTB0v6HQAHhqkC/3EDOxKw5uAaySfPLAwgQaDx
 BJFPHBHXL9Z1abESeZD3yNwkbyvRJCGW/xmvX38Hs0duKLDALHSIUdXV0v3POhpOD7NJ
 js+KxxV171e0ymidPZHUsghpewIEaFiLF/L4oGjX0rhqwbb/rlViyfYFCNPYnjLcMzVg
 e95DsVQNLO4zEzc9tfybDGqKr0/hjOMK8wVsxt+v1CBWssKcbqb1cO8LcHC/YqzJCdgH
 OEy4vJeBJ6zIO/pn2PFLhtib4Jo1aU5qeYk/HQuDgIvfy5+Sp7QbYrkJoMPfgDuLKZ3g
 egfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi6fowThz6lNm4fLXT1pyY2W8MIsoKaajR333kBkl40TBSIFScKjdQL7TU2HlkihKIQVZ5x/agg04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaVi0UTKrTNMLhi1HYw7E/EEr3qpTlBw6lKepQibxurfLl5U5R
 leUyGEC3F2yiJZUgGUTO8eLatjIPY53zNYn9Su9dNxMbYEIXumdKwM7iF0P5Ok2Irx/+jDamRnS
 XKkGEJKea0rjovw2WwjFiUkNYnoiB+CTrDDo8fTmogqlJvuKbsHM3rZoY/2Ny9i+Om73aHjU=
X-Gm-Gg: ASbGncu/DAO7V2GNJbnsXAN3gtH/NHzul20QvlIbGIXZ/kHb+/9srRvvsxUIy7FMKrD
 wGoNphP76npRIu3khU/i+tWqbNiom4/5tr5xqGLQq/rsCqP2UH6aM1CTk+Jq22FRIfSmy0QIerP
 U0KDqv+BH5NZTyIfOEUttIZ1iOLbyglhmrKU4+AN3RvIt/jJM2EiqovfXnXmoa2UiKBcKe3fiFw
 4Bq9WQQ1v6fwYba/03MaBrv5EfVU4fTlAnIGzxBYblzCIECYoRdXWZ2iDHsQSDi5S1L0KjW52Pj
 VVMr+H3Wb+hawLXZCzNCuC+BGhUj2I3SF9L1SZfOESk98XXzOlaiAC5kh0LQvjn0VWCu5z+tsXI
 vP7Xn4r6nTe1RhUGzacvuQHXACAmbQkwv3Tw=
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id
 af79cd13be357-7d443994e32mr745061485a.27.1751079760516; 
 Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB6sLiLugweO26s+56NBhBPiiwhHw8p8mHSNpYn0MXz3xXHY1sPymiLX/dVkwjFIvSygbaNQ==
X-Received: by 2002:a05:620a:857:b0:7d3:f63c:7ee0 with SMTP id
 af79cd13be357-7d443994e32mr745058085a.27.1751079760122; 
 Fri, 27 Jun 2025 20:02:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:35 +0300
Subject: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9YGIHaPZZVo6xs/Nujkqpj0XLB0+skv7YqMwQaw0Vhk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tM3ZQjq4fHNRB4zWahpGOQAMg5wqPQjtru0
 jA5BsH+jqGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1fraB/0ZgBnsS9r93leQrl17L1FgdnbkPwM6M4aMOHWDeMy62TP2r4PIX2Bz6oUb7DsbvzSkIvD
 5DBQ6e+uEoJ/5xfFhapiM7DO4/mXWypigKZxqk8ZUxu/bEgzCyNGryBDMuiyCASKd77Y5qmCZfq
 FRh3t95lu9UQR5xb3uL/pt/v/fuys3dMw2okqnYCa5w6yQmaPBN6wTRDwoqe9kNZTiqkaVByF2M
 SxaOCNCmEeVbvGKwTtsSze05O/DuL9mlGtu+Jm8rN3C4W+WbJaoh1p9mJSHlcp1v9omtZ29y25o
 jNJjxvsfFdS+8BRvmk8/E2mSw8XWisiLxMAG8/P2i9qseZyb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfXyNbKoFLu9gFY
 WArkKWGoefqkXwsReBn07/EizldCf3W49LYgMmIEA4oTb8ckWbzcpYiTz0rgI8bjmunwYtpeJbz
 JpNQTMT7xx9gT4r67KzxY6JqHu+KkiDRbNxnG86z9qB85QQiQbDgBF9Ukead0ViNNhDvZLZ7Qt6
 hnpagAacrE0lNe1hG3XEGM/dZZ523BGIYgXFs+YFG0I3abhoLQ3ECJx/XAb1y65LpP05WCE+2C8
 I4vsvvH07aRdYBGb4DzruETAne6co7HDD6CKQpzLpvNx4wf5Q8mC1k4bcEN510RTf4x//zl4oG5
 p3gD9JUd9AH0UAJdU7jqY8ggO8WhkFJ1sZfGrpIoYI9y44oKU9iFi5CxPI1jDhRS7DyMRo9hRyZ
 E2eL4oxp2NjCzaFJkJddbRxzCQw9gdNZLrl72hkIgpdmV2Wo5pKI6RXwgj1TI8VLzv3t8ijb
X-Authority-Analysis: v=2.4 cv=UZFRSLSN c=1 sm=1 tr=0 ts=685f5b51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_Kd42T_lrbdN2LGistIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CRBaQZ1L7mICD5zEd0k1xawFMRVnP0YL
X-Proofpoint-ORIG-GUID: CRBaQZ1L7mICD5zEd0k1xawFMRVnP0YL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 mlxlogscore=985 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280023
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

Handle two cases for Adreno 7xx:
- Adreno 702 follows A610 and A619 example and has clocks in the GPU
  node.
- Newer 7xx GPUs use a different pattern for the compatibles and did not
  match currently.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 6ddc72fd85b04537ea270754a897b4e7eb269641..97254f90926030c4a4f72ae5e963af1845f0dbbd 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -187,6 +187,7 @@ allOf:
             enum:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
+              - qcom,adreno-07000200
     then:
       properties:
         clocks:
@@ -222,7 +223,9 @@ allOf:
         properties:
           compatible:
             contains:
-              pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+              oneOf:
+                - pattern: '^qcom,adreno-[67][0-9][0-9]\.[0-9]+$'
+                - pattern: '^qcom,adreno-[0-9a-f]{8}$'
 
       then: # Starting with A6xx, the clocks are usually defined in the GMU node
         properties:

-- 
2.39.5

