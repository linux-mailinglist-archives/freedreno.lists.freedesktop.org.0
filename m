Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0342B89E6E
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDC410EA09;
	Fri, 19 Sep 2025 14:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="me6oXFWG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E510EA05
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:14 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JBc35d013713
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=EB6v7KZSrWI/c+6Qaba39U
 ewy2fI4u99KGobQFxuaEU=; b=me6oXFWGBliTytVxG0Q4GsCAwyJGdN0oFrhEbU
 YZdelqfbCvAp3l9Hgzqq+v1IdfBXvD7AwumYdl9ArP6on0NQ/e7YWUrRvtf9CzLh
 isALTYAuTQhw51Hi8upnm23lQ2Mmp4woWm4KNEvB4pGlCQopjhBmkTj0/rMqdGKb
 N8JGwVay4nEq/0aXCcV83p74Dz9010tfR3G+97o5bsb2SXmkACbo0R+EP+mqXyCh
 8xh15ZsG/rBNHr9m8fhYMuz0pDM/xCKmov3BD6YMAPfb42FInx1qvH5X66lSiGjV
 f7IheVOMRgyBWFM+1BilcEZo+Vxo+lFCbLONlp4TW7L6NjAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytqe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2696ab1bc16so4745185ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291904; x=1758896704;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EB6v7KZSrWI/c+6Qaba39Uewy2fI4u99KGobQFxuaEU=;
 b=S8ITSMZmboCxJdCzMyX7anNxcs6bBXeRMAtp/+IMbGPq6d3BSx1WysH8zArE+6AylF
 h57UlcGVMLZ1ExRNwaB8NwqWxUEw2MnnXJnxME0vanEgytQExKbITrzGPezBzuSi+4eq
 TdW2UcfbekBtzmtUClFXTlqtTwVBsu3fPvaUFX1TIAjfgTAytT2LRYrPF8UrO3FTsUqs
 +TpVqL9aeza1YsCv4MzbtB85fpfNnKC6y/ywr1yMls6D1WiZ8Pmfkfq67hccH4joPomq
 3EaAL1oEfl/FyLtMOLztLv9Fo1yAr1x7m3sXkwoBNTY6gUo2gsOqODwMljFUZqjCg+4A
 IYCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmOuJvtQZj0S1bY+9GyvCRmJ7ddttwuZhS6BtGCx9/ziRA90LHxnnXvRi/D+DoYVrBHY64OYT+1gA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpK+IY2zM6pG3w96ZAAql9+gEpho+/WIQnizExsEMFQE7I1TlT
 Yzc2RgMDKrTPlZe0yryLkdVy31ULYRzfEpu77RKllw1Hy/JOtGIe6+9L0RBjbYDzm3JapzTqXaR
 GtGjXTlGfW7ITiWLjdb+HwcKpbUqP4vNNHwZHQeSfw6rKPArIDoZwGgBVQClwhjAOsppSsCE=
X-Gm-Gg: ASbGncvSXH/HvBt/+K1wtcH8csaGnb8EWqvo+vPTj0vTXcqH2AY3SrW3uJ6TAVw4Ypb
 rmM3tV539G6p0JXCpilhQTNHO+xCEmLdx6LQx9Y90zEL52whDxuX6PzF8mNYeSFnKR0BLGtoGeI
 wEj9NIK49ZwgQ7CfSZSP2tg8cz1NuyKXF7BZxK6LHcTf+vle8+sOpvWOwQtBVLhLFpNTxaU9GWr
 0ant8K7JRXvvJpRN1/+rKF0tQ/1qaLfBX9TO6fPPvpZpb3r/j45e1OiHeMb2LzFCIKfRksdjtmG
 i3hqNEisko0lSdaLSg12W8tQuuIh23s6CoC+PneNnRTbOz4uTBJLXOcippGRZ51zOJuUJX/QPGa
 1uzE2KTj9xT19vw==
X-Received: by 2002:a17:902:aa8d:b0:267:bd8d:1b6 with SMTP id
 d9443c01a7336-269ba501141mr19595865ad.6.1758291903669; 
 Fri, 19 Sep 2025 07:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9e7VP28cdUwN8lzlWnixJ5Xu8UcAuFCb9OkPevjxScXEZSW3vj9TXeaqfK3V/6VPSATqm9w==
X-Received: by 2002:a17:902:aa8d:b0:267:bd8d:1b6 with SMTP id
 d9443c01a7336-269ba501141mr19595635ad.6.1758291902969; 
 Fri, 19 Sep 2025 07:25:02 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:02 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v5 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 19 Sep 2025 22:24:17 +0800
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJNnzWgC/5XOwY6DIBSF4VdpWA8N9wKDdNX3mMwCAackVRTUt
 Gl896LJxM3MwhU5kPwfL5J9Cj6Ty+lFkp9DDrErQ36ciL2Z7sfT4MomyFAyDZoa56gLub+bZx/
 TSPPUb2cTEx1s/gRJy9tYZkubqpJSq5pLxUkp9sk34bFpX99l30IeY3pu+Azr7eoIADzmzEAZZ
 doIziunuW+uwxRs6OzZxpas0oy/dckU4rE6lrrAWjCuQEFTXWPO52Ey91Jvd4LvRIXsGMELUb5
 fO5Tecm3/IcROaIBjhCgEKoa1cwaEd38Qy7K8AZPtxqERAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=4929;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=S30Rr40MCfhpxcSOXP+kVSFgcA2a757QcO72sQKavRk=;
 b=TCHWCcb0lNmNKuXXj2ujNV6PVp4ZlA0gy/8bq7ojOvHtv5q7CDT9GARFHcr1iwWvPCLmOw55j
 MjlgRfy2gUBCZ0Xptlg2ECcA8eSfCRH90rUmALPX2i/QKTM1y3KPX6N
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd67c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Y-Wlz9CHQrt7UwghuOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Hx-ps1Kxg6aaTWSz2--7R7YQfzmQwuw5
X-Proofpoint-ORIG-GUID: Hx-ps1Kxg6aaTWSz2--7R7YQfzmQwuw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9P20smY9Sp+m
 1wcYYcs09ViysHgOdDg/99HTb5OrwR2yoKwddEZvIHhlilc0NynbxSaWMCFIN2Gta/idi7mBUGY
 E0grlPKe7dylSM2v8h1uDfQOfzuvQ5RxAuJXt+NX9oMrSk+HJ6TUG95zRgQOKfvlhYUCRsEa/Ic
 HWMk2CcSAwVSfOl4pqs1/+aGeiI0wZ9mWRUTyzv4xI7Q7O2D/GRxZLljDbWFTMB1++YyZvT3evh
 svvOuESbiNA1MoyfE0XIwytr7OlMZI3pIteFY9mmUy7u8U0ZUwhwe1NVzBx/Va9zP+GG4ms1lh2
 ohLpKlptBbLuGj8nQyizqtKqPO78jVsvcroilusoMPH957b/dl2n1gGw7pF0FplLNGkCTaO4I5K
 7T4lGHfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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
      phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
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
 drivers/gpu/drm/msm/dp/dp_link.c                   |  117 +++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v2.h |  106 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v2.h    |   68 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1058 ++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |    3 +
 11 files changed, 1412 insertions(+), 168 deletions(-)
---
base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
change-id: 20250919-add-displayport-support-for-qcs615-platform-f885597b3573

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

