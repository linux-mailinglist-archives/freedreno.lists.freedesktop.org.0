Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7466A65B30
	for <lists+freedreno@lfdr.de>; Mon, 17 Mar 2025 18:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCAA10E43C;
	Mon, 17 Mar 2025 17:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyrhuZS5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1201B10E43E
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4d0b004477
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5RUXefn1qNNUFYpYyqAwzEaojm3EYakk9J0kKXfCQO4=; b=dyrhuZS5BJE9o4sV
 07Ky9QlmwDtTJXbKA5chvgKzd+XzN7LdgB+hx2lf42tfKyZq4XAUofkh2ZZoKaua
 +BZc25fNzPT0upHcHpW/uiW6Dl48ielUZoSWQ7xHVMLINtIiCNEpuV/UEbUJDFBd
 Omq6Xl3ZiqbTItRk+Gr7Aiqo6rducoaZSjIop/AW+aiPZBv1PxAFu2FD0qZjlnuy
 i1zqucgS2pda6+tUiukHz7fub4MIQYYY5i+N6MNSbd9W71Gi/B/IeQBRg2GLsGSl
 /A8J3HeBrPSlqIM5BbGX3fuhUEq2f+QkWYBjJwPyCdQDOGjqrBEetbuhJgP9xowK
 1yvs6w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u8djtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 17:44:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f9057432so102271496d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Mar 2025 10:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233497; x=1742838297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5RUXefn1qNNUFYpYyqAwzEaojm3EYakk9J0kKXfCQO4=;
 b=gcEBANEwKR+TsX8yUMAqPZSi9ZnbFNFrFZMQYkj5S/aS7dk0Mmm805Vj/pqhWZWvNj
 k0Go7KcNwBNiEz6fxhRU7uj//5a7m/qUWleSwspKJrBPK6HrXnD7s12W7PqJgHk3N+AA
 cv6gKuDlR5ZPI1NQtGYFBQs0+H/5+HFwBZDki0N9g9OGznDu7foMDzsQm+S4pxLlEWvh
 lYwalv5LLi7gesPA96EHMFXIHLYXOOKZnLoXJowTghqgcjRLZZ2D3F+yEqZswV8qzTXA
 bsGckaOqr6RZMtVYZvCCKMcqlzqVoLriE9t+cpJdSnvWFvEuzxlJ5Am860K2wZalL7kE
 qFfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDSPHr8v5u5kgk8Vq0zz86BA3cm1XgOI7zaT6BuduQ/LIGfipezwVdioMZH2x0dJZ5GknLpVlS37M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzstc7xvAF2LBCnYOTQvl6sibtz2gpGWH4jg5l32EKRiuWR238P
 06gftgsaWp+JiYcXtl/Zo6Num9DsZ3JoR3B6WaO+z5QnWXP1ehvwWotY3b9EExneK/+sLYWenbV
 6DtvxwnfwJHKtEh+XxZR4WsBb2002Osw4+YlFfUXadK5ii4QS3jN3UlFUnlrw+k6u+PI=
X-Gm-Gg: ASbGnctys3XhtKo4vfQm+Wnf8u7HHBLv6HpD3eXMwIoIpoRnclJdz7LOazSYaRqyhQ+
 oQBza3EjfJmESOciDkegOU3QVU21XflTKXdaEX1Uw2EjgH9yxK2nVsoQNBoUd6vshADyDvEXaAZ
 AaVI13/xYBngpkggwQfpritT1nEDY+E9OM8CSdE3ZYop7s4DkxX66hRifbBm06+rLrmUMt3kYJZ
 0VlAxOi8r+MVayuAJbDDGXP9j+38+LLdrXvbQhVe2OPns9ZJllKhaQ7RcOX4//0h4KXrAuMFyZ0
 TAvnlwOrEW3o0cM5vmuyOFPsGRX+UshM/DiXtrBjsVwuI92R4s4t4gBtdPc9vEYFBgytYPhM8mk
 w2BqJxVXxneZ2IgI+5PBiVtWPjNR2
X-Received: by 2002:a05:6214:ca9:b0:6e8:f3ec:5406 with SMTP id
 6a1803df08f44-6eaeaa1d006mr201930266d6.19.1742233496937; 
 Mon, 17 Mar 2025 10:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3cSX1c6SJ9kLCUiPChpT3soohcu4UzGIqx2wB+7KFeneHQMOwxrAqObCKaKdSyWhaKcyCug==
X-Received: by 2002:a05:6214:ca9:b0:6e8:f3ec:5406 with SMTP id
 6a1803df08f44-6eaeaa1d006mr201929896d6.19.1742233496615; 
 Mon, 17 Mar 2025 10:44:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:39 +0200
Subject: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=txiRpz+F35oG+X3p1ZZlBKKL0xEtuncaqk683Q7tOLE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+Gi3a2yLvvEDKt7jd0IO+ZfP38GqqgQok1B
 tT9MqSCwTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1bv9B/4/pumYqZ/XAfocif+U1tbBb3jivCcFFyihCjH2rt+nL0YHk0nuFKb0ECkOKK5WxkkBdnx
 RFT4KI2aTmHnVBMEUs6JSijZgYpAHmi2DmGxOc6t8Pym61paG6IkuHPBWtjRYJLmUK7bcAuZXED
 CC0gCwzR+bB+indzwn7Ze0CU87k7xnym3FfdNsSIviNE6j1kBW3Ez1395Lx9G4l2aLfP3b/OzPX
 jGbkMW0bRFPewsZigG6l4WU58XfNyL5SGq7OCK+UPsKfc7HkBAAka8Xkj/D8f4hpqPK3Qzar3uG
 hCGLHiWRd1Qq/We7axyNNHEzmg4LI9tInYk/7Ykiaq74W9zM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KEJQc1Ms50VLTbb2IFC6xo1yVW4CQUJA
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d85f9a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=9GbQm46mxl9eb08TZg8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: KEJQc1Ms50VLTbb2IFC6xo1yVW4CQUJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

As most other CoreSight devices the replicator can use either of the
optional clocks (or both). Document those optional clocks in the schema.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    enum:
+      - apb_pclk
+      - atclk
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5

