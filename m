Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D1A933B6
	for <lists+freedreno@lfdr.de>; Fri, 18 Apr 2025 09:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8410E17D;
	Fri, 18 Apr 2025 07:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYawam3o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D81E10E17D
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2CcPe023336
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bKVzhfCeIrFWWOfmPDcMy7
 Vsl4v26t9bEenITA2YqYM=; b=AYawam3oN+1YH1X8F4El3ltBTVaaOdrWGSOzmU
 folQrHY/7h48MfzCLtZKPXFu2tFnAfeDHui5IDC64ULxat/SC57jY7YquDFBvEm8
 nJaOKqt+x0f14Fnu+IwCUdVHs9lzR453oMcmjDE0jDbuRsFSDiu3HV+NFOMAvVs2
 rR0NAFjEYtXjDZxDP0jcuwyehwkG0UXbi4o57ROm9lKtnR69vQYG8CpTf+HaxtBJ
 DgEt7y1C4hHQ643EdGi8Re2btQ3acALtmd+Ffacfm64N6o35fhOlWmRDTwUhL1se
 LD617dJhl+oiCELvANWSll/cBoawnl71qGX/XmnbEZ66tc5Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq148b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f2af3128b0so26706156d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962604; x=1745567404;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKVzhfCeIrFWWOfmPDcMy7Vsl4v26t9bEenITA2YqYM=;
 b=cUYzNqQYwzM6egB33QMxxiXnQTSOXib7z3QFaEyC9v0e7IrUuEMGKdUiqjYmG1PANz
 lsTHKg4E8S7q2eWNmwVW3i1JR8UjHsRDUJcFk60lYYLXBLNi0IW0QRNwat/BUJ6Cbt9S
 esBi2Jy1njt37oTSr+jqT4sExs/ZPEEmHJTzSL202d7dY5ZLl/zu2SaiyAUexY+wK4vg
 pif1f3A0snZeORIbg4xVwEoj0NAVRt3ABAeUiypipxNq6O3/gTsjkmC64Jpu9GUKaILL
 g/CGoP5dBXVB8ILf7FcxPjb3QVIxBEfc+YvT/pRGv22U9bh1VN7URGJP+7ysAxLUZVF3
 kD5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNxqgP3iTz0xqFDeSQu6ELvGdszG724K52Ni9DVfd+g0HQVMYt5yE7nCmNWJ1IDGM92nw3C/WeUmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC3uMdHG7/hGXrl5mjbyDyMrO0pEGMApxXpTr87MfYGCMwK4LO
 XV3iZJUc8ISpk/Ra18FrKwvlptkEaxh3jXdakIn9QryyXO8Btgg8wTpBb2Pk3nnJansOrWFO3UU
 zggJxd1VLsKPGs9+2A9AX5Lvl9w8Nib2922C0kNUpBYxYxBhctfv6WkofbfopPS899OE=
X-Gm-Gg: ASbGncs+JoTM/VaZF+nwuIg/0OJGF67LnNABnmcHv4Hdcw6d2Uni4S5wOksz465N+Vi
 xwFOdKnieUsSNCuBVIjjs6v3cLpz0RPKOtoIssEjh3J1nWH3zGJx8BaDjupDSxuw/7dVlksWOTU
 CL9jJ5trAYEPNH+mkFZFQ0lUfAE3Em6bTjgPyWD4OnEzJICSqZzofQIRnTykxB2Vs0K9qExWXoe
 wmRgmy8thR4lI/nk04eDHCHZAosrbFAnxvccx0IFyK7nSCaBJHAHd1iHpc7PNkrbLBDViH2guGN
 xTbdEfgLfh7KfYh8pbC1/ru1niuMjxtJt2dz5VEtrw8C9A4Rth8TUKAJYI4TqzaES7co8hrMfCN
 zpEbAy/AzyHd6M+tjWIWrt3TT
