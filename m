Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111DA933B7
	for <lists+freedreno@lfdr.de>; Fri, 18 Apr 2025 09:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491210E422;
	Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUru5Xpq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAB610EB6E
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2B01g014394
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=PUru5XpqfqFRT08T
 nHXHpsDY+VA4QmDzbPrb5brP5c9smsNx5LyujGtOp/tU5LTKQJNIzySjOyXQ3rae
 woNy54c6BgotoSqLvCQU5rdI+IrD1L89soeEHgH2zRoYNLjSz8yZhvewKJVnUx1D
 K1vaJe0fWPvxsqf6BFUTeaPxd7jtKFUzOdC5h21iu14xQLKfKrPwGb9dmBV/j5Yt
 S9IDzEQGgG7Ua2AusjYOmxa3aAHyfpKpU/grX5hpqmuwS1OFYAwUIU3tZfekpKD2
 51mFG4iuBSP8c+4UzkDW4fxdnW/4M1ZBlUdDxW2chteS1o6Qye7mOeHYvq7jU0T1
 +cjEJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6sey1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so278899585a.3
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962607; x=1745567407;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=;
 b=bTC3uQPFaRsX4L/7jdlFxNIY3G1Vmp25N7Lh56gB6NhzQ6FZtMMMupwGC83zkB/01o
 PEEzLsxirCblNopCSisn6H74Y9DK+6GN0lLx5fF7CmsI+J5ILRIroWnquG8WxAIG4v09
 ZB4Zj2e4utzCAtVCyecgPvKgI8O6fGK8v2SSNXlJQEd/WPJTZl5u19TEHtZMyk0tGwcj
 od7hBSrk2D1P2xKsiIS2ibZz7jl8ulGOUTD5t6FAO3Bjqhugqbmaf/veLt2Ohq3IlNu4
 Mr49qVTz8T4FqfcSfB1+xkFFWXL3CbvvmTYxRY1nFac/OBuos44NY2nPBrRRpr7ou2Ap
 fllA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGDiRwM3ZCF6I7QWvML4rNHLuSheNVGVad+EaWg3JTOv1Tk30klsOfsYX62tUvQezwif0eniW/hrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOY5SFFSdiZFxnfYuM3GtL2+Uo1eeKurZIDIT3Lv3OEDcFhQd6
 NFGmcTvOSrwYW9WCS67TgWmQK7mjAM96t7koHHNHtF+v58AWBxPguBfk/2v5u167N7chgL52zem
 bEUwtrCDR8Cp0TNZPzbfBnbij3vK/dhPg2vTKQWns+zwpOe4S2drlpzYtEp6bQZ8Hk74=
X-Gm-Gg: ASbGncvFROlzjWVj9wHz4MHYG1IaXx/LtFTHzSyGto+YCtVw17+53bt2h0NVXLtyc82
 /ksUY+wCLT3Z5iYEymNFM/HmB/JhG+X9T0GJsn7PTR2L0b0BpXBL/9FL1Td7k+iFwMCd154h65L
 gDdXWs5T+AidDzLGRMBAld2lNBBm9JQjh+BTKlOOWWIVSn8oNdZArMwotFeCH7SmUCfBcF1BWtU
 baW/nNY4Qfa5U/wvEjsXLlUhz2G7hRsKBvNfSafJKgjAaxo5Qr6KzpnKnMn6smeUX2Fv4nR4eux
 1Lk+hDV6dc1wr8pzx+GUs/bFL+yyYmW6GcIuD3bHsicfWB98X6buj20lRb2pdmeRNrvdM4NAW0p
 l9qfZcK84y5tx20RUR2FveYaG
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id
 af79cd13be357-7c927f6f516mr346457285a.5.1744962607356; 
 Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDI+S1exMgbzLCMej/vP2nfjUJLnp+OrKaG9LB5gOXVXZjTqPv+rf9maHdYP/+WoLEwO4v+Q==
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id
 af79cd13be357-7c927f6f516mr346452685a.5.1744962606991; 
 Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:57 +0300
Subject: [PATCH v5 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-2-442c905cb3a4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQo8uHksX1Z+bs1K4UU3yWjKbItou1IWL6VA
 r8plrMG+d+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1b8+B/4/69mTxB6Xp31eFpiNqiB0oxvJqAspedgY4BIf5/wK//uiBNMiaCSKV+bgmKVemFMFHhj
 uQ0ZVtpxOHg7yFI4FO/C9N3O+LrY6qvCYjUzJSTU/QpaOk+uDG5OWSk3dCUK/0FeAT3l6ftF3PT
 QNvbSr/kPMIB6GQYieP+36ZwckxTd7eJif1zkyDgE62ASTYxP0JltgMLoYis7PrcSMUiSPXpDz3
 3qgIjXVUAJNxVIvan2mhesuAHcx9/Ta8xzifZrBXAHfjl+48oDqDkjUy02tinKEAQEcpka4dBw4
 6UCTIdF1x2SMdwefypizfMXeXYlkUFPqPUVa7bRc7d6gTwXK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UpVYR3tSNFYpYtf8diCc_x4QuJmehB19
X-Proofpoint-GUID: UpVYR3tSNFYpYtf8diCc_x4QuJmehB19
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68020430 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=888 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5

