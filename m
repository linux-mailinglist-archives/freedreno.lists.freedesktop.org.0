Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B9B41DF2
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2603410E7AE;
	Wed,  3 Sep 2025 11:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGCgS2Jx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344B10E7B1
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEwtE000792
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=; b=PGCgS2JxDn39MdJk
 Qmtczw8VuWP0yZlwY0GANOUIRW/IpSK81WY9Hp3T071cxMSqfZW46dT9bCHebih6
 q/DITlPq5X1EpFSkdPUd1Mchz31GCkMxZpho0Nf/dFH9k48gCgwW/GE/3bm9byqR
 BZDu37Tl/TPaO6/yzZY2otYquvghond01k81FVmDg68g/y0N3CgFflo72Nhz7SK2
 kPPcAzg5fePIKjrcy9V4ugQmjgs74vx5r1qleAsNgP/5OrAPjit6MkP0+6WltZ2P
 +DAgJpUOFZl2IcCMQ7qwN14GaPKzRFIWd3DMinaVKo4HbYEM+5pKPgQTcAQTTSYK
 SEscyg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush33d5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b339e7d107so56973681cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900714; x=1757505514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=;
 b=QV/m6n0wRTJGCpOM+XLiDBaiKUCOd9UYx25j5ouU7O/sCtSVHdpI+sTme2hdkRogaR
 Pu0Q10cySzTXXNMgvUcWV9aS1dYalxtaIHZMB0WFUumNy372QFU7BsvvBA2VRh7LVJ/N
 6Fdbr/3aVVjNVCeJTrPPOS5udds4E8jlR+sZwo/MyUSW+x94gjoYpRnbxERX6I8X6vSw
 glZ633GOEmwrUgR6wTNsN8mMIG324+7gQdA0SBCXnHD5Zp4n1xSIHNVj1SImT/RLFHEm
 zEFMoJaELKPsCDalM1LcK+KBkcnqQH8bcfQv65yf2KSwhu6oD6HIVKI2XuKRWhEP/x9s
 Wpng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY8GQlagANXNBCzI7PLymGIDvJ52gB04uM2Cn3Xhlr6qmKkWruDo1QPaiy6W/OnZxpi22mfiClwFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhmRu9HdTq89cOL+vw7ob7Pg3WIjN1vcrVVxjBcFd8rDrR5gIM
 F/0FXL7jFJriPdxSSYEV7nMqaKZAz1bTXMYbli3Cwiefe+WCkbwevZiLYt3liVyv0yJKNewbOGM
 mw1OoLFmNXlLuPIgrvGuE2GRZNsfnUWJ3uFDhcwtqC+voyJ4MWpvPjz9a7a+5uTJWlNyg2Nc=
X-Gm-Gg: ASbGncsyPYSLuUzngbMpECIi4mEz/YXgCWeQ5QFbwbO+PwpgCq/WcSd6OwE42NSDVk+
 7w9tUK1K6WXxOBP2pmO+vXGyh/7Znc1fUHPE6voMrGrkXl/CfQ6Z0t8JjrHyEwwjOzcPPdv3S5u
 devc0X2MrR1lHSTaK87O2Dq7g6JsKwF3EzdcqJGzJGSwZFsVtvxblHLbhfQe4K6BgLa9H338Jk3
 XeEcZ/M9dHqYqNE/uNCp77TgcNzLRLE/f1bIsovfNOmltC4WayPYT0XzGgW+sR8vAhFHJ9AyftR
 p9vnMl4MxPHAyezi1B+lJ7DZDxe0E0fVOkQCvT1qLYipBZv8ZSqegLS5QxukQWkA0ebsKECU0LE
 QNt2h6OC691zOZx4FckFcPjio/j6tQINJhltXQWr9n6qO7zGX0XuX
X-Received: by 2002:ac8:5708:0:b0:4b2:a96b:11ca with SMTP id
 d75a77b69052e-4b31d8c03ffmr167861821cf.35.1756900714339; 
 Wed, 03 Sep 2025 04:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkGGAS3RPAQRRlAhwEn7il9NRls7BjhMAjCYkS0WjfrgqegShhrJEbGNDK0zM3QZXpoVuOfQ==
X-Received: by 2002:ac8:5708:0:b0:4b2:a96b:11ca with SMTP id
 d75a77b69052e-4b31d8c03ffmr167861381cf.35.1756900713772; 
 Wed, 03 Sep 2025 04:58:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:17 +0300
Subject: [PATCH v8 6/9] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-6-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jRBkyHcr8xMj4BTwupyA6gCqxajStjyC+O9UZ5EGgLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y3hkuiW1SdkWdW290s9cpICY2nNpGq9u2+
 ZHdafw7MJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1RmYB/9/VcpHWh/T/oWqH9QlA/WdaWLvy2U1EC9r0ItZxVKnxhkQSnrH/R515kKz/bJkz0lBrxv
 5rZpsAdlZAs7zfHNe7ImD79Y+IhvUWlWpILd/MT5GHjO/4Y6PusaYedg+kJ4cacVKecLb5FAlYS
 zEVK8LBwv5piuq8veplWWb6t05FnF2Zq2QuqRGR1iJw4i9kK4EzInHt3n2b+7pekkGf1wqffVZg
 veGoMDumdL01DUrZvJP5EjIKnj1g+MmXAqRzfMGmgQG0PXINDlVgzA2ct+f2T/4IIOqF3qy3Qvp
 FIb+7nKcGES5MeMPVPbNLVIPIQricUltNMD3derDF0Ou26eW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwGA4KRaykNh9
 sN5UztkBY5Mf5LGdvRV6HAiEvIZwDe50eCOWyMwGAyt4dMOg0zYH65npKCZ3zeGG1ukB4bzAAOu
 qVTaW6lNh6YsGE4qkeA0MnEIP7B5FFPWh7dMl+imEpJq7amDgHEoFPky4+uT2IbQSe+geMgpPm5
 HmB+xBgKKZYZmC7/PecUc5kCY+c5CnQ7sP/mCc6599QOZXsDhO44zgmTwwMjzdlzJU/BeBIFgXE
 zmR9+UKodqxdJHN2FBNv5Wbh4p9FVYP5RJHoEOSaAbz2MSuOicybkwPREa6ACRaUBKmMsozOAQU
 sXmWKlBDvbw75Yui8qBsxWzDdiylDqsAumdmBOo+Uvspcwh5X5ZBjt9oDQptqUjIvy2qlXD1px5
 OebtwiAY
X-Proofpoint-ORIG-GUID: j1I57C3vcZLmNIp99jKNoNd3hCM9_rJr
X-Proofpoint-GUID: j1I57C3vcZLmNIp99jKNoNd3hCM9_rJr
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b82d6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6316c929fd66588b83d3abaf01d83a6b49b35e80..afe01332d66c3c2e6e5848ce3d864079ce71f3cd 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -86,16 +86,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.47.2

