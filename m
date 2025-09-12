Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FABB54B32
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73FB10EC1B;
	Fri, 12 Sep 2025 11:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLLgVOkZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F410EC19
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fL9t010823
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=; b=ZLLgVOkZwD/EGXgm
 dwIgV9pApQ6cleVbKK/6af2p+jTjrCAf0btvIdQt1Gq59Q5onQ40i0l2fftMY0Uy
 bYXxTC6pMBGGGs4MDMse1hoxCl7qp6s4827o67SpP4PAbhtr+jV3JYHrQY2OwN4p
 +hZnyDluBu46ibXlKN/9NRnC7B9mpX811b0UnyHrT+iId5//9RRiKOYpUt7tpg1g
 5L21OvWn5MYRQFRLU318bQmJ0Jh6AflzMCYVB1+B+bVsc5tPp9Dqpi74fTmuBmlY
 7trrIUyTiD7WZIyDymViiP2uZl4hXwgx8scU7EBpA6nh4WkqaEOG7tEda/MwlFH2
 ecN2Bw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mba26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32b5f6d5292so476476a91.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677184; x=1758281984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59rj00Uo3zScXl9anw4BJDMpejse5yew5Wz5zTlZCs0=;
 b=uboa6N96HdArptSZDfMbAYUaOfzza4FBLuBafB2JPQc/VD27MAq3GGiPZtOGXmde/Y
 pJr0i6qa22YzMWzv2M9XeXn94zWe3nXYu1KHJfPFrOCyCpEulGV9ifjy8XeZHiFuFknM
 KnoLLOX4mMUhpOPLSQaqqEYHLY0o2pb2Iz7oEvjFUuTdFMGJrOVyUlRFSXVUnVy2yWeh
 s2WPFdrf59EFWgjtiyr82roeiJ2QlQY5V/libaI6kX+XmmTH7EE4ecQffW0ZdyQHmbXk
 DRqc+VWKMvyaXP3hxiALhwpHqHt+X3vWIKmAIxJnROdb/hTy6OFUi4LT3R5/WmJqtLG3
 Ltlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV85K9GFrZV3+xNLz3LeK9ObWseKeg2tx3973rDoLoWAsVXJTcAtuBpAvEN8Qyh25/koD1GqdxYd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4wOQkdBMzC4S3BJTNuCEjvVUm6pkI45l1SrU6SYWevsYqJert
 n1U0dI2jwD41v+NTnSWsNsVpQIRXZba5H2AcZbiq1d1Ysu7ji5Yuf6/yVdFcbbaU8Nj+LM27SAo
 SxEY6PjthxhbsMnIg5Ecfss7jRJMREbr359ktzGnRPeAMQIvm3qrCC1Vry6DHJU5X/HBj8eo=
X-Gm-Gg: ASbGncuY7SyrnqVBYJ6s1vcKbvTtnPAFrmPS1ow0Z0LbjFOEJSvkphnL5f+h8h2VL8Y
 S0tQAhMhnzizejQ6vsB5t5MPvOXe3fF+XDWORhddCyKo0I3sV3ToyY104ZYsgduza3akivok7Qr
 4M2XpRx9y5fnGkYHr9MEHGma5JikpvUudn3hjmfZtuU9x3PlVcZ25aIScCMTTYbidLy5xokhEe2
 FYhHDw/HIjxozAgSZ8MiI01FPs9x6hXHhzrKHGRO8dMUuu9Ds1+7sha28bDe8oTKJ6an//mYaNh
 rOQ3zLzJNdLKStxneJsdfHVwX9xFhc1r0/poTlwYxnmVuO2/iFNZDQdKZuQJFgKkFb5sboFddjt
 HzTmLh0DO4EceivrCFH95tVtaAZBopKMmzc+cQVlmsL5m+KjOPDkJ6mWu
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32de4f80998mr1685182a91.4.1757677184288; 
 Fri, 12 Sep 2025 04:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN8J7dSHJlf1bK3eu79lm+dW5G5Xfjiiq4Mp8bFzHbfNDPDpKNxRTqTagtKWQGq9O7pdVh8A==
X-Received: by 2002:a17:90b:1c8c:b0:32b:87ef:5faa with SMTP id
 98e67ed59e1d1-32de4f80998mr1685136a91.4.1757677183700; 
 Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:39:43 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:16 +0800
Subject: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677171; l=1295;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=iXID0C097LlDUB/zo7wU7HLlfkLmr4ASRlNP6RgIyjA=;
 b=CP5uTwRTZhS0ty2t+/L3sSCKvXc3+Xx3YfkllA0kqvsxBtN84bm7Wx5HahYy8qmEBjjDQ6yiA
 coC/qz/R7eIA9rz6ilS1Q6EwxYQAyEH5WSf4CprNO34jp9ZMzzCVT7I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX7ZLYwHG3JNFr
 mRi31cVOY/bWhml8ISuX+c/hZ8A3nTsfeHkbRUWwjDMYvq3mPGt3OhjuRUDGq/IHpQEx30pOLF1
 zyzyoeiZCkpePdbR+MEYwbJ1jAAlbUEmckC7Zm1fshvtjOo/1Xef/nx4h/9g000DEEWIfMGHj8s
 q8Fqdyp5ofgn2LU5zeRtvpvbY4pGd1CjBFwNTHKft+NUiDop554AzARoPvFbgegBpeA9BdJy7O+
 1lyzAQU8YpQJFSGcoQrOFcy/B924Qbltljl7X4ip0eQ+U+ricdaHoWEZc6aaRnl5OA+6L+1eJMw
 JjCRjmuHUkbGmP9DnH1f9/9MkwLAYjwMv2PjFzbcxOseLqoRYPFgvbEFOj8m1CqErBDTWDZjWf9
 1Q//9KDQ
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c40681 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2t1bcwrjeadYucq94KYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -eC1MCxGtjpv0B19FAsvVBDtMyX0hgoY
X-Proofpoint-ORIG-GUID: -eC1MCxGtjpv0B19FAsvVBDtMyX0hgoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
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

Add DisplayPort controller for Qualcomm SM6150 SoC.
SM6150 shares the same configuration as SM8350, its hardware capabilities
differ about HBR3. Explicitly listing it ensures clarity and avoids
potential issues if SM8350 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm6150-dp
               - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
@@ -261,6 +262,7 @@ allOf:
             enum:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
+              - qcom,sm6150-dp
               - qcom,sm8350-dp
               - qcom,sm8650-dp
     then:

-- 
2.34.1

