Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472FA89824
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADD910E6B8;
	Tue, 15 Apr 2025 09:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/IqUdzR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA42810E6B3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHZA005247
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=k/IqUdzRBucNQj92
 R2oMofXUSvg68XqSvUpoLzeKhEkncj37fRhj7sxxT//9KzNeIettuvkUxeJbWAhp
 fdJjNj2HXxpls9vmuDQkZy2t6pBID1MAMU3GPI+sdTNiLGXnK3Bv01zlRd9uy6yR
 4YZWkhKD5Y/7HxcIA5Bs2wddIVY5vA8gCr2nLxUDQyYEv6WcpM19N/W1MAE2OzLE
 kP3LvobnWGmInRCNGAwZVuwvEXT0KDAN7KStXKnT3/irwgp00WQDh7d93J2knVTQ
 KXKNbhFJslrB1yBKTxM7Dd6sGnRj48GgY5phhPhURKtEstJDk3TXGjfIY1iIvTnP
 pygfig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqb6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso83266276d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709982; x=1745314782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
 b=uU2foJGG1xJAnx/9ACCOh1J7rJ+2tO4/+hOoYIohqQ+noK1hpdimdS8em89g53W07J
 +/CZFNrxNzdqPVId0ktuD2smtcwGro9yyUt/Sf0zlaodArD53GSDgbtO5z96HHtfceXn
 Xu7UkJLkpbFjQ70DJmVRNIAgwY3nHJFCk2hKmYudw/YVrReTjcKxvyqz0pVoIaOexbD1
 2rcuM1qFjzdefHQOOTuyUDpaRSPPOLYyTHmF7Vc11PzMRlbWdaatgqszkIX2QNS07Bcb
 IHOL74Ry+jJMXA+k/O6NzRvMrAdQBCTgbA273doRWaI1JpFDLt/lzF4Msvvlj8ITCxse
 S1yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEw/8K4SAe6FhA4VwcCnz+O98mkZKFXK5smakp9HI3oqi86Slt/Q+bJdPULbSy5AAEpdn4JhqoudU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcuLSd1Aks+LLOD9VUuUGjETsAWKemE5ZHg8cfbvizXPziuCQI
 b7vd3CWWiYxezI9AYSGGtI8wxgz6Qro7HOEyH0M1GOP5z0r4DCgAREgD6FVi2lXy3zzBNXU5iVk
 DuBsRGPf1WvG4QW3tRNXLXRKiuM4IVLmZMBvN0Apju5edqP8rAnx15n+oTZVrvonoPyU=
X-Gm-Gg: ASbGncuStiSAtd2AJHtEzhbDGKKt6GyL2HeEzfUhcdID2UXsOHeC1GnOqUkT+RjG9+4
 fhxjPGpbh6FZFfHRw2XAdYk9B0PBR7lZIm/CHXNZs2domVUUrDdueAqZ+dYxu9m79fE1hZYCis3
 ZmDOLOyrdE6vOiUJYTPuWlVuswoVjQXquKfVgHZDa69rREVkKBSieWucpNrcr6f3flXdq+r9w79
 AnO4UEIC1Q+8I2ao3XM0e9+fs6Egu2RkFR0jeLdeW2rE9myyXqmgsvCVLa2gTGRChhoVHPiICDT
 qKy9fcGJPMI0eTrTKtE7w7R/TB5mNhBDds7VW8ygry7+uYerF22aHiw2SQsJpcpQ7el1ZpS4wR3
 eJHYJovlBNJsZdfSZme7o3MHW
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f230d950dfmr209919796d6.26.1744709982022; 
 Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD83JrRkLeYEAhElysIxFYiO/qrqAOuHzc5Obfv6TO5nQKTCzkIT8H0zCFaFZ205TMR64XhQ==
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f230d950dfmr209919446d6.26.1744709981708; 
 Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:31 +0300
Subject: [PATCH v3 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-3-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/o/zTCVhoZqo+Bz7P3TL5bcP8LWqHb9WPmSzRN/6Mx8t
 JRtt11JJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmEq3B/t+n82fyAwOWZ0dv
 PQi/YfRnoaUis4BRVXovq1edzsmEqUVHTrdOvs16+XxRjd2kRFfpKnYrr3s/Sg5n8zE+vRt19kr
 emb2N7Hczpm7uPHs5a8Ozdt+nsWZnpopssj7n9ztevHnXqT+KM7bJHD9U4ZDceeCz3UZJxqhcY2
 bfKZJHtx0J+unkeXSPm4/mvxRFo6DpBWrLlG7E39CzPrSUUffJtip2YckvRx9dFTl68ax/rjRj/
 rITUXJcKVqJTgevc69s124x8WP8UtfY35m3NJmb+5v1HSOB9Wulv7/psJ691q+2W5pRoniGdIzb
 oQd2T3rNquoO2tobl3n9+WZ2iC+twMVggef195KsnoXcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3Hp-6IGhIB1lH8r8jWIs_t63B6WgBU7o
X-Proofpoint-GUID: 3Hp-6IGhIB1lH8r8jWIs_t63B6WgBU7o
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe295f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=944 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5

