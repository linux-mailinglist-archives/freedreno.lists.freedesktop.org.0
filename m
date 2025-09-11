Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D021B53026
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 13:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2365410EAA5;
	Thu, 11 Sep 2025 11:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwRPrjMO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE9410EAA5
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBI28n015064
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=hwRPrjMObMo9ewQ2
 bZ2FRPfklMfCBgxcNDuAMvSOQJEL3OMOZlMu22wXiTQ/Pz0gaSk3KdaFtYdjMPjn
 BM+kYpzsBf2pGeklKaqK8OVdsf38EDkH9ghLHcrgiNadZ5msZEtjFvKhP/Y6vk/Z
 25J3im2pggNKTRSiUHvsM6VM+4tTDeLzfhoqOks0xJZNWMvoaBadFD8oDGSjXNpt
 dcBA8rPJ6whZC+LXskg3pisw/6FUnvUrP2OfcGTD+DmObqhRGbzbluS17JGj2xEt
 vGXGHkkUX0/hbwcBLd/elrGPvcW7DSu7SNfaRPtCYcpIftlluAxDOeKhdW20MWnf
 az7yxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m78v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24b4aa90c20so7153675ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589861; x=1758194661;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=TX1JBkofFTIEZApdH9eWSCSD8oWCDwUPLu9TgKQKNhl/wfrId8Vh0h6NkPK+VO48u/
 cOxnvylqSpfXeqbVJENQz24yBgSPxjf5ivLGMHBLdvIzt/9uztJB9prZSnchTotKF5+q
 VaC0oYt8FKDnkb4JItfNAffSN/SUg7pCDOeAubSdnpAEIo2VX1Zfg6+xvI5//dW5GhJA
 eAkGnqUNVzPBQ4m143m32VQClUJ65zE+ZRyWsyDqtrDtlqz1iFkFGv3E6lVDYMvtVp1T
 TrT1uf+uIhIYdGX97VEuNqE3ni/UbI3lAJk8GDkeRe3LvtGIVZw+Mjq3YBWxDcU9t/aN
 9EKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg2JapGH01ZHeswS4ROVKK6j8d4Sw1AHV+V4zyiCJwoS8lxjYwCd0dgjt7hljNB3gh52igryDKESI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9lcZ03KJU14R7PTtJ9bpgiGsxWqdip6dC9Mc1rYLVkxBjkW2j
 +gP1deCebUDnmKHXrpwvMPQSJr2vnwpp9tHkhVbhlqMXvKvAWlBhf53IFw5BkkMHWfW7kvNQQWH
 uzfbzHbr2aPmTf2gis+6Udw+7AZWmwkwOhHhVwhfUNdCOe7DajAy1wSt7eOGvgQmbwPEKHkc=
X-Gm-Gg: ASbGncvUrAxHsM0pdu65aB9ZXU576C0ClNTbxgLdVwszUnRsYWLParWHQpJ1oyv1PMR
 ij9Apqm2W3p7Rm9sCciqcJZ/SGb2nXYzZL5YGFn149orfJ0ALVex0ihti4OP3TeHootkYzde1lM
 D5Kpk+Ct+zSRuxShz+ApZ7NGGMFFdW2XJU0nLiMTLXlRd599ao6JK5UljR7nTSW7f4Uti+NWeEE
 L4Xn5zQ+YP8NeFt1lexM9LUBr8X/OpbPeOhRaGqhn78t7Lgwq4i2RHj8YmLjh6gZAOp7r7Bx6fB
 pviGahIPilKQ6FqSJGc1J6KqTf8GybYKfsMdC5baoZGOeq3vhhYqdOKFlQtAcSTwtRtC+aMNJ3y
 7AQ6mquVp3hI6dj5pN+XPeCgYpBUlOAzY
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id
 d9443c01a7336-25ca9a0ee09mr5664995ad.42.1757589860746; 
 Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGwhy+ThWRQzuFVTo3tgTP57p2T1jMEsKjOoHNoY7Em1lQydlaLgExlKlN33CpwQLV12SmqA==
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id
 d9443c01a7336-25ca9a0ee09mr5664645ad.42.1757589860248; 
 Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:01 +0800
Subject: [PATCH v12 1/5] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-1-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=5XItcEhzZr/Ql1Cbibe/YCArxvl6ARnxlQ2S6RUK1cWoBIjKyauD+Eq+u4y6FKJtpzjf/gEjm
 RCFyyfO50tzC4Yl+qv/XfFLb8u3DpagmsLf0DbQDSM/if3MSmoeMw5X
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXwzen8O3t0t3L
 KTVhPY+rXalVDIGZxVhHO7DJgpPZbFZxIN+x+1HiDbhmKCtBJZz2znqROOZyhshh8NE+5iYD/ZR
 uhzdNX9Mh0MGZDC6eLNxlqymgMUhgol2tu6TwgI4xkehoqr7XauDcBYs5zHofFAHYe+LGlQXw/V
 jL2v4LyqyMI3ZrzyWLvl52kzdNWrNjSvma81MuZXCGvxgv2Uz6SwpoKEXboLvc4SKEs0RZnHMpN
 CqhnEYih1TdYxCjSp0E/z/WfKy+rrwe5oau0ueYO2r8112g7VG5OcsC/BLyNMHZIRzhhZcvSjju
 bSRvJo5NEBWg0EP69uzUUOFh8h1/aZf8lJfozsM0VbEm99InVLwh+RxIFBvUVsuJdrv+81Rkr8l
 eVcs5JGz
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2b165 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QxCJ3auKKytSm9tVGERiTzgophcBffkJ
X-Proofpoint-ORIG-GUID: QxCJ3auKKytSm9tVGERiTzgophcBffkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..d9b980a89722 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.43.0

