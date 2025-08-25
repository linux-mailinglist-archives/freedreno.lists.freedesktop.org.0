Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D105EB334A0
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 05:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAB210E23D;
	Mon, 25 Aug 2025 03:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh4KurSO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AEB10E2B0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONcxVo013270
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=; b=Fh4KurSODOa3EQrt
 dHbbZmlijp7FN0kX/upao1z7v1quR30bPGFp+oiG1YbqE5SuyKpIZ0Efk+P5gTau
 zZvujRbFFZ3OBhtthckrPwCss2dIFCe7QmIvhXK3FZ5tL71H6JBGp67LEMJcYvnq
 ekRaf3k4ASBuHfbro975Q6cMFVclN84dLq9qK5gi2bACmHIorBh0EnQm9QhnpKmH
 fK8J3IeMIkP5xeSNl0A7oGshoeQKV8+fMD0aRzndLfqzYfStGxpAE+n2gT6FfLtW
 XLJiUJGekz+ydyae2s9wppZpMNUIF9PvT/25PnmtEVXK/Zs1vTYJSw1PI9ljuFlY
 k/FMoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpkkyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-246736043cfso38821095ad.0
 for <freedreno@lists.freedesktop.org>; Sun, 24 Aug 2025 20:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092949; x=1756697749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=;
 b=jQOSrCML9SnRCuV2cEeBAnbOGmHH2X+UaTpR/4qsWhRyN99PXXFC0L3/lBSTm/s0dP
 xXM3xxyg/+Ofqq92RSpnQeMTJ3DzaFHswftKdZPIVSLaR2Q7QiLwJwCBpd1/aZao0mgz
 aVzfGbWXJtXm1HOl5MOOQJNvuUuL8jD7R91R+GLcwb+TzB5hvNXKkC+9zClx/10My5H4
 O2w9JlXgUwtnN6v2dvf7UQBhn+8ypvqaJc59FHXqq4BlOOsxWEkdoYBU6aLHXjhgLfg9
 p7rSwAQKySKwNWA+Yqk1f7cO4dNr7T1YXlKwRNl1hCd6luskGIXyppx4So5/5lJpeQGU
 v80g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMVHUzuX8gP3CgNH377gNHOOEj5AGN6zRRDEzhaHByRTSqcY+wGsbqee7mQVZbKFabDrAaXNzM0p0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD/ITUneVx2Uyz+y8V9e2ckE1BzARoQmNtC5qX47x5sXqJMfQG
 7MUFMwfEl3LuY7TYnNtLqr1ooUUbeif36cSeHiiqSPfbcWzP1etaE5HP52d9Xd+rCPgat62wsN+
 xKgeUjCsod0MyLvitLSA34BrWDC9koIeELYqZw7jlES5qNR/2idm9QHwEapz6PTw0VJK10i8=
X-Gm-Gg: ASbGncvWe+bIsHg9/QwpQ8riabVtZ41xEynX7N+07sunQ4+RSDMxTgp5oLtW/RXdLoO
 nezQW9yBC3/izLtlrNF4DvhOJWs4QGrYy5Q5iWsP3F5jx/SHAtVSpGofO5/BBFmJMQVmPutnjZr
 aEsO2IweAfHgNCNcbKsEYfGOzClbVH1zHM5EwU8z8/nT/nxhzImKhU2KihtLUAjVHA0NA4IePG/
 mH4vdwUkzcaaf6TLl7SlsxuV3osk2ALyejzy6nfCP9UL+4yKFqQGvyF1BI1WnKjxEZO5d7BoOE0
 nEcTQWG4erLRnPDNfoyjnzFH2JUqUmla9Hf4tTjqGetspljV4mkBZPPOyt8fABDldixhwz4=
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id
 d9443c01a7336-246e621a7f1mr14024275ad.31.1756092948821; 
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAwYYh6f6erS5AzdwM3CnzPO5hhkgBPJrkBabrpVRyKaCiZvK90nuAoQsSrtjRliZmm1vy1g==
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id
 d9443c01a7336-246e621a7f1mr14023855ad.31.1756092948375; 
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:21 +0800
Subject: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=2062;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=LBoCkIOz1nhLErv2TZjqow4lrif4gDacFutX3m6t01o=;
 b=Y+yHBkF6j80VW9ppElFvbvtjnk+nZ8Ffhpo8+67cKLzsDwk48Y5mh2s5hr8gMEoFRRIrPcw8u
 +7JcJitAwSyDuIAeqQZXYBlerGqmU+wJBEBKq3NyyCb6aTQPzN/Axvj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68abda15 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eRoelbRBQ5ypv8gDxK4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ta-8rn1zUQEEiu8MDQR3ZXX8WToCDIxa
X-Proofpoint-ORIG-GUID: ta-8rn1zUQEEiu8MDQR3ZXX8WToCDIxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX53djPheus87Y
 JEf7NlGVY4u0s7kga7BYMUtk1gc3QW9VYyZy5MWs/EB9xApzW3U4pKD2I2HnVRvo01GGnnm54wB
 NguOfI6W0LjcEMKHrgeQijMlk1rshDut++MHRNOcbXuLsIZL8Rz+hGdvmbk1fP8V+bQoulDAvmg
 yZTV1vQGFD4z3Wrvt1rq8tsvbUytVHxQIsv/AdK48OZLsq8LHIr/IAXcyirNtkmWpgbgDl0Gsx2
 eObVGTPJ5NnNMO/afN4pyibl+HWOHEwjTLCevYrEbmUe2wsCIh2HpT90BSrZFVmiCuAp6ui3FmW
 PgO+roeHgvqSSvkvF6kKHk1y61fNvi4rj5iyh8YUDaiuF7sscxb/LF+GcIY3AI54WLO2ZhQcCpu
 rE+UY9Vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -179,6 +180,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -241,11 +243,25 @@ allOf:
               minItems: 5
               maxItems: 6
         else:
-          # Default to 2 streams MST
-          properties:
-            clocks:
-              minItems: 6
-              maxItems: 6
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    # QCS8300 only has one DP controller that supports 4
+                    # streams MST.
+                    - qcom,qcs8300-dp
+          then:
+            properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          else:
+            # Default to 2 streams MST
+            properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
 
 
 additionalProperties: false

-- 
2.34.1

