Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B09A9C43D
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5810E90F;
	Fri, 25 Apr 2025 09:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7bkyZ8G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4410E90F
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TJJi007565
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=; b=o7bkyZ8GSObqQSQh
 3tPfJiXXzR4nNoMzfJxuJsOLTRtul0ZTMILUWelxWgcrV31+tYXHAwPH7LZFiXgc
 h0fwS+81SqSjiTb5NBc0+XkzQ9hYax8vyfnmOHWHbp7FB+b9W0hXpXXCCeoeAe57
 l0u28LzhKPutCF72xk4rTEWUc+kY6o/4OXOnI8UzzbHrnu3848yV2ZoJtLjS/Zvm
 zSJ1wWkX80Fo0bNv/xy2di1zGNe5kLnNLcUQLa9ncFKoXJgTXEDH3+oFRSVD7z0K
 Fj1v+yJs9BVSHWRNXDrYvFJ5w32FWpur20zDcDXVmP3OdB+cpOIMOuBqbhZ5NOCM
 zdx0Og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0res9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:51:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e2872e57so353597585a.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574717; x=1746179517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGL1av9CKAAAXCna1rw1gPi15ZH6XiWkTlMH9dyZseg=;
 b=f5IG69Ir2Hhv4u4ZIZH02I0ttuUOAfOBtLPgWhG5AdWpgBqUn44dFbo7yghEvG532z
 vZawtIWTFLq3brF6opevJXZdDlYu0jsY5Uv+yshd/9BtcjLoKwoIYJDJeQqY4Pky8l/c
 oyvaznq0Kmw+I9HI71w/Tqo4Kyxr1cBI/VQ1Lsf3kp6HvQKIqj92VEgbBcib6uU6bAC6
 m9E3MvF0VdsG/pSSMcI9/Mf4Jexknj7CtPD2AOnmXkvT8ZsCEmagFAoONnl9jfibJguM
 d1m9Jj4BhS2phnVpPwGIujA6iA5KmcdlxqPcVrvp0qhmcoNrMvRRxwa78i+lr3JZc6Us
 n88w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHz1YB/exs55TffHWt593b9jXpOa1tYb0v805N1aQCiCgioS2eZ7UoqxUkLnZef1x6HF/rQ8O0uTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUYpwavzi9e+L9oOGeBLj9Qzxht3SF9ythwMnEnM3jMariwiio
 Zu40n4FUZQnMYz1k82gKmixqS00rWc5tmUm5WQnvJYgc9rNDwRVpm61BqBCGeM80UHAWf+Q30z0
 yQ7xQQGzxQKqMK3las9Soqat6dehSiv9JcXWe6ZjWMJN+JsLwxi89kVGhVgZk74aBQGQ=
X-Gm-Gg: ASbGncspU8+yPAHqGZ7Qm5SzKDjgOqbUqpPKDUSGvMJHAFJr5SO3ov3GePvS1mqZYWl
 jPyKyiRlc3+jgUly1VyLOMSHGscFY4kTAs21nRvNTVXUiqXcIf/7rBD/n70pZ1iR0mIf+cTxWnW
 XLCMNCiIn99sUjg2Jp4JAPpbYaCu/FKMwZYia0s/+X7lJmR8UYNJ/G4rL9JebFFMJo+opgJ0jFR
 ht+1HBZsDsgQNEcAHxR1z7l/5T7mV0OxOS4pR1DiWBxYECy/yW9hKrT8fLJqJPtHkFQfY+uJDBH
 JoKLwBH5DIJ9sRhwPplzQAXXbRE8Mtt7A/fYnp8uvFNri1BBEDl6Ugkz9CqpBTgiRq5CqHIpfQ3
 VR95G9T2fdZK2TGW980QgSZXq
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7c960718fc7mr297360985a.30.1745574717636; 
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1K1UfbQvYJ/2ntuq2gxMNlOns2PWPFkI+8B4IXD4Piapymb4QRyfV5nubnNlzDop1tGHtKg==
X-Received: by 2002:a05:620a:1b89:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7c960718fc7mr297359185a.30.1745574717192; 
 Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:51 +0300
Subject: [PATCH v4 1/7] dt-bindings: display: msm: mdp4: add LCDC clock and
 PLL source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-1-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nAUeCQaacPy4eDcat81zyQ4FPPYgERyNRUqIhBqqdZk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5vnKr+pjxAmRELwP3wO3coSSw4Fwr5Bgan
 5WBhmwLHDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1Q1IB/41yuLT8WBukhCIEw4AaTeuj59DAP+dWh0vz9m1X2dqGBV0YSaqkaY9lqWqJLOQw3qA6D9
 pJXpJ0Hy1H08gNLagSGomLL8ytcz7pK7yUS/hNq6XPbcH6ihYsXgCXOeCfCUTEKLBE0qJrrHCn0
 l0Qak+gEmDNOl98mXcb3p7nGyIOUmOX9u7LnnhgDtUwWYwVgs0lW1sSGyAB7/OGBJ+1fM6M6WV5
 MbsNDg3BOJf4Rf1bn6JiyibAFxU5QDGBtkSlZzev1OKNn/6ftFNCGRpGChPMYCSVbPT7lPjq89U
 m/iEJQWCzd+lx639KNn/vAN+J4R9Nfw76nOaQPt72EzzAmuL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5wkyuHsEbFdboFnhbq3vrntA0E-4iLcR
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b5b3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JZA2oeZeEnBWUIejbVIA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5wkyuHsEbFdboFnhbq3vrntA0E-4iLcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX1zqJDEIjvj5s
 vRK98UFnIQdk4y5t2NA8zxhTzZ1xkYuzyZQjFtmmTZJEUaBNneN969RCwQxRnTuAtXlhlYf+Ai3
 5gHbFHAX4U7Bu5w48loJWwS3mPqHe8EpQogMrMEQWXRaVRjr3hhk+uZzsDrpyiUlU87nIKt1+TD
 RTPVeosX6RCBsPfGBrr4kFwsEJh12ly/+JTlz2OLU3OAe4c75GH6HqGsgqzdFKpY5A8KFAwT2Tf
 Z1nCaQDSghNEQRwNZNogrgBWsljyIfzCpeKyAgOuC4lXNKRf5cWTV9sgcSTcZRqkHqmOy1IXXcL
 EERQpgmlogC/KQGcOjDqinIhCVP6GP5hgyRc1LzE6l3nAgbZ8bAo/AP+w8M1RGnEJWha8zPHoa4
 6cmKyb2fo59cYkVCobtXve7wFQD1AD30J8LRevl+DWEmsVrdKpjGU9qdhwCxOLZAGAYh4KrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
PLL to MDP4 controller bindings. The controller also provides LVDS PHY
PLL, so add optional #clock-cells to the device.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index 35204a2875795e2c1f7582c8fab227f8a9107ed9..03ee09faa335f332259b64a42eefa3ec199b8e03 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -18,9 +18,10 @@ properties:
 
   clocks:
     minItems: 6
-    maxItems: 6
+    maxItems: 8
 
   clock-names:
+    minItems: 6
     items:
       - const: core_clk
       - const: iface_clk
@@ -28,6 +29,12 @@ properties:
       - const: lut_clk
       - const: hdmi_clk
       - const: tv_clk
+      - const: lcdc_clk
+      - const: pxo
+        description: XO used to drive the internal LVDS PLL
+
+  '#clock-cells':
+    const: 0
 
   reg:
     maxItems: 1

-- 
2.39.5

