Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DDA89820
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6310E6B1;
	Tue, 15 Apr 2025 09:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kL1zVUfr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0D10E6B1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tQcL005498
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=kL1zVUfr36rU/fJ7
 gQxGIoxK1xzW6l9QfjImDxtZDsyxJ6w5NM/GwM6Icwwbw4LhjIFVSzg4tDEQxLzy
 ZInJzE86UNyLBVRJTnah6/HZuWd+ViBReweuRJZOabYyjkZFOO1xFNY+poe3vcpO
 NO2zWkoEyGSZTIIidN1E1frh9X4I4Xp2Tcspv1FpprnIH11Bx5WFIkTTHQAQ3vir
 lfNamnQhQp2WNBPiMKkVs0J8Sd1YB/hjs2Ar2sxYlyOfNnILoP1ns9ybhudgAcUE
 57Uug6jGStzbjOAxVIjuQdF4wQAt+S+SEpPy7hhwVr40zENL+3oTEYUU2VUz6uIt
 hzzNXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqb66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4769a1db721so133889611cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709979; x=1745314779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=;
 b=XKEf0/FBmpgOOtRrHJV/kK6X8NwcB3x678DsuvS4VvCPN2ey9T3EyD52DHDOyf8V1h
 +p5O/bxen996p1M/leHORFVBBf+1gZhwY12LCj0Dekk9bqzofWJSubdfwnQtgmls82Ij
 z1PwaBIUFn5E/vUMQFT1JDfITo1Q0A5thFINAJtRgOEWRVsOokw0C1etKBFLo676cvpo
 ncZ3ZdiKarUsfNw6w+TFeOGcd21IwJ/ipC8pTI7SoX8QOUp+wvGYj7I9F87Ah/y2NqpQ
 IfQmAzkjgAqCqiM9RUhMPnBruW827Zx9cRus0hbZkdKWeZJsdClH6uyfLYz/tYtzdBIz
 HD7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9KAYAp/5d8HrJn5htbv9ZU4BQUHR+BJ52ApoWA8AmSYp3iaZKtM9OznYlvUxwglOyeMeP19QMFZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqf12tmJc7dQdG/OU0oTX4agL+KTcV/ymCxxLZhZT+SyJCxFWv
 BElh4MdYmt80D6shZruY9jKLC/gz4AdBLE3FqdXi46/z7JzCC5SDdUp+oTn37uCoSBk+5mDsanv
 5pAvnpYk7HdToqNuGSHbljjQbtcKVCCmz/78RV7hU/kx7zT1MPf7fT1G9+AZXMFdETss=
X-Gm-Gg: ASbGncvE5FFBoLQg/BQQ/SA9BOvFLwpYgekbfgH6AWINlJCyX9ClRJeSRuJvS2Q7/t2
 rilWgc1bt8R0+jRUwgaAoEqsSrIdKECWAs9edTCnYj1OzIO39A3xoS03z22UZ0hdKUQffVYyb9u
 rmlGOfOJgSDX/YZYIFOjU9GsKEVKk6v+x9hu3bAP/3bcyqddlzvHjZT5ph9NyfKr+/Y+556Zxuv
 hI75muQhGVKzMZF7bH1YEFviw0trRtjuMA6ppJ4hwYrnHvOoB08oonhARMcZ6TlXAmWzabRpR6F
 iFDaI+mLKZ3znuNeGUCiJh8IWLzzaSpXtJ8NXPVdOAv/3f9IsKDSqUNwvk1/Ylxx0LkqkYU3QNR
 +rIza2vEA2bAC0FEEiF9jpSzx
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id
 6a1803df08f44-6f2a4570302mr17557856d6.32.1744709979232; 
 Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8HQSOjLdhDHbjx7MvKXFQUeBcuAVyf9AOBVsTgsUZ5CPpSKyGS2MuHBbgjiijyBhmUGHLfg==
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id
 6a1803df08f44-6f2a4570302mr17557576d6.32.1744709978884; 
 Tue, 15 Apr 2025 02:39:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:29 +0300
Subject: [PATCH v3 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-1-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVM5htI38HvCqRt9nmZdp5w/Rq/WsUjy1Jg
 k4ECt/1uxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1S1RCACWIt1/w4yRBzi/5jbjFt1pJ+46EIYDCwGfet0spVeQ215ieyx4/27ucKQt9TBgzz+voDd
 TWRehj8HgLrW/C+JaCj96Seq6llg726XbHB+/sMhFDhstlhVb6yhJVnnlYsJGJREMxur9gvLHS9
 dIOdBe0Ilk9x2Lbd1icTCOcOPaDGNSMSTJBi3hc+p85r7bNyeSqrrrt7cx8VH0IB6KaRxPVcEu7
 HXtJE7m1KFrefpz7YjYN0I6A7zhWcfgQzFu7znRrImeQP9HjVUogsN7B1pUkd9ezpVB5j6bA51c
 KCXl7IM4ZOJN6IiHOIJHGfckVOJledcW2qqRlPyPd4SRN/zh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wpTfRCP_KUJD-OsbYoz31tfzWACK15rb
X-Proofpoint-GUID: wpTfRCP_KUJD-OsbYoz31tfzWACK15rb
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe295c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9
 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
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

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5

