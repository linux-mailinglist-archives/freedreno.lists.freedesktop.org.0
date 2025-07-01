Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4CAEFF7F
	for <lists+freedreno@lfdr.de>; Tue,  1 Jul 2025 18:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1A10E5C1;
	Tue,  1 Jul 2025 16:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUvhWPrk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B61110E5C5
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jul 2025 16:21:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619sSKA018563
 for <freedreno@lists.freedesktop.org>; Tue, 1 Jul 2025 16:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=d/3iIbnpeu0qJbEV9ptsqW
 QCU/46RuJv94u+DuK5iMw=; b=JUvhWPrk6HsCBLsPYyQ2nN1Z3YHNct/c4iTIaf
 qpW/UmtI2RY9qCbXoB08muE9by9ir7bNv/QFGuj1FUZhAY/BC3vsS00tarygkaxb
 AApX0irwbCyYndDLOE4Crp1svDyLJj9DawQ/SNMfHm8I9y1JP+mQwcQ9TtVXK9ZW
 pIkNuMw/mRy1w+8qW1apVSHs1yoIffvdA9OcD5cc+2CHJSj7wA/RQjWt/KEC6cuS
 w+DCfvDdox4fwWToz00MaSVuORc82GgKzGn0zI2FB16Dyop3/xbjT2fuuQoqKbxT
 kSY5eu5uLmRz4GJRF/OHuSATKHr8+Dy9rb+ArCbo9/0k6R5w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxhn1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 16:21:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7394772635dso4434046b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 09:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751386862; x=1751991662;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/3iIbnpeu0qJbEV9ptsqWQCU/46RuJv94u+DuK5iMw=;
 b=KJF/ZkIr1lk6COSSzaZafbryVaVIz+QW9Bi9scJ5Rtx3jF/HOqut9RkxEoKqy9HXbm
 8J655P8b33LQ1HCWsKsoGMZUV6Ie0Bd4h/95pK70oQG4E23LzEGNHNMM0jqznCe0DsJb
 pVAHBWeK7bQyLMKnMXwkWeQ8qOtnry+DdzWgYNhVZ6+h4DOXFNy6JwJWJs4/zzwljfqg
 I4VS0WWRVFnX08f24TbmexvrWxcqYdbuDcR3rvhuCzibmPfX9LTIX5DSKuCc+Rc7elid
 WBzpaw5gWvcq+7ofvMRx+jYrELZyUuDsBvRcBOw7rUcxf1xA509HlEAzCq/6W670xQMQ
 Z7BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ+s0WjIjxkapjB2wYGq8/y727Af6ohFmk5ywLzloun6ATNDxlMgPR2fhd0W4Ysao7pgjULuCyqO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+lteYOWzMf71CAPaYhTo3VC2XR0wK2IYNs9dWYkXHdN+dUOQH
 KBExkhQ2L8GvFo+RKhbtOKgoyi5Oo1nDqDwVn8X6sZUToB2EIE6ew4aUbnj870x5xTHnyA7XGUD
 AzZR+qD5R8fesdHoO4sjtLJ1Iz9b/kLALHaAeUF/9PiqQR+7rTr8FbeJ18PMn2u/wD6+N5Ns=
X-Gm-Gg: ASbGncu0P1K20x8bMqN8fPrKxitxN6/sW/B/zstf/NxBsTiMAgm6r5GTCehGYYWlmhO
 Cyw5zTFNfXoaG/pW5n2tUao4c1x9esIesuYxthXGOZh5d5RfqqOTylgekEUB9QpHw4TjkUIhC8m
 vU/74WnxWy5/qUIuZZIuFaGviULdA+YO9oz0EAuBHon3lHz9+/NiBcRtaZokDwPYQ51zPBjlgNf
 KZEOqWj4WGjcA79lZEMhBCi+bAB4H7qEXI9/sW1IhP3hbxOYn8bRsQPhp6lb6pXTpsTEUvJGaVc
 8GA3rdDvL4oVR+ywiM7zkzLM45lD68ik3TPO107Q9xmzEW4=
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id
 d2e1a72fcca58-74af6e509f7mr27760149b3a.8.1751386861780; 
 Tue, 01 Jul 2025 09:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAHQZsjyCDzYg3ZAR09kxywZO5hi/ZzLk8nMbCVYX6mp+IYAjPdk1zCQc7upgp/wjsAy+f3g==
X-Received: by 2002:a05:6a00:b4f:b0:748:e4f6:ff31 with SMTP id
 d2e1a72fcca58-74af6e509f7mr27760072b3a.8.1751386861187; 
 Tue, 01 Jul 2025 09:21:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:21:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Support for Adreno X1-85 Speedbin along with new
 OPP levels
