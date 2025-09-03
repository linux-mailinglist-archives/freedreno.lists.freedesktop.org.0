Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A93B41DF0
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383110E212;
	Wed,  3 Sep 2025 11:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntQiwgTd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EA310E7B1
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFpA8012558
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=ntQiwgTdufLpb0Zl
 mWz+4Kvk/qRELcJZblqrIFNw9oARFmbdNAN1dOvp4iHFwcNHaJJ2z9f8F+WCDXw3
 DXnn2aImGRVi9gHSqOJ+NjnxSMqaxVgIuh0yKseq0MmE6Ty5Dg4yYGE1H0S+/jCM
 CfMtnxrN34psB9slJReltftm7v9gVyYqpmFF3CToIP1ozTCxo3ALyfd5GuuIE/V9
 /gChH3SPNa45oH8BeLGvUsHBMcWZFuep9b9iL0gvZUKY7uJ58VAw5wtFBDK721lT
 fS40SjLjESLNk1AHpGvL1DT3+kqyaRj+3V4SxpetyTObR/N+Ui8Uc9/uMIlXiU6N
 oYnB5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjkfqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7131866cdceso82513176d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900712; x=1757505512;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
 b=YxPkOjQumle+ltyvGRckIL8DGm9jh3f5Jb94Q+Ap+5qQFxWSdoyaoKZ3vIO/l3cTkD
 PdDK0d71VgqGObW5cewfEO6B+YsZ4XzP+mzi3s92DCVoPp4J2ywS961Vl6EfvZhpyIuR
 F6uEBWlGxGHqF6L8vKUNKlX6e1eTPYbs0ntwlddb9TjLNM63e/tNVu/XP4Q4KYrNN8M3
 yzdx63lM/mBnUpFXfa6siSKU4FN+8BB5YVq+QPs3/UseOibrkqAVuYUdMfAqldGTX8+K
 AVX/vvZ6oJgsLcCfIIh3KgsnL/cSOEAKEagAhjA8aCkaPUghQZih4crdgxSo3nNrzuFM
 NyZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5bfVNiyW1R3TdPbp6DVBhPyBLzTVYbZeWswN2KW31loSIMh6HkAI+AXhl1FaiAp/DS9sWtfs7cjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbqbmkR7lLPdmHV3WfWDEM2rJdVY3dURpZ609z32LPYpRqilp8
 SQSl/0C+jGE9QAU44OzlVg1C98C8v/hHz3nN9FcyVS4JHMkhJKAHwQqNqEbV8xvP/QydG7+fWyP
 cnyTxuP7Lu1lhtMl1mLdTCIBwfsjUnaAPxvcqxFC1Dg3ACgdNQfrAk8YLh5Ysyp83UL+ssB0=
X-Gm-Gg: ASbGncsHT7M6iDervs2yWqtPie9ndHgvCKQ859wQuMjbfbdIvQK4yicaYJQMiTS1ll4
 mST1PrKlhfOAIi1c1MUmWP7zuHdfBePjAK3IVx9VeXnhiMNeVafLFIcdnzR1wVkxrgOnamWR0le
 FtqzBB5bty/fbDPMnQRAuLHkBavrlnAjqeR32WMFFnyo81nXcObfsGULcr51haVReNtrGacOrYI
 n86vwVsCcT5JEb4O3s7AV3BwTEFtS8dDlRFP17hXaK6dDNAnTTHH4K987/zAkXySsOnHXYJ0qgg
 2ekyUhupXuS1VET3Kf51vLysuIE1Ayj2cYIw6U4TnNYXOn7635Lq1M2ZRQ7FrmWH7ZoJ0n2N7Qm
 e57Z/m3vl23OqPchL0XKdUoOdmMhxYl7ZfXdidEsI+8Fvn95DktzL
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id
 6a1803df08f44-71baf6114e9mr91601296d6.33.1756900712303; 
 Wed, 03 Sep 2025 04:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEi+tlLK0SmA7ZkkpLzHXvsKU3NqR3R6ubhnPBQsbOGPlcQRBLwWi+D2yJKn/0+PaaiwTqSA==
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id
 6a1803df08f44-71baf6114e9mr91601056d6.33.1756900711843; 
 Wed, 03 Sep 2025 04:58:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:16 +0300
Subject: [PATCH v8 5/9] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-5-7526f0311eaa@oss.qualcomm.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y9YD1JgINpCccE59Jg3NJTVxUNq7VK3C9P
 zTiqZYhZvCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1elkB/0S26d6iuoLR5zz4fqpDYtQbGuszfgEB0ByWRteyw2h+acALJqub1jjv5QbeCJNQ+kn3qa
 iyAQB4n7rXkeh68FuZCRJVh3NfDY0uf942HEkaWzhRqly+FiZdyS4g9JsnYLpPxiYgVhGXxUn59
 VWg6zT0Cey8UA0c2nLFTooGXgbbcvQMIWTJmCk8hilPlIZazmr+SFwREXXeGStgYLHo/wA1cp8k
 pIqt/QhC/zfyiIXxV2arNZ3BxHTkmYXpFl2+ywk4FF2cpRckJ1tilrSR0RZ1/bPob47o64is3gN
 LOGKezrr0bYlXp8b9yi+Zo6LVGTiqwHP4U67Yklt/McRGxF2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b82d69 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: a3GR6A1uhWzOr2tZUeJIQJAySusT_ViT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX5Chgh9LGuGG4
 of2v8ZFjY6vEBpxo5yNDCMyRURnbKdQjCxEbsu2xUOmsMBHgif2RMBY7gBWnq/FPJOATjjU8f1S
 BruZZfJ8N6hb2d1oqkIJDmtCfZ0+Qh8dEnD+4vlegiEQyx7EzTvwBHL6woFwZWgTjIxdRXr/S3t
 bRIdYv0hBGkE5jWaCgN44jYxH6e5ww3ub5T1y49puziTevz2WuQHbgyO+7N3X+Geu0nquauXjb5
 jD0NIsog1lseA2gdRJL3XbyD0vfrwDEtOtkEkD4rwR3kRzuC0ok4Jep7dZN4PkKw+auvuGH6hdv
 RwhubYrGcqosOfLNzvyX2sXIorHFZfD4cgA7bjDDUCJcamp+85EZT+1+1FEt4sc+WKL8mWswLOU
 387Zt//A
X-Proofpoint-ORIG-GUID: a3GR6A1uhWzOr2tZUeJIQJAySusT_ViT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2

