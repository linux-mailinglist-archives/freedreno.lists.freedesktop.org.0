Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA67AEC454
	for <lists+freedreno@lfdr.de>; Sat, 28 Jun 2025 05:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E36710EA32;
	Sat, 28 Jun 2025 03:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlOI21Vg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FC110EA18
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DOAX024175
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=; b=YlOI21VgADrGsTFa
 UQceUSCXb09Z5rHxdw057aZg7rpgbAclrkCBzuv0NMhNpAoXi1Jhfs46USFLgKfa
 YuYoCNxuzD/QsWdjp0Er6euYGErF3aXjImPBX6QErHRpIM4qdAgLylXH8Wv4YO79
 Z4NfJEG9PInTTrNXUIrA32KcK09JwLzMa40Vn8y9jVXB6abl81H11jf8+jfFjVBz
 Zl2oIIZYlUCoBxnZTgW+TSz0q6AYtKNabqGa7+0yXedm4RPc2gTvZ2WTFkz0HFlD
 4vnQMpe6ub/6z3gnHG/G2srTyDQW289zuwsXsTk9rDkjQiMh6Ql3B4Kuu+Yp/nLT
 zZ9Fzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa51ru0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 28 Jun 2025 03:02:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caee990721so117613685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 20:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751079763; x=1751684563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WyIF8ET/8reT+adwEBoFNJ3JczrXUqQ34OWiVHWVjBk=;
 b=hGA+NPz41RD/qikuj/9Syt4ICmNxpQLS/nnihiaCRpW3yhixn8N7tZ0R2/LFSTyfcO
 fvMP+Z0ttit4flcbwz36uH3TmXv/qx7ta9FbbPnEHGKE7+n/ryz9HP6Sf/cXjIs8krfY
 iyuY/VCvdWwq6pAJgVaWkwxgPv6m+gdrKvmaKeb5+EhZutvyRo8A2NL5/uaPnpr/3qiY
 lHnIl/Z25LVEQedQGd9WGmYztTGJTe9ZpjnDBbezTEmhyUXLoxTgq79HpL+xOHxvs5Mu
 gonZpsU1k3MTknAz8qacGjOble9TiCPnHOK+qNacGsMxVQiZoqWBn7DaU+qPYUwHSmex
 qXRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVED/bekg4QvR3SRKJaarzEtl0uh9OA0DdXx3CX63Ek6cpday4diEJQhvl4L+EMiaCX5PSOMko+8H4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT4w6HnHQZNj/3zEjpnvR9guIoPb4zlzfSx2Q+udRlUJDHxkr5
 WGIeSpLp7V7Ydr0rWBx92wTw657JqHfRBpJqA8CNTEZbGyml26TLQjcHzA3p/16cY8/BkBhDZ0t
 t3lYb1CVxrjhaFtPD/FZpaYSt45dxbsvIzL52HPyZ/kARU6uedZPGaupt8oSwBvjN062N7sA=
X-Gm-Gg: ASbGncvTgJonBBpO3bCI79gMmYUsxy0R4r38qZ/31Cn5uoAjtl+dNQqC7UbxtWdVhPE
 7VbKK7mYXwfLm2Ua4j/ajrq9g9mG/J28ioAozyzUbW7dK8BTkz59u6/T9m87lwnOHfJfD4BnnME
 h2CCjXCzO5yJ9XD6tP5sV3NJ5byw5LvtKYogV06nhEnwNSVz4rH3oYpKCinvI6Nj1J0eyalGDua
 W22UyXemdOGTE6yDfnk4NnVRRY82fBWJ6WLc4qwFvYC6TY5fjT59tMyVWA2j4DE24MuH5luwao2
 ry4g+KKcKZ3niByr8/v6LYYCWi/9PCVav1rGs+1rbNXW0JC7o2J/P8QdlJB7QLloOw7rS0h7/jL
 r/u+gvZhgHGhHrvD1UEX+HWRbZHgSkpwLEMM=
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id
 af79cd13be357-7d4439016admr843510785a.6.1751079763175; 
 Fri, 27 Jun 2025 20:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1qompkvIDrvMFsstdR6uF3g3AklhHt6dKY3yvNkV1TMIXIkwbGM2mjIkNgstKjIzZU8UGnQ==
X-Received: by 2002:a05:620a:27c6:b0:7d4:3a17:bafd with SMTP id
 af79cd13be357-7d4439016admr843508285a.6.1751079762704; 
 Fri, 27 Jun 2025 20:02:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cec36sm652162e87.180.2025.06.27.20.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 20:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 06:02:36 +0300
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: describe alwayson clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BZ/L0vXDMrjRpmDOemaXJyxUSi1dw0SrlQJrslusto0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoX1tMwu76TUVuS3VM0TJPzwdp55YvaGMGur1Jc
 BNDlSOT86+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaF9bTAAKCRCLPIo+Aiko
 1RXkB/sE4FvobjpToVj9wMIBigfVTv34gUAtGw/ot9XYLMvZp1DZYU0PyP+dOJrfdXA2gvEnwCF
 UsqS3CHNrJ1rY4Ejl0oYihYMHWWU4BmL01lbt0HtM7Jb319esifd2QV0LHKpH4RUcgPnagxdcUJ
 qQb4DoqHxgDj8rQF5BsRKjflH6lwLFrtfeBzZ5rn2YKCjO4qR3oC547sOcDii9623oU/ZLqTUcD
 pjDYFw9jqhUG0CB/f/f5bEmgPc1+wbZMVqQ16yB+9o42OKGYFtFOpj9QzVv/3r0zKK9KiRgALfA
 CZCsttBn4GEOoGKTYOiQI9L5CeTOYcqfMJLQZ7WvggixMg44
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685f5b54 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LRArfFjgsGaU937PEt0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: FDikgIufwj5LN0mR8Td4XGDnTJPQfFJI
X-Proofpoint-ORIG-GUID: FDikgIufwj5LN0mR8Td4XGDnTJPQfFJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyMyBTYWx0ZWRfXwgiKwzJD0mR8
 2AH6ffx5LNzMw8JamC7neUo7cGinrRN21y7/XOJlB25AC/FcZrQGlsjn6AZQurpV0DRT8wboKSw
 SXCQxhhj6hWLDPZFBQcrr22Za3Yv6cM7A7pRhsxnBD+Gz6nBinA/GWJlEayHUQo5sFjOBIrWDwy
 Cb0+KV3PkNyPNnbEI3XoAAIbYXnOwbu2Rchq1OX1YXK/uKdE7tFMpWpYRxLfb4VaOQjs9dL7wed
 74vzlT0GATLi9daYIMfEshu+8856pj+aibQaj/1ZdFPPH+a6B1/bMLvzTJedPoZot820KqQlUSS
 +kd1WEFg/oCEMn2dfnVSEyM8h4heAHTjwKhP+m27VuB0Zd1I64rG7knhgCNyfadL//0TUDLNWq2
 ZZuYMmgwouHfh9g38KsInWJIkr7bGmx393iNbgBsBKAlIWCz0ivOE1+xToQPZOHLG5naB4f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=930
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Adreno A506 and A510 have one extra clock, alwayson. Describe it in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 97254f90926030c4a4f72ae5e963af1845f0dbbd..af43527188cefda0c127c4674d4667203972f583 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -173,6 +173,8 @@ allOf:
                 description: GPU RBBM Timer for Adreno 5xx series
               - const: rbcpr
                 description: GPU RB Core Power Reduction clock
+              - const: alwayson
+                description: GPU AON clock
           minItems: 2
           maxItems: 7
 

-- 
2.39.5