Date: Tue, 01 Jul 2025 21:50:43 +0530
Message-Id: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsKZGgC/2WOwW6DMBBEfwXtuYvWxiXAqf8R5WDspdlDDLWJl
 Qjx73HJpVKPM9K8eRskjsIJhmqDyFmSzKEE/VGBu9rwzSi+ZNCkDXV0wodiTAuzHyXgaNCSa8h
 41fRdA2W1RJ7kcRDPl3eO/HMv4PVdwmgTo5tvN1mHKre1ajE6A38fiwDpT2qpKX8LWh85zKhV7
 62evHHWDNnAL/4qaZ3j8/DP6uAfU0X9P9WskJCo507p8TRp+1W8nARXFxu47Pv+AgG2gXIPAQA
 A
X-Change-ID: 20240807-x1e-speedbin-b4-a0c304d13983
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=2493;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PXhlqE+RLKyz8eL7ircdqym5btkHj/B/miez7UaEoMg=;
 b=8RPMZOE178+e6hz/XUQAKxMLWfSNezm+eVyLA2bm7dQs6OTODAc9guipMaU1GUsXWBff2Q5lZ
 MBzhbGhEwr+DprIPR27QbZOs+kVRos24v4UZSN0NtPB08k9FXyJHQIW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfX2/pcZwUEswUf
 /WiAPciPWTqKkxVNe+phz+I+l1kD7sqAKMztyEqE0qzjnk8PUrU424mixGKNqr4p0Z6rOq7/Z3n
 PexeOvUgLe/WkjgWC72woACwcdyfhHZmxOoYfNHF46ho/NGeyGoNhwwOvTUsyFUV28h+PYV7yZ5
 +mi2LzCoETL+Voug7JCEzn8epOfwZEQ+sdFal3BxR8I+UE0OEwA+XUZm0ndYSt3KJEgmWkMIyHc
 GNGDUl3gEakn5NJ3H6ZUoNIpTU9UYiaDt9nKbuu+qNb+qp2LM2kzfw9jCfDWQ7mdegpjQ0I5KVO
 51v0R2YPtJcHEuXoVYe9CZlwB4kfq7mBjGuJcdNUwJNqRmP93+ZaF2Rg7KuniAll7d83gCsIJvx
 t4bw9FqUAYYd/0UvVnlbnfSB6NYuCgds8M8zb7ANX7j7/A+2JQcc1lMtuNk1We4qIId3eUq/
X-Proofpoint-GUID: KO2P9zL5GuyPChz1nFX7HEw4wRY2RwtW
X-Proofpoint-ORIG-GUID: KO2P9zL5GuyPChz1nFX7HEw4wRY2RwtW
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68640aef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=yFGAn9Q8HXAzXJEDlGEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=960 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010110
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

This series adds gpu speedbin support for Adreno X1-85 GPU along with
additional OPP levels. Because the higher OPPs require GPU ACD feature,
this series has dependency on the GPU ACD support series [1] which is
now available in v6.16-rc1. 

The device tree change has a dependency on both driver and the
dt-bindings update. So those 2 should be picked before the DT change.

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of v6.16-rc4 and Adreno X1-45 series
- Dropped speedbin-hi bit because it is possible to identify the SKU
  using just the 8 bits.
- Dropped the qfprom binding patch as it is already merged upstream
- Link to v1: https://lore.kernel.org/r/20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com

---
Akhil P Oommen (3):
      drm/msm/adreno: Add speedbin support for X1-85
      dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
      arm64: dts: qcom: x1e80100: Update GPU OPP table

 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 57 +++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  7 ++++
 include/dt-bindings/power/qcom-rpmpd.h    |  1 +
 4 files changed, 64 insertions(+), 2 deletions(-)
---
base-commit: 88bf743cabe5793d24f831ef8240a0bf90e5fd44
change-id: 20240807-x1e-speedbin-b4-a0c304d13983
prerequisite-change-id: 20250603-x1p-adreno-219da2fd4ca4:v4
prerequisite-patch-id: 4332cdf1f4257a45ee565eb0fad3af0e814be464
prerequisite-patch-id: 41ffbd1ea7e32b22a90b5d139e5b1c0dc2d38496
prerequisite-patch-id: 8dbc74e0f6c059ebdfe5ab0d883477011953e025
prerequisite-patch-id: 912297c03c5d233f6e38a91c769cc6518bac4411

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