X-Received: by 2002:a05:6214:2427:b0:6e1:f40c:b558 with SMTP id
 6a1803df08f44-6f2c46b74cdmr28503566d6.44.1744962604234; 
 Fri, 18 Apr 2025 00:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBVH5N8S/Y81BfgiRXj+GFCnmldDAJl6DPbZffY+ecp7thLqccxR8nyV9Uby48JD2+X56nDQ==
X-Received: by 2002:a05:6214:2427:b0:6e1:f40c:b558 with SMTP id
 6a1803df08f44-6f2c46b74cdmr28503076d6.44.1744962603719; 
 Fri, 18 Apr 2025 00:50:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Fri, 18 Apr 2025 10:49:55 +0300
Message-Id: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMEAmgC/3XOwW6DMAwG4FdBOS/MdkJHe+p7VDs4ENpIQGhCU
 auKd18Kh/VAL5Z+y/7sp4g2OBvFIXuKYCcXne9TKL4yUV24P1vp6pQFARWgoJSRA6GCQdYuDi0
 /pIEdYFM11igQaW0ItnH3hTz9rjnY6y3J49oUhqOVle86Nx6y3t7H747jaIN4jV9cHH14LA9Nu
 Mx/vj2hBIm1rhQ0WpVEx9b1HHzuw3nRJnoTUG8IlASFDesCiMsCjj7G/Hrj9vVgnsrqqH9HY7H
 hqOTsKN0wWO2B1AdHvzs/G45OjtljXZdMaJA3nHme/wD6twnSuAEAAA==
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MIHhIyG/v+Z0nNaNDXcqReDw20TVwQPwETRu3TF+wvU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQoJmt4xfopyOXHZoDXlTNQWSVgWICe3fZHK
 vWFEMKwdKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1XYMB/9nx5oq7yDsiPquOUtTl0sqVG5EajGGE5lc/M+WU0hOOPvTzPIlGM0Y2OU/9QpzsSPgm9J
 UyF/HOcy7dnV3qq8J3oJnV1dv8/Ro0tmDfblu31dQ4ZyEdcIqptcJ4enQ42bVtvEY/uYVDFG1GG
 SeqCp7zeyB7pTO5RHBelaKsvxtjEyiwlyNyL8hlXaLxiH2kDLiTxstQZWpnimTBzWXvH4bb6nJZ
 3VvadiCYXSgijXE8eOliuLNQ0iq9ndAgGJcxpkYnwZAtBHR9Z8bqpAmjy9w1vkVh0KUKyAqsW9K
 jJSeZ5QrCUly5fdTyLqA7xFsN3STS8SRQwtqmjrZQ++JPxKc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _D1L525msldHccuESkmzqRMDFwAY8rcN
X-Proofpoint-GUID: _D1L525msldHccuESkmzqRMDFwAY8rcN
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6802042d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=gDteT81u2rHlWx3pG9QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
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

Add support for the Mobile Display SubSystem (MDSS) device present on
the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
controller.

Note, due to the technical limitations DP controller wasn't completely
evaluated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Resending without the @linaro.org -> @kernel.org change
- Link to v4: https://lore.kernel.org/r/20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com

Changes in v4:
- Changed MDP->EBI interconnect to QCOM_ICC_TAG_ALWAYS (Konrad)
- Link to v3: https://lore.kernel.org/r/20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com

Changes in v3:
- Use defines for DSI PHY clock indices (Konrad)
- Increas VBIF region size of 0x3000 (Konrad)
- Link to v2: https://lore.kernel.org/r/20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com

Changes in v2:
- In MDSS schema switched from list items to contains: (Krzyztof)
- In MDSS schema dropped extra empty lines (Krzysztof)
- Fixed .ubwc_bank_spread in msm_mdss. (LKP)
- Link to v1: https://lore.kernel.org/r/20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org

---
Dmitry Baryshkov (10):
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
      arm64: dts: qcom: sar2130p: add display nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 395 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1314 insertions(+), 1 deletion(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

