Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A99C1932F
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 09:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4370210E784;
	Wed, 29 Oct 2025 08:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cadfr7vj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8bwwK57";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0FD10E77B
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4uqjv3764236
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=; b=cadfr7vjOW5fuuCb
 QJGsN1KLBOvO8/dwJZc/b7Ods6U2+/E58bWPcrSemXZpLySSvufKu3yB4lWqRNad
 1EVzMgwMm9hws9mtuOKPT6A5Voz1AJa6F45Bl7Tm6Rg0KWBooTGgpJBTgfJY4is/
 +I1KUSzwSv8wPlC6Jlnz0kV6MrwCAl8DbkFLUHCHW+1aEl03ycTRXOJ/2JycECQR
 BobhRZpKTTAxxZV5dTr3fc8InOR0NJWAxz7g6caRQfY0Pptp94fxlM3eI/qK7uti
 +qnnM19hqiVqOt5K4e2eaz07YjpyGcxYek8s3hLObx16yDI8y9JkgnqqLZpcI5ht
 Vo+WBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11v57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eba930d6ecso143451331cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727925; x=1762332725;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
 b=T8bwwK57v00Dsjzk+HojjPX3dBZdxOVymCCuTCN+J+okrwGqVhEFdDk4ksQFTWHaqb
 FfcBAdBW6g/MS/SHstdHJHB+e88IoyXKWiovPHiMJeQtu60ClHDqF6B4w6klUxQ9bSie
 jdjKKZwowTGZCrzyAkdkdbdMhZ8yzaTW6bbfYphEy8y14pyrce4a6wQhJmIEi/a8tqAE
 Do3dkoM6C/re3JwOjcrBQTw5CpwB/iimNNfSqtSICwTsZTiCipmcVHwCSDn+w6W4uGtA
 oxW0gpd3glJs/cpQ6Ls5B7E1ERHgKNS2labmtUoURW9StocbJXWrAynOZvl2QNNz6iNh
 Mx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727925; x=1762332725;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
 b=W7DXZGJMSXLWdopBbR12+PpvKZT1v+JkWEi6gdIZg1a1dGXJN+bciEk73bkCiEXNqa
 0fZanzCmrBGqBRkf+mq1sGVjHCMWTacJ6VCTNm4sZ+t4pAP6HrhCWuv62MEydcgTrfwK
 qm82SlJIMNkKQNaJUP6bTcOYGnySd4gj/y993xeBYoLq1ty67jfV2urX0aqUedqxwU/m
 uXu5XBK3asVUJbYE0NVwNtz4WQZSQG5ZEscN1u74DzwzWqXb13VAXvHHIjUwP8yb5ugb
 CZ/4TfGLb91Mu1X86XDgFV78rDQZQnsw43ojZRHop7g1G3AChCrRV5p017l1lQzE7U3j
 4szA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsDpGAtE0CM8QdzM57gNl1F9Jo5QlMtHSzYLhANMGKTHbGn3d9bWIKcugMgWroAs9yjoNKGOvFVqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmfIm2Reh+oOYlTLHs47dNKbewNKxpDmURDM9KUaXV9nso/wZn
 cLOfnlyBI1SLztZsrwy4b4UawqD0N4rJWSyaG7NAmL6dcHYTnqvyNM1cSMxisv+lHfyYmYY2zpW
 /ISRKEzzRh9M8C5H/py9WLZT+jCigHJjhISRhRmJj/528twuOWR0YYCQ9oi5Y02z8ad51UxM=
X-Gm-Gg: ASbGncujTEjtxxC/EU0xE2/kKqo5C09sVvQ8jG0v1F9uDnjTDBQnNRLVADd/2gPGcAR
 Sz4N6RBrtHuYihOwkvZVDGCjwFzdlxUCXjdLfOHMGZokxXE1Dtf4nkBhm1gt7p5BaQegiNYSaMs
 xxBJT2J5utxkvDiSBarxvULgsJEYshbwICIUayHffJDc6k16FRbHA2+ycLH3ehRKSzuVE1m56SU
 mk4nTpkF/8eyCTNq2Mmn6BOT72eK0IB6lpHxziB+uCS6hZcA9yalE4fGdej4T6nSiP2FIQUuyCu
 2fqRyp6OA/WSCrRVR1t8FoSymeCe8KinzVUsRVi8/3OAGOxLf65cZpkTNmrh5PwmmWnprOvXX+K
 juP9/XNNPHxbyDqWQPB43/IU=
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id
 d75a77b69052e-4ed15b553b6mr25060901cf.20.1761727924862; 
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjiYnP8CmOdJwyrlYE0ezop3noeqHZDiwSCLu91+J7zUHKyBeTHNDIOJ1tYu7xGib4zKWcw==
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id
 d75a77b69052e-4ed15b553b6mr25060561cf.20.1761727924434; 
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:35 +0800
Subject: [PATCH v13 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-2-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1102;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=32UZGh8w+Y66JdiY+deLaqFEMHtghnX7C5KIbxCtz80=;
 b=xO0ks7BMbn2ygrt5SJF56XAhsW3eyB67Lj2pj7pMykuQPA4fxNHHn1Zu2WCTJQ1crpTf/5RTK
 foM4EMKKA+gCqUaHoHL5mCeXSDFo9uRug+vtNI1P+t+UM+Jqe7/t7e0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 7aodKG98NhgDYjne2OhLtcxlA01qCeoi
X-Proofpoint-ORIG-GUID: 7aodKG98NhgDYjne2OhLtcxlA01qCeoi
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901d5b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7hmKyP8XuOziMQ-xZMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfXz/K8HnhTaxx9
 eUNCMyW8jZJgAo1mrclME897c26gICGueY/drmAsoirmL9eO8IWNRMhdYqzDys0drL4DNXBEfwH
 fcvDjFBXaGmqMLp0phMNVXywJBjLTpX+RSz+4LlyXvAsSSU75/Kvr979Hslt5YZP4TOPST0yqgE
 ItHwNSZhEZc3IzJX5luyr/Hv2WjjmOjEOP26FNUbrztEqX8rhqDgsITpmIsVsLPj4HKDUVYW59d
 bLNUBzwp1S2Nz9vj0tLT6R+8WEX5ZE0h5FqfYDNVjdHc1Qm/C49VqC6p3wR0zJ0z3oIaWH+/Dt6
 eXsrZN72zrlgMvtgydv8GAuMucecoCCJZxYncpulHFimYr7GqH3yr18C4Ii2ZXlus3+YKG1m3Go
 ieY4vS7rC/9J2ZokZmlqM1TmRmVerQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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
that supports 4 MST streams, similar to the one found on the SA8775P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..ea88e1903f26 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,11 @@ properties:
           - qcom,sm8650-dp
           - qcom,x1e80100-dp
 
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sa8775p-dp
+
       - items:
           - enum:
               - qcom,sm6350-dp

-- 
2.43.0

