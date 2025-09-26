Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383ABA2B44
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 09:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56F110E9DB;
	Fri, 26 Sep 2025 07:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOmbzYoO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DDF10E9DB
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q77FSZ023326
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=dud8WJNENTmI5gxnKUE5mo
 +sgzvsIU1AqAlFb2/ff4g=; b=jOmbzYoOcF389FUnUJYAwuRjQ4tMNMig09hthU
 W/HdEmhKbPeDGO6974HooNYmQip1WKawnXhYyMvjGlc5MyBrrYgHvtAPttELhJrT
 bbW4trrFtsXJw3EGGF+G2bDlLt0f08H4CiSKh46yv8oQTZIachK95M9NdKWWsJci
 LjiXcw1aAht8ZtRpMJbE1hiIpmb7pxFbjeREu+xXD1st4lXAcsFFcQtemhFoZmwk
 8VYb++/FECvu//MbGsRADUE2t3xg4IRGiF7JV5IjfDq/mvNaD3W8fblXkGdC4U8b
 vfWUKFU2Z5T336aEy8sMmIEFIrRFZSxJG1U+6un2iY0lW/IQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qsvfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26b7fc4b7e3so4835325ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871573; x=1759476373;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dud8WJNENTmI5gxnKUE5mo+sgzvsIU1AqAlFb2/ff4g=;
 b=bIaFPG1Hy5eRmiCaH8ZPNH1WLmbY49M0FzfmX4p2/AjI5ODo7FaQu6+oG/yo74mtGV
 CKFJdsJCZEq68G1AhZY/W1G8kH17tMxQaQphb9eF20EuhCYhpfJwui/cLRgRfWNXM7+b
 8Fl0wnd0tHqTDX5nDzSZTvdIs1Do1/c7kkrTHXmn+DoNfVTxhW2yq8yTl2xO0KLrMFJA
 mvaz+QkRIwn4DokmpT4v8AGs83fL97XiLfxS/OaaafT4q2J/QgxVxYb4t6fK6iiQrl7c
 J0yjB11IuHV4w4/jl16t+OTReEWGCj1kgXl213myN2xoZ4p+N9bN1IEsre2laAViclws
 A5AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV23fwMoRcVh96PQsTPrGFUC0rsbTf2iInzw+TjChN2J3y4nRouE9y3W6YnnEfZzZ5VLxkT3UJm3MI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCdFEOI3J1xW663ImJQ/i8ShtQl/A12y9WbqtEoNdndm6dB9yc
 gwwhD5FQX5M+/AkbspKSHNGsdoyJ2snlEpoCNxQ3OGm343eL8IGRv/YBAv/P4QLXRaDkjZuaFtf
 tYg0C5Q3w8rTUSVcjTfJNJ1n/naImbu84/JjjU0wAOb+9iiO7qXXmqTx/b8r9HiZOn9D5tGUoxo
 KQPZJQNg==
X-Gm-Gg: ASbGncuzUd/7FNTZqwPh2oYiOpO7E0Gcp9QGn02LGsNe5016xFlPdaHpycF56xLTB6B
 O/YbNsL9DBKVFd8cHHV0Mj75e6Wy6vSDGn8s+boW4Ziizg0kNBMNBKd5zRk+MSfQoSq1qzMXRCE
 2Mz9/LvCDO+1vcO+OB8vVX46aV6uBpfMrfnXtMtmh/IgBgMdBh1FQLJYdJiKARQoRq7+n5e+xfE
 yUU1NCL1kxqw/BchzrbDr60vr0ZogJtDWNtKYZJIvVX67xzeMDCPPI+S8/Qzg89FLm6+TlS0M/3
 hUL7Tey0LC/UzhIqvXVE0UpWsEnARuIHAXcA/Xb3/vmn8y7FPM1pPPyL5UWLL8DA5zJoHbbK2sG
 Lvc1aw4yu8Sr/mJVlrGGXCm/jKVoBP4OWwJAtqmIrag89VdfKCwBebIHX
X-Received: by 2002:a17:903:2341:b0:257:3283:b859 with SMTP id
 d9443c01a7336-27ed4a47a07mr38672795ad.9.1758871572574; 
 Fri, 26 Sep 2025 00:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6gfLG3g7l3wZ67mkycPSyt36CZJqPFSpdlPEG8XiWyzxlncH2l4wJA2fUOLl0HLc9gG5qqg==
