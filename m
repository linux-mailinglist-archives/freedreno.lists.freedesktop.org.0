Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D7A933B8
	for <lists+freedreno@lfdr.de>; Fri, 18 Apr 2025 09:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9282210EB6E;
	Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCUqwk7W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89CD10EB78
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2xE7w023398
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=eCUqwk7WrldP/479
 +zM4v0Fh1pXTuc4GsMAqJyIuMvJ3xzsCQIPfNxFk/N8AA/sT2xGygz9P6Wsq/gYA
 VweymT92btExAPH+x+7NnRxNsvnUwxKozHbTosZFAIaoWOJResR1+dUlxkORzc5Q
 MDP5xX4ghYInwmeR4Jrn2BKymw7lLqQ6IEbV1mJ4AK8YNgQBbdHFijBav3DeLq3r
 PzIm8n6HV3qshsBXP7KWN+2tlcifrRbtnYWIHn6e8ioDW4MW6xzI0a5Qyq0hZ5FR
 J+/Z3Q4MdZnibrh+Czvn/V0NfyIbb8A1AttQYbmg5l2G+bSt7/xT12xpQPBCbSAb
 08exMA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq148s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ec18a29aso16964196d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962609; x=1745567409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
 b=bkEaW8fTsH77z5Xzqbul58KfYitzhHj42tvDPs1akAPZEl/C/fm5U54H80dY5WZihE
 3Oti84YelCPg7KXia70/xdVq80MzfwyTwdzsYrOefTpSA4duYbcChTEXmrqk/o5Y2RZg
 2Au+wr2cpXcYwq5XPahpu8/EM4jLd2j1B8MHpBpF1r4srZCXDQmf/s84LcCabI7OufTf
 47kn6+xYcOEFeFnO2el8ZSoMka7u2CB2Lu0gqujVnsKSprGxFf0Qw9c5L/v3loB29owi
 hmOI6jbl2CSnWIYjn+e8M21oBA41XeUeXJYALwL2chpcIKc+iZBq+W/pzt3B7SnV0jB7
 QwIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvEiv6+LUROCUDyCa+WABDeirEA9YUfiRL4Snl9HiddZ96fsZplyoN4AbyClKAiRpSDy786UAWq3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxSHerdN4+f7goAtQ8f478DsX817GbOafa3gl48Mn+ffQOAeyF
 SqmrbLIVlCofDfCXDpoPdwmZTersKIHhOQSz3/1bxTiYtG20gabHtrd/X49kIRjYXpdDWzDcBPA
 WVAZgynW7AwSua4ASh5IXrgxKhRAFW8fheoRA5WJ10ILC6e1OH9CuoYU4Bohc37+dJ0M=
X-Gm-Gg: ASbGncu0TnXBsWfRI2grmDyhBgOYSgoZZwi/heuR5PY2KIaeNsJQRVGZ5jiwkvwJIEi
 o/UjxQgoKWb16smkcbJmMwT44+ucjLc9l4SnvyA/Dq89xqO7sYdUTjvyDTZyzG6wyrMK73lAqrr
 1ZcBtQSvEgYyF5SjljlrFysHMtaVGIsnoNIcWhXqzPBXKf12cibU7x0Nk1AQswz3p7T9lQJ0VZy
 bMIW+042lDPT4aAn7aR4Kit3D9HIv8+KyHEXjFu5Kf7Rnt+E4zVbtOfGAK/s/zcXoye+2pvO9Xi
 SAPuo8wqrMM/nzLKFF0AypcrSpCwSmGmvIh5wdPFIHRdx1fIUAzRRGt6YhDlR9wpl6kXIPX0+GO
 oecbE/ZZhQ3LDB4q6FYx93GTe
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id
 6a1803df08f44-6f2c450c0d2mr29779516d6.3.1744962608816; 
 Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8iXx7BArXCfbFF5WR9Y11877tVEpzeAsMIuGaYxGT6K7Hu2YW/N+89qedFyXXOUKUoeC4w==
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id
 6a1803df08f44-6f2c450c0d2mr29779196d6.3.1744962608446; 
 Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:58 +0300
Subject: [PATCH v5 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-3-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQDO1q+LuOofVd8cYcNAfql+KVE/DX3iMR
 xSQGoRbh6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1XWaB/4yaWBeX7aw7qlpH3wBLgGazBiDKFtr28dA3vc/SLFaX8gcTWTpYVyZrf9HiwpmRuZjUz6
 9tikLOxqpdjAQaivugxlIoXLdi+NC+AcR2wm6L0vq0XstGEATNdMQnxylDte98WCQJgGOBpIcHo
 KAEnZaZmOUVZUdma+8tysEIbTKDjLWnwMY6A/qPHWNUTuw364cWDf+Fd6/vUp5xO24zufNTD6V5
 3cBvpJcTuWpl/BytPFqQIZKciWjeM/Y1fGT1eKluWIfx4RQ46ZP2ODPJsHCjjOOHBBOfIf6StI1
 c0Beh2gfpnDBwnCsXMAf6WwcSsR5/U/bUSuYGsZP6hqaEaLu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Vssqx1YfE66diQ-8lvdOY8a1Nz98nNRb
X-Proofpoint-GUID: Vssqx1YfE66diQ-8lvdOY8a1Nz98nNRb
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68020432 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=949 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
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

