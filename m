Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CAB53649
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554210E0E1;
	Thu, 11 Sep 2025 14:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vbwgb9Td";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D671910E374
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:41 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEFOL002402
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=/xEH5bhCDH+EambDfpLJYH
 Y3ZvSSk+a6Bg2AG4xJvXg=; b=Vbwgb9TdPNDtgBEwlILTgizCBFoyQZMLbK8YNT
 aZskG1U1ETHPXOu5q3lbmVNLrhyY1HhHUXLgzwzSUaLXz9ZnNEb58fJmxlEGKTau
 6ItEWpHsKyug6iIIofMBYq4oM9/2OV9o94Vuw5OwQ0O2olDLx8vYMbTZl/5uAmWN
 7Y+xA8zGXUAg0Lky8fnEbRyGA12WxEVjL6mmpd0EAKIIrBJrcU+A+qJPkN7zpuV2
 QQVQoFgk1EZbufMY66eoUb0e5549UliLC8+CYywpd0Cgc2mDvxZhGOqwSsiN7EEA
 yaxi4ZAEksYoqUrSiFC4eSjMUJWaSEko9YJMzVfDTDH7Iz6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsg9ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:50:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-329df266fe2so221232a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602240; x=1758207040;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xEH5bhCDH+EambDfpLJYHY3ZvSSk+a6Bg2AG4xJvXg=;
 b=RsPn+/azWp0UbHQfIc6DNH4/Z+Ok+0Snp9XdPeymPoLZ8uX8hk0ihCA0kM4pBJJqz1
 B/jPAxsxwzcABl4vQzdyGFkiyqEPrM/fgyB/3xsyIXQkg9iSHIgakCVPqSTXUkAUYzft
 labPOFy0CppNDNtvMdPYvQlb6kOIG2DHPrrBGu5HIV50jg3X2DDGf0uTw9iu5xXqN37G
 nykrAOpt79ZwyvHPb67p/55bAii6GOWjB4QqNTfV3lZFk6FbFEHvzmFDTI97ufpYaLAj
 Of5mwb4fSKoxE4D7wwCrA0aoUbdkMOhW3K89jlq1y/nBEofOWYs1eTSLilQKBI7dSDpE
 IdUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX99nUICv6E2vjO6orvQKrYpz9CuNgNzzgtz0kv+XqNgSpiAXVQjcywmG/Lnr2RQdWrCrHg0eQIIzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6kkvugpxWVKFuDHomlU4RLSgDckGGTh3eOIjM5p8ztEAJYVjH
 wSOXRHBgEo25YGk7eZ1OivLCTrmJ7B9/iRtWtSW1IB554/XTWKD3qErGOccE1rW5yF0SwWckAA8
 bP3jvjGLybyijxOFo2afY5dQlUlFapOpbNaW48TG3CIbro++03HlBry2y0nXPSiIBUkOcRVI=
X-Gm-Gg: ASbGnctmUmVcf4Kvcw19BlZrYsGw9y1aqosPltHnEyDfap0XsqO4ekojiEsvibcBGKM
 1cTQcuhVTOqjRm9MiNv7nfgQilIrmWfIgdvTZIaPT9VCegc0GKhcsrFfK1SX6mX4FIVItCXRq9d
 0by1uiDkqr/smrHDeIB2YaJkM0ISGcAHOT31JuXhMGKQ9FeTX7a1wuNikY+JcG5ND1bYgb8kA4S
 BN2wwhD/idcwOfLWytar7kzX87L0wat72mcV67j7OzdxeQgAg4rsVjIgUgT+aqA3ozT+xBNmBKQ
 mlini4SQ5mXxnVzxOGWIS8onw0hJEOGdD09QeqCJZGZWK2BC6MG2b3BypNIC0FdGVZrrADg1dHk
 uA+qNUYUPcUOwxOcjuyFCcQWKsRHq4PCWXlpbl2VB2Z7+EIqByjF7ou7M
X-Received: by 2002:a17:90b:33d0:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-32d43e11bcemr12961222a91.0.1757602240197; 
 Thu, 11 Sep 2025 07:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiDHS8WTe48sZ+5y9L/B0ypbKllzVCvSYx+GkBixPPnAxR1xtVluwi00iOjWP7C4GYyo7pqA==
X-Received: by 2002:a17:90b:33d0:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-32d43e11bcemr12961197a91.0.1757602239708; 
 Thu, 11 Sep 2025 07:50:39 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd6307590sm2934648a91.16.2025.09.11.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:50:39 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v4 00/13] (no cover subject)
Date: Thu, 11 Sep 2025 22:46:07 +0800
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-0-177348170c2d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALHgwmgC/5XOTW6DMBAF4KtEXteRZ2wK7ir3qLIw/mksBQw2o
 EQRd++AVGXTDavRm5HeNy9WfI6+sK/Ti2W/xBJTT0F9nJi9mf7H8+goMxRYCQ3AjXPcxTLczXN
 IeeJlHvYZUuajLZ9QcbpNFDuOQdTosTUoNaPGIfsQH7v2faV8i2VK+bnjC2zbzVEAqA85C3DBh
 TZKysZp6cNlnKONvT3b1LFNWvCvvaKX8Fg7UrvCVglZQw2huaRSzuNs7tTevQn5JhoUxwhJBL3
 fOqy8ldr+Q6zr+gsijr6+rgEAAA==
X-Change-ID: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602231; l=4013;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=PxQ+Nl+6gXCfV0SnVCZ6IaDcnEi2VND1S9/H0brbNM8=;
 b=ASVtpO3j3ss865EQa+slC1BIbpK4AuajgD50RsGYQ2UDxDcHtA5P/cICIkaBsEeXjJ2v15if3
 NeNejHOckv9DEB7lLy4re35wi+qcLTngu1WPzMW2V7v/JDgrFgx35Tf
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: MjRTUm6afGUblUN_Dq4N0kz-GHlizWZL
X-Proofpoint-GUID: MjRTUm6afGUblUN_Dq4N0kz-GHlizWZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX+KEw7aybNsG0
 yQX2z3XkfzpqL8gdt5cmAEtsGTA640RR2BIxr5xaeRCy7blY+AUkSLJigELij9a8hUSD9XSMDlr
 zFh0TLl18c/V6RawBD61KFS8d4lh/70jgplWJ3OwAAIuYTi3qoMtoAO80U99fVDECu9Q7/+zUHe
 svuxr5qkuFtzIfZ0Ev01qp/Xwk51fzA3e/k5xBmnqg2ULyU6iQhaT19PxCMFwR5F0drn6tDDaLH
 pXNFzwURog/Ng09VEoXgWrE/l8LcDRYZx0maz4qRiOb97olAi1visfZLeWitahHDDpme+LFnd7G
 13IPAkPSRH+qvEh5BP+WHc8nXifVefFVev37XoEzc8/gFkERdr1IeeOwxr2r2cB/nKefvmIz70u
 02jbchkd
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2e1c1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NhqbsNcZucgFEQMbMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v4:

- Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
- Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
- Add missing aux and pipe clocks. [Dmitry]
- Drop second TCSR phandle; register offsets are described directly. [Dmitry]
- Add USBC PHY series related init_load_uA configs. [Dmitry]
- Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
- Reorganize sub-patches as suggested.
- Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/

Changes in v3:

- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
- Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:

- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (13):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
      phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP mutex handling
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1089 +++++++++++++++++---
 8 files changed, 1192 insertions(+), 196 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