X-Received: by 2002:a17:903:2341:b0:257:3283:b859 with SMTP id
 d9443c01a7336-27ed4a47a07mr38672575ad.9.1758871572067; 
 Fri, 26 Sep 2025 00:26:12 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:11 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 26 Sep 2025 15:25:36 +0800
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPM/1mgC/5XRz4rDIBAG8FcpntfijBq1p77Hsgfjn63Q1DS2Y
 Uvpu68JLOlhc8hJPge+38A8SQlDCoUcdk8yhDGVlC81qI8dcSd7+Q40+ZoJMpTMgKHWe+pT6c/
 20efhRsu9n9+YB3p1pQFJ6+xWY0ej1lIa1XKpOKmN/RBi+pm1z6+aT6nc8vCY8RGm38kRALjNG
 YEyyowVnGtveIjH6z25dHF7lzsySSP+tUumELe1Y20X2ArGFSiI+phL2V/v9lzbu4XgC6GRbSN
 4Jer6rUcZHDduhRALYQC2EaISqBi23lsQwa8Q8p3YeAZZiWBD02iIgjFcIZo3AuU2opluASYGa
 RquwfxDvF6vX7s/6DfXAgAA
X-Change-ID: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871562; l=5625;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=YPasll5NQP6TVIaoA2rYTgUFmw5RRjjIlz3VdB4qxWU=;
 b=2LVd7ANysco9u/gEASSF1mlgveF/gQTbuuMOj3m6iaQ5teJqwkL9kUDMdyVJ6HODH8UZA4dS6
 kR8CdvESMCmDUKy8f44E9UVsAeA2/W30sm4xS75w6nvKhT5ssRDrfZa
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: lTFSb3fPpvyHD9ZkzozfhrKJ20GPDehu
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d64015 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=-mfqEiHr7Cy1ujZptoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9nEYCTxOX8lP
 BFKYMupmtd5qfdahQLpKufKwuyIOiq3SWe/V0h7CbEDdyZxJqARk005II91ozxAVSBRv1IroMwj
 /HFN1c6Ya4kyfNGQfP6jXqCk39tZkPPvdyTw3dgKimcYa2JfnHjK4GsRAKH+yHT/oj/xMOwIXW/
 4Tj/ubhsqBWZ252xDJfs57xnBjCRsDA/tlimp1026lz5ekn9LjtMBu+Pfm8lkjqg+RIq72TKioX
 1+0WNXxdmoQ0a9KHYyQ9uZq8WOOdk0reYpjykEXuNRQRzjefedBxpJgnapB4uIqR/6KSZCsh/VN
 5SyZEMBhnR7dxZc2Hls87VXqCiNJ9xG4LVkyFRgsCHRmWN8Q8jzSRYKOtvB5+rMcH6QLd3wDzC1
 nmWnHKaTb1AHgDhmZ0bLnbxDOwyB5Q==
X-Proofpoint-GUID: lTFSb3fPpvyHD9ZkzozfhrKJ20GPDehu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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
Changes in v7:
- Fix QSERDES_V2_TX_LANE_MODE_1 configuration from COM init table to configure_dp_tx().
- Link to v6: https://lore.kernel.org/r/20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com

Changes in v6:
- Move usb3dpphy_reset_l definition to the patch adding compatible and related config data. [Dmitry]
- Add NOTE about SW_PORTSELECT/orientation handling. [Dmitry]
- Use C99-style loop variable declaration in msm_dp_link_lane_map. [Rob]
- Update commit msg with issue description for [05/14, 06/14, 07/14，12/14].
- Link to v5: https://lore.kernel.org/r/20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com

Changes in v5:
- Add new patch to introduce QSERDES v2 COM/TXRX register headers.
- Restore legacy reset & clock register logic. [Dmitry]
- Update phy_xlate() to return ERR_PTR(-ENODEV) when dp_phy is NULL. [Dmitry]
- Rename helper from qmp_check_mutex_phy() to qmp_usbc_check_phy_status(). [Dmitry]
- Drop storing struct device *dev in dp_link as it is only used once. [Dmitry]
- Add robust lane mapping: default 1:1, complete partial configs. [Dmitry]
- Reorganize sub-patches v5[07/14， 08/14, 11/14， 12/14] as suggested.
- Link to v4: https://lore.kernel.org/all/20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com/

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
Xiangxu Yin (14):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY
      phy: qcom: qmp-usbc: Move USB-only init to usb_power_on
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP exclude handling
      phy: qcom: qmp: Add DP v2 PHY register definitions
      phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  118 +++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1072 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 11 files changed, 1427 insertions(+), 168 deletions(-)
---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

